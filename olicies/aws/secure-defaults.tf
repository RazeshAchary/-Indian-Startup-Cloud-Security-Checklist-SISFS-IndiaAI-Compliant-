# --------------------------------------------------------------------------
# PROVIDER & REGION BINDING (DPDP ACT ALIGNMENT)
# --------------------------------------------------------------------------
provider "aws" {
  region = "ap-south-1" # Hardcoded default to Mumbai, India region
}

# --------------------------------------------------------------------------
# CUSTOM ENCRYPTION KEY (AES-256 CUSTOMER MANAGED KEY)
# --------------------------------------------------------------------------
resource "aws_kms_key" "startup_kms_key" {
  description             = "KMS Key for encrypting startup citizen data at rest"
  deletion_window_in_days = 30
  enable_key_rotation     = true # Mandatory for security compliance audits

  tags = {
    Environment = "Production"
    Compliance  = "DPDP-Ready"
  }
}

# --------------------------------------------------------------------------
# SECURE DEFAULT S3 BUCKET CONFIGURATION (PII & DATA STORAGE)
# --------------------------------------------------------------------------
resource "aws_s3_bucket" "secure_data_bucket" {
  bucket        = "startup-india-secure-data-bucket-${random_id.server.hex}"
  force_destroy = false # Prevents accidental deletion of production data

  tags = {
    Compliance = "DPDP-Residency-Local"
  }
}

# 1. Block all Public Access explicitly (Auditor Checkpoint #1)
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.secure_data_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 2. Enforce Server-Side Encryption using the KMS Key
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.secure_data_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.startup_kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# 3. Enforce TLS 1.3/HTTPS Only for Data in Transit
resource "aws_s3_bucket_policy" "enforce_tls" {
  bucket = aws_s3_bucket.secure_data_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "EnforceHTTPSOnly"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.secure_data_bucket.arn,
          "${aws_s3_bucket.secure_data_bucket.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

# --------------------------------------------------------------------------
# SECURE DEFAULT DATABASE CONFIGURATION (RDS POSTGRESQL)
# --------------------------------------------------------------------------
resource "aws_db_instance" "secure_database" {
  allocated_storage       = 20
  engine                  = "postgres"
  engine_version          = "15"
  instance_class          = "db.t4g.micro" # Cost-effective Graviton instance for startups
  db_name                 = "startup_prod_db"
  username                = "db_admin_user"
  password                = var.db_password # References a variable; never hardcode passwords!
  skip_final_snapshot     = false
  final_snapshot_identifier = "startup-prod-db-final-snapshot"

  # Auditable Security Presets
  storage_encrypted   = true
  kms_key_id          = aws_kms_key.startup_kms_key.arn
  publicly_accessible = false # Never expose production databases to the open internet
  
  # CERT-In Aligned Logging & Monitoring
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  backup_retention_period         = 30 # Retains automatic backups for audit security

  tags = {
    Environment = "Production"
  }
}

# Helper to generate unique bucket names safely
resource "random_id" "server" {
  byte_length = 4
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

# 1. Define the IAM Policy using the JSON file from the repository

resource "aws_iam_policy" "enforce_mfa" {
  name        = "Enforce-MFA-Policy"
  path        = "/"
  description = "Denies all AWS actions across the infrastructure if the IAM user is not authenticated with MFA."

  # Points to the local path where you saved the JSON policy file
  policy = file("${path.module}/aws-mfa-enforcement.json")
}

# 2. Create your Core Engineering / Developer Group

resource "aws_iam_group" "engineering" {
  name = "engineering-team"
  path = "/users/"
}

# 3. Securely bind the Policy to the Engineering Group

resource "aws_iam_group_policy_attachment" "attach_mfa" {
  group      = aws_iam_group.engineering.name
  policy_arn = aws_iam_policy.enforce_mfa.arn
}

# 4. Attach the Residency Policy to the existing Engineering Group
resource "aws_iam_group_policy_attachment" "attach_residency" {
  group      = aws_iam_group.engineering.name
  policy_arn = aws_iam_policy.enforce_india_residency.arn
}

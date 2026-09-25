# 🗺️ System Architecture & Data Flow Blueprint
**Compliance Target:** SISFS Milestone Clearance / IndiaAI Grant Disbursement Audit  
**Classification:** Confidential — Internal Verification Only  

---

## 🏢 1. Company & Project Overview
* **Startup Name:** [Insert Startup Name]  
* **Incubator Hub / Node:** [Insert Incubator Name, e.g., IIT Madras Incubation Cell / T-Hub]  
* **Grant Scheme:** [ ] Startup India Seed Fund Scheme (SISFS) / [ ] IndiaAI / [ ] MeitY Grant  
* **Current Funding Tranche / Milestone:** [e.g., Milestone 2 Payout Vetting]  
* **Core Technical Stack:** [e.g., Next.js, Python FastAPI, PostgreSQL, AWS]  

---

## 🌍 2. Infrastructure & Data Localization (DPDP Act Realization)
*To comply with the Digital Personal Data Protection (DPDP) Act, all primary citizen data, production logs, and training assets must sit within sovereign Indian regions.*

* **Primary Cloud Provider:** [AWS / Google Cloud / Azure]  
* **Primary Hosting Regions:**  
  - [ ] `ap-south-1` / `ap-south-2` (AWS Mumbai / Hyderabad)  
  - [ ] `asia-south1` / `asia-south2` (GCP Mumbai / Delhi)  
  - [ ] Other Sovereign Indian Data Center: [Specify]  
* **Geographical Enforcement Mechanism:**  
  *Describe how you enforce this programmatically. Example: "We use programmatic IAM guardrails (`s3-india-residency-only.json`) to block database and compute deployments outside sovereign Indian borders."*

---

## 🔒 3. Data Processing & Encryption Flow
*Provide a high-level map tracking how user data travels through your platform securely.*

### 🛠️ Data-In-Transit Architecture
* **API Endpoints Protocol:** All public APIs enforce TLS 1.3. Port 80 (HTTP) traffic is explicitly dropped at the Load Balancer layer.  
* **External LLM / Third-Party Routing:** [Specify if user inputs travel outside India to APIs like OpenAI/Anthropic, and highlight active data-privacy agreements or localized proxy endpoints].  

### 🗄️ Data-At-Rest Architecture

| Component | Storage Engine | Encryption Standard | Key Management |
| :--- | :--- | :--- | :--- |
| **Primary Database** | [e.g., RDS PostgreSQL] | AES-256 | [e.g., AWS KMS / Customer Managed Key] |
| **Object / File Storage**| [e.g., S3 Buckets] | AES-256 | [e.g., AWS KMS Key] |
| **AI Models & Training Data**| [e.g., EBS Volumes] | AES-256 | [e.g., Default Provider Key] |
| **System Backups** | [e.g., Automated Snapshots]| AES-256 | [e.g., Shared KMS Key] |

---

## 🗂️ 4. Identity Isolation & Audit Logging (CERT-In Aligned)
*Our operational logging frameworks ensure complete audit trails for security verification.*

* **IAM Multi-Factor Authentication (MFA):** Enforced globally for all developers and service accounts across the enterprise cloud organization via Infrastructure-as-Code policy.  
* **Central Log Aggregator Engine:** [e.g., AWS CloudTrail / GCP Cloud Logging]  
* **Log Retention Window:** [Minimum 90 days required] days.  
* **Log Write Protection:** Access logs are isolated in a Write-Once-Read-Many (WORM) target bucket, preventing alterations by running code blocks or operational roles.  

---

## 🛡️ 5. Vulnerability Management & VAPT Summary
*Our code pipeline utilizes continuous testing loops to isolate infrastructure anomalies.*

* **Automated Pipeline Checking:** [e.g., Pre-configured Gitleaks scanner running on all Pull Requests]  
* **Last VAPT Scan Conducted On:** [DD/MM/YYYY]  
* **VAPT Auditing Body:** [Specify name; Highlight if they are a CERT-In Empanelled security partner]  
* **Remediation Status:** [ ] All Critical/High flaws fixed / [ ] No open vulnerabilities present.  

---

## ✍️ 6. Technical Leadership Sign-Off
By signing below, the engineering leadership team verifies that the current live production layout maps accurately to the security guardrails outlined in this document.

* **Prepared By:** [Name], CTO / Lead Architect  
* **Signature:** ___________________________  
* **Date:** [DD/MM/YYYY]  

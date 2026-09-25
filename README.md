# 🇮🇳 Indian Startup Cloud Security Checklist (SISFS & IndiaAI Compliant)

[![License: MIT](https://shields.io)](https://opensource.org)
[![Security: CERT-In Aligned](https://shields.io)](https://cert-in.org.in)
[![Compliance: DPDP Act](https://shields.io)](https://meity.gov.in)

A practical, production-ready cloud security checklist designed specifically for early-stage Indian startups receiving government grants (**Startup India Seed Fund Scheme (SISFS)**, **IndiaAI**, or **MeitY** funding). 

Adhering to these checkpoints helps technical teams eliminate infrastructure vulnerabilities, align with domestic data laws, and successfully pass incubator technical evaluations to avoid disbursement delays.

---

## 📋 The 5-Point Core Checklist

### 1. Identity & Access Isolation
*Early-stage teams often share credentials to move fast. Auditors flag this immediately as a systemic risk.*

- [ ] **Enforce Global MFA:** Multi-Factor Authentication must be mandatory for all root and Identity & Access Management (IAM) accounts on your cloud provider (AWS, GCP, Azure).
- [ ] **Principle of Least Privilege (PoLP):** No developer or third-party tool should hold permanent blanket admin rights. Isolate production environments from staging/dev access.
- [ ] **Credential Hygiene:** Ensure zero hardcoded keys or database passwords exist in source repositories. Implement a secrets manager (e.g., AWS Secrets Manager, HashiCorp Vault).

### 2. Data Residency & Domestic Localization
*India's Digital Personal Data Protection (DPDP) Act and public funding guidelines mandate strict accountability regarding where citizen data resides.*

- [ ] **Domestic Hosting:** Set up all primary databases, object storage (S3 buckets), and compute instances exclusively within sovereign Indian regions (e.g., AWS Mumbai/Hyderabad, GCP Mumbai/Delhi).
- [ ] **SaaS Pipeline Audit:** Verify that telemetry, customer support chats, or transactional logging tools do not route or cache unencrypted PII (Personally Identifiable Information) outside Indian borders.
- [ ] **AI Model Guardrails:** If leveraging external LLM APIs for IndiaAI projects, ensure enterprise data privacy clauses are active and inputs are not utilized for public training pipelines abroad.

### 3. Data Encryption Standards
*Unencrypted internal data traffic or unprotected storage buckets are the most common triggers for failing an external milestone audit.*

- [ ] **Encryption at Rest:** Enable AES-256 encryption across all storage volumes, managed database instances, and archival backups.
- [ ] **Encryption in Transit:** Enforce TLS 1.3 across all public and internal service communication. Drop support for legacy SSL/TLS versions.
- [ ] **Forced HTTPS:** Configure load balancers and CDNs to explicitly block or redirect HTTP traffic (`Port 80`) to HTTPS (`Port 443`).

### 4. CERT-In Aligned Audit Logging
*When a security incident or institutional audit occurs, you must possess immutable proof of infrastructure access logs.*

- [ ] **Centralized Trails:** Enable continuous audit logging engines (e.g., AWS CloudTrail, GCP Cloud Logging) across the entire cloud organisation.
- [ ] **Retention Mandate:** Configure log retention policies for a minimum window of **90 days** locally, ideally shipping them to a centralized, read-only SIEM target.
- [ ] **Write-Once-Read-Many (WORM):** Lock down the log repository so that compromised operational accounts cannot purge or manipulate history logs.

### 5. Vulnerability Management & VAPT
*Government panels require objective, independent validation that your system scale is structurally resilient.*

- [ ] **Automated CI/CD Scanning:** Integrate Static Application Security Testing (SAST) tools into code deployment pipelines to catch vulnerabilities pre-build.
- [ ] **Independent VAPT Report:** Schedule an annual or milestone-linked Vulnerability Assessment and Penetration Testing (VAPT) exercise.
- [ ] **CERT-In Empanelled Vetting:** To drastically accelerate technical milestone sign-offs, clear your VAPT through a certified, CERT-In empanelled security auditor.

---

## 🛠️ How to Use This Repository

1. **Fork this Repo:** Create a private or internal copy for your dev team.
2. **Track Progress:** Turn the items into GitHub Issues to assign specific security actions to your engineering sprint cycle.
3. **Audit Submission:** Export your completed checklist alongside your VAPT report as documentation for your Incubator's Investment Committee (ISMC).

---

## 🔗 Official Compliance Resources

* [Startup India Seed Fund Portal](https://startupindia.gov.in)
* [Ministry of Electronics and Information Technology (MeitY)](https://meity.gov.in)
* [Indian Computer Emergency Response Team (CERT-In)](https://cert-in.org.in)

---

## 📄 License

This resource is open-source and distributed under the **MIT License**. Feel free to adapt, modify, and distribute it to support the Indian startup ecosystem.

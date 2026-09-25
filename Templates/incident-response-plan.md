# 🚨 Cybersecurity Incident Response Plan (IRP)
**Compliance Target:** CERT-In Cyber Security Mandate Compliance  
**Classification:** Confidential — For Internal Response Teams Only  

---

## ⚡ EMERGENCY CRITICAL MANDATE: THE 6-HOUR WINDOW
> **CRITICAL LEGAL NOTICE:** Under the Indian Computer Emergency Response Team (CERT-In) cybersecurity directives, specific cyber security incidents **MUST be reported to CERT-In within 6 hours** of notice or identification. Failure to report can result in regulatory non-compliance and freeze existing government funding tranches.

* **Official CERT-In Incident Reporting Email:** incident@cert-in.org.in
* **Official Reporting Portal:** https://cert-in.org.in
* **Emergency Hotline:** +91-11-24368572 / +91-1800-11-4949

---

## 👥 1. Cyber Security Incident Response Team (CSIRT)
In the event of an anomaly or data leak detection, the following personnel assume absolute administrative control over the company's infrastructure.

| Role | Primary Assigned Personnel | Contact Number | Backup Contact |
| :--- | :--- | :--- | :--- |
| **Incident Commander** | [e.g., CTO / Lead Architect] | [Insert Phone] | [Insert Alternate] |
| **Infrastructure Lead**| [e.g., Lead DevOps Engineer] | [Insert Phone] | [Insert Alternate] |
| **Legal & Privacy Officer**| [e.g., CEO / Legal Advisor] | [Insert Phone] | [Insert Alternate] |
| **PR & Communications** | [e.g., Operations Head] | [Insert Phone] | [Insert Alternate] |

---

## 🔄 2. Incident Phase Protocols

### Phase 1: Identification & Triage (T-Zero to T+1 Hour)
* [ ] **Isolate Anomalies:** Verify monitoring alerts (e.g., CloudWatch, CloudTrail logs) showing anomalous traffic spikes or database modifications.
* [ ] **Determine Blast Radius:** Identify whether the breach affects production servers, PII datasets, LLM pipelines, or third-party integrations.
* [ ] **Log the Event:** Record the precise timestamp, vector of entry, and active systems compromised in the internal security tracking log.

### Phase 2: Containment & Eradication (T+1 to T+3 Hours)
* [ ] **Revoke Leaked Secrets:** If the breach was caused by an API leak, rotate database passwords and revoke the compromised credentials immediately via your secrets manager.
* [ ] **Network Isolation:** Sever network routes to the infected containers or EC2 virtual machines. Implement emergency security group rules blocking all unauthorized incoming public traffic.
* [ ] **Apply Guardrails:** Force an immediate global user logout and verify that `aws-mfa-enforcement.json` is working smoothly to block access across unverified team accounts.

### Phase 3: Reporting & Legal Compliance (T+3 to T+6 Hours)
* [ ] **Draft the CERT-In Report:** Compile the technical incident profile containing:
  * Time of occurrence and system components compromised.
  * Types of data or PII exposed.
  * Corrective containment actions executed by the team.
* [ ] **Transmit Report:** Electronically submit the details to `incident@cert-in.org.in` before the **6-hour legal limit** expires.
* [ ] **Incubator Status Update:** If the system breach significantly impacts core deliverables or citizen data, notify your designated Incubator Program Manager to transparently outline the mitigation status.

### Phase 4: Recovery & Post-Incident Review (Post-Breach)
* [ ] **System Restorations:** Re-deploy clean compute layers via Terraform code pipelines using `secure-defaults.tf` blueprints.
* [ ] **Post-Mortem Analysis:** Run a root-cause evaluation to find out why the vulnerability existed.
* [ ] **Remediation Testing:** Commission a fresh, focused VAPT audit scan across the affected endpoints to verify complete systemic eradication.

---

## 📝 3. CERT-In Incident Form Draft Sheet
*Keep this snippet pre-filled with your structural metadata to accelerate transmission during an active security incident.*

```text
To: incident@cert-in.org.in
Subject: Incident Reporting - [Insert Your Startup Corporate Name Here]

1. Name of Organization: __________________________________________________
2. Location of Affected Infrastructure: [e.g., AWS Region ap-south-1 (Mumbai)]
3. Date and Time of Incident Identification: ____/____/2026, ____:____ IST
4. Nature of Incident: [e.g., Data Leak / API Key Compromise / Unauthorized Access]
5. Number of Systems/Accounts Affected: ___________________________________
6. Chronology of Events & Remediation Taken: 
   - [Timestamp]: Incident detected via log monitoring.
   - [Timestamp]: Compromised infrastructure endpoints completely isolated.
   - [Timestamp]: System secrets and credentials fully rotated.
7. Contact Details of Security Node Officer: [Name, Designation, Phone, Email]
```

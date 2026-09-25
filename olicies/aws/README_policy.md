🚀 How to Implement This Policy Log into your AWS Management Console as an Administrator.

Navigate to IAM (Identity and Access Management) > Policies > Create Policy.

Click the JSON tab, paste the code block above, name it Enforce-MFA-Policy, and save it.

Go to IAM Groups or IAM Roles, select your developer group (e.g., Engineering-Team), and attach this policy.

🛠️ Deploying MFA Enforcement via Terraform 

Instead of manually configuring IAM policies, you can manage this global security guardrail natively via Terraform. This ensures that every new developer group or role created in your infrastructure inherits the MFA requirement automatically.

When spinning up your actual databases and storage layers, use secure-defaults.tf as a baseline template. It automatically applies the precise bucket isolation, TLS settings, and India-region parameters required to clear your Incubator milestones.

1. The Terraform Implementation Code (mfa_enforcement.tf) 
``
Create a Terraform file in your infrastructure repository and add the configuration. It reads your raw JSON policy block and binds it to an IAM group.

2. How to Initialize and ApplyInstruct developers to run the standard deployment workflow in their terminal:bash

terraform init  # Run it from the directory where you place your main.tf

terraform plan  

terraform apply


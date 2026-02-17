# AWS S3 Provisioning with Terraform & GitHub Actions

This project automates the provisioning of **Amazon S3 buckets** across **development** and **production** environments using **Terraform** and **GitHub Actions**. It demonstrates best practices in CI/CD, IAM role management, state locking, and infrastructure drift detection.

---

## 🚀 Features

- **Environment-specific deployments**: Dev and Prod S3 buckets are managed separately.
- **Terraform state locking**: Prevents concurrent updates using **DynamoDB locks**.
- **GitHub Actions CI/CD**: Automated Terraform plan and apply workflows triggered by pull requests and merges.
- **Drift detection**: Identifies manual changes outside Terraform to maintain consistency.
- **Secure IAM role usage**: Fine-grained permissions, including explicit S3 metadata actions (CORS, logging, replication, versioning).

---

## 📂 Project Structure

envis/
├─ dev/ # Terraform code for Dev environment
├─ prod/ # Terraform code for Prod environment
└─ modules/
└─ s3-bucket/ # Reusable module for S3 provisioning


---

## ⚙️ Prerequisites

- AWS Account with IAM Role for GitHub Actions
- Terraform >= 1.3.x
- GitHub repository with Actions enabled
- AWS CLI configured for local testing

---

## 🛠️ Setup & Usage

1. **Clone the repository:**

```bash
git clone <repo-url>
cd envis

2 Initialize Terraform:
cd dev
terraform init

3 cd dev
terraform init
CI/CD automation handles this via GitHub Actions workflows for pull requests and merges.

🔐 IAM Role Considerations

Explicitly include S3 metadata permissions: GetBucketAcl, GetBucketVersioning, GetReplicationConfiguration, GetBucketLogging, etc.

Assign environment-specific access for dev and prod to prevent accidental cross-environment changes.

💡 Lessons Learned

Concurrency is essential: Use workflow concurrency in GitHub Actions to prevent Terraform state conflicts.

Explicit S3 permissions: Generic bucket actions are insufficient; metadata permissions must be declared.

Drift detection improves reliability: Catch out-of-band changes before they cause errors.

Infrastructure Teardown (Destroy Workflows)

This project includes explicit and controlled Terraform destroy workflows for both Development and Production environments. These workflows enable safe, auditable, and intentional teardown of cloud resources when they are no longer required.

🔹 Why Destroy Workflows Matter

Seasoned cloud engineers treat resource destruction as a first-class operation, not an afterthought. These workflows ensure:

Cost control – prevent orphaned AWS resources

Operational hygiene – clean teardown after testing or project completion

Environment safety – Dev and Prod are destroyed independently

Auditability – all destructive actions are tracked in GitHub Actions logs

No accidental deletes – destruction is never automatic

🔹 Dev Destroy Workflow

Purpose: Tear down all Terraform-managed resources in the development environment

Trigger: Manual (workflow_dispatch)

State: Uses the Dev Terraform remote state

Protection:

Isolated IAM permissions

Environment-specific backend

Separate workflow from production

Use case examples:

Cleaning up test infrastructure

Resetting Dev after experiments

Cost optimization during idle periods

🔹 Prod Destroy Workflow

Purpose: Tear down all Terraform-managed resources in the production environment

Trigger: Manual (workflow_dispatch) only

State: Uses the Production Terraform remote state

Protection:

Explicit environment targeting

Strict IAM role permissions

No automatic triggers (no PRs, no pushes)

Important:
Production destruction is intentionally manual to prevent accidental outages and ensure operational accountability.

🔹 Key Safety Controls Implemented

Separate Terraform backends for Dev and Prod

Independent GitHub Actions workflows

IAM least-privilege enforcement

DynamoDB state locking to prevent concurrent operations

Concurrency controls to avoid overlapping runs

Manual approval model for destructive actions

🔹 Verified Outcome

Both Dev and Prod destroy workflows were successfully executed, and all deployed AWS resources were cleanly removed without state corruption or cross-environment impact.

This confirms:

Correct environment isolation

Proper IAM permissions

Reliable Terraform state management

Safe CI/CD automation for destructive operations

🏷️ Tags

Terraform | AWS S3 | GitHub Actions | CI/CD | DevOps | Infrastructure as Code

📖 References

Terraform AWS S3 Documentation

GitHub Actions for Terraform

AWS IAM Best Practices




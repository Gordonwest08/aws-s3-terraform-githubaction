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

🏷️ Tags

Terraform | AWS S3 | GitHub Actions | CI/CD | DevOps | Infrastructure as Code

📖 References

Terraform AWS S3 Documentation

GitHub Actions for Terraform

AWS IAM Best Practices




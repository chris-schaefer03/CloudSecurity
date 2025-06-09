# CloudSecurity

This project defines secure AWS infrastructure using Terraform, focusing on managing and versioning S3 buckets. The setup includes server-side encryption with a custom KMS key and enables object versioning.

---

## ✅ Goals & What I'm Learning

I'm using this project to gradually build up my understanding of secure Infrastructure as Code (IaC) practices. So far, I've been learning how to:

- Use the AWS provider in Terraform
- Create and encrypt S3 buckets with AWS KMS
- Enable versioning for object history and recovery
- Work with variables and `jsonencode` in Terraform

---

## 🔧 Technologies

- Terraform
- AWS S3
- AWS KMS

---

## 📁 Project Structure

- `main.tf`: Contains provider setup, KMS key, and S3 bucket configuration
- `variables.tf`: Defines the AWS region used in the deployment

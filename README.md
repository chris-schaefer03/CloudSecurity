# CloudSecurity

This project defines secure AWS infrastructure using Terraform, focusing on best practices for managing cloud resources. The setup includes an encrypted and versioned S3 bucket as well as IAM configurations for secure access control.

---  

✅ **Goals & What I'm Learning**

I'm using this project to gradually build my understanding of secure Infrastructure as Code (IaC) practices. So far, I've been learning how to:

- Use the AWS provider in Terraform
- Create and encrypt S3 buckets with AWS KMS
- Enable versioning for object history and recovery
- Define IAM roles and attach policies for controlled access
- Work with variables and `jsonencode` in Terraform

---

🔧 **Technologies**

- Terraform
- AWS S3
- AWS KMS
- AWS IAM

---

📁 **Project Structure**

- `main.tf`: Contains provider setup, KMS key, and S3 bucket configuration
- `variables.tf`: Defines the AWS region used in the deployment
- `iam.tf`: Contains IAM role and read-only policy for EC2 instances
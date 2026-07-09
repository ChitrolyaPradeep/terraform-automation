# 🚀 Terraform Learning Guide (Beginner to Intermediate)

## 📖 Table of Contents

- What is Terraform?
- Why Do We Need Terraform?
- How Terraform Works
- Terraform Architecture
- Terraform Workflow
- Features of Terraform
- Benefits of Terraform
- Terraform Use Cases
- Prerequisites
- Terraform Installation
- Common Terraform Commands
- Terraform Project Structure
- Best Practices
- 7-Day Terraform Learning Roadmap

---

# What is Terraform?

Terraform is an **Infrastructure as Code (IaC)** tool developed by **HashiCorp**.

Instead of creating cloud resources manually through the AWS, Azure, or GCP console, Terraform allows you to create infrastructure using simple configuration files written in **HCL (HashiCorp Configuration Language).**

Infrastructure can include:

- EC2 Instances
- VPC
- Subnets
- Security Groups
- S3 Buckets
- IAM Roles
- RDS Databases
- Load Balancers
- EKS Clusters
- Azure Virtual Machines
- Google Cloud Resources

Everything is written in code.

Example:

```hcl
resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
}
```

One command can create your infrastructure.

```
terraform apply
```

---

# Why Do We Need Terraform?

Imagine your company has:

- 500 EC2 Instances
- 100 S3 Buckets
- 20 VPCs
- 15 RDS Databases
- 50 Security Groups

Creating all of these manually is:

- Slow
- Error-prone
- Difficult to maintain
- Difficult to reproduce

Terraform solves this problem.

Everything becomes code.

You can:

- Create infrastructure
- Update infrastructure
- Delete infrastructure
- Reuse infrastructure
- Version control infrastructure

---

# What is Infrastructure as Code (IaC)?

Infrastructure as Code means writing infrastructure in code instead of creating it manually.

Instead of clicking buttons in the AWS Console:

```
AWS Console
↓

Create VPC
↓

Create Subnet
↓

Create Security Group
↓

Create EC2
```

You simply write:

```
Terraform Code
↓

terraform apply
```

Terraform creates everything automatically.

---

# How Terraform Works

Terraform follows a simple workflow.

```
Write Code
      ↓
terraform init
      ↓
terraform plan
      ↓
terraform apply
      ↓
Infrastructure Created
```

### Step 1

Write Terraform code.

Example:

```hcl
resource "aws_s3_bucket" "bucket" {
  bucket = "my-demo-bucket"
}
```

### Step 2

Initialize Terraform.

```
terraform init
```

Terraform downloads the required provider plugins.

### Step 3

Create an execution plan.

```
terraform plan
```

Terraform compares:

- Existing Infrastructure
- Desired Infrastructure

It shows what will be:

- Added
- Changed
- Destroyed

Nothing changes yet.

### Step 4

Apply the changes.

```
terraform apply
```

Terraform creates the resources.

### Step 5

Terraform stores the current infrastructure information inside:

```
terraform.tfstate
```

This file is called the **State File**.

---

# Terraform Architecture

```
                Terraform Configuration

                       │

                       ▼

                Terraform Core

                       │

           -------------------------

           │                       │

           ▼                       ▼

     AWS Provider          Azure Provider

           │                       │

           ▼                       ▼

        AWS APIs              Azure APIs
```

---

# Terraform Workflow

```
Write Code

↓

terraform fmt

↓

terraform validate

↓

terraform init

↓

terraform plan

↓

terraform apply

↓

terraform destroy (Optional)
```

---

# Important Terraform Commands

Initialize project

```
terraform init
```

Format code

```
terraform fmt
```

Validate syntax

```
terraform validate
```

Generate execution plan

```
terraform plan
```

Create infrastructure

```
terraform apply
```

Destroy infrastructure

```
terraform destroy
```

Show current state

```
terraform show
```

List resources

```
terraform state list
```

---

# Terraform Project Structure

```
terraform-project/

│

├── provider.tf

├── variables.tf

├── outputs.tf

├── main.tf

├── terraform.tfvars

├── versions.tf

├── backend.tf

├── modules/

│   ├── network/

│   ├── compute/

│   └── database/

└── README.md
```

---

# Where is Terraform Used?

Terraform is commonly used for:

- AWS Infrastructure
- Azure Infrastructure
- Google Cloud Platform (GCP)
- Kubernetes Clusters
- Docker Infrastructure
- VMware
- Oracle Cloud
- GitHub Repository Management
- Cloudflare DNS
- Datadog Monitoring
- Snowflake
- MongoDB Atlas

---

# Benefits of Terraform

## 1. Infrastructure as Code

Everything is stored in code.

---

## 2. Automation

No manual resource creation.

---

## 3. Version Control

Infrastructure changes can be tracked using Git.

---

## 4. Reusable Code

Modules allow you to reuse infrastructure.

---

## 5. Multi-Cloud Support

Terraform works with:

- AWS
- Azure
- GCP
- Kubernetes
- VMware

---

## 6. Consistency

Every environment is created the same way.

Development

↓

Testing

↓

Production

No manual differences.

---

## 7. Collaboration

Teams can work together using Git.

---

## 8. Easy Rollback

Git history helps recover previous configurations.

---

## 9. State Management

Terraform knows what resources already exist.

---

## 10. Scalable

Manage thousands of cloud resources using code.

---

# Terraform Best Practices

- Store code in Git.
- Use remote state (S3 + DynamoDB for AWS).
- Use modules for reusable code.
- Never hardcode secrets.
- Use variables.
- Validate before applying.
- Review the plan before applying.
- Enable state locking.
- Separate environments (Dev, QA, Prod).
- Use descriptive resource names.

---

# 7-Day Terraform Learning Roadmap

## Day 1 – Terraform Fundamentals

### Topics

- What is Terraform?
- Infrastructure as Code (IaC)
- Terraform Architecture
- Terraform Workflow
- HCL Basics
- Install Terraform
- Install AWS CLI
- Configure AWS CLI
- Create your first Terraform project

### Task

- Install Terraform
- Install AWS CLI
- Configure AWS credentials
- Run:
  - `terraform version`
  - `terraform init`
- Create a simple `main.tf` file
- Learn HCL syntax

---

## Day 2 – Providers and Resources

### Topics

- Providers
- Resources
- Variables
- Outputs
- Data Types
- Input Variables
- Output Variables

### Task

- Create:
  - EC2 Instance
  - Security Group
- Use variables for:
  - Region
  - AMI
  - Instance Type
- Display outputs such as Public IP and Instance ID

---

## Day 3 – Terraform State

### Topics

- Terraform State
- State File
- Remote State
- Backend
- State Locking
- S3 Backend
- DynamoDB Locking

### Task

- Create an S3 bucket for remote state
- Create a DynamoDB table for state locking
- Move the local state to the remote backend
- Explore commands:
  - `terraform show`
  - `terraform state list`
  - `terraform state show`

---

## Day 4 – Modules

### Topics

- What are Modules?
- Local Modules
- Remote Modules
- Module Variables
- Module Outputs
- Module Structure

### Task

- Create separate modules for:
  - VPC
  - EC2
  - Security Group
- Reuse modules in the root project

---

## Day 5 – Networking

### Topics

- VPC
- Subnets
- Route Tables
- Internet Gateway
- NAT Gateway
- Security Groups
- Network ACLs

### Task

Create the following infrastructure:

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- NAT Gateway
- Route Tables
- EC2 Instance

---

## Day 6 – Advanced Terraform

### Topics

- count
- for_each
- dynamic blocks
- locals
- functions
- lifecycle
- depends_on
- provisioners
- workspaces

### Task

- Create multiple EC2 instances using `count`
- Create S3 buckets using `for_each`
- Use lifecycle rules
- Use local values
- Experiment with Terraform functions

---

## Day 7 – Real-World Project

### Project

Build a complete AWS environment using Terraform.

Infrastructure:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- EC2 Instances
- Application Load Balancer
- Auto Scaling Group
- IAM Roles
- S3 Bucket
- RDS Database
- Outputs

### Final Tasks

- Use modules
- Use variables
- Configure a remote backend (S3 + DynamoDB)
- Validate the code
- Review the execution plan
- Apply the infrastructure
- Destroy the infrastructure to avoid unnecessary costs
- Push the project to GitHub with proper documentation

---

# Recommended Learning Path After 7 Days

Once you complete this roadmap, continue learning:

- Terraform Cloud
- Terraform Enterprise
- Multi-environment deployments
- CI/CD integration with Jenkins or GitHub Actions
- AWS EKS using Terraform
- Kubernetes provider
- Helm provider
- Policy as Code (Sentinel/Open Policy Agent)
- Terragrunt
- Terraform testing
- Import existing infrastructure
- Drift detection
- Secret management with AWS Secrets Manager or HashiCorp Vault

---

# Final Advice

Terraform is best learned by practicing. Read the documentation, but spend most of your time writing code and deploying infrastructure in a cloud environment. Start with small projects, understand the output of every command, and gradually build larger, production-style deployments using modules, remote state, and version control.

Happy Learning! 🚀

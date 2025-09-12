readm# China Deployment

Terraform project to deploy **Network Security Group (NSG) rules** for Aviatrix Controller infrastructure in **China** (Azure & AWS).  
This setup manages inbound/outbound rules for **Transit** and **Spoke Gateways** across multiple subscriptions.

---

## 📑 Table of Contents

- [Overview](#overview)  
- [Prerequisites](#prerequisites)  
- [Architecture](#architecture)  
- [Modules & Files](#modules--files)  
- [Variables](#variables)  
- [Usage](#usage)  
- [Outputs](#outputs)  
- [Best Practices](#best-practices)  
- [Contributing](#contributing)  
- [License](#license)  

---

## 📌 Overview

This repository contains Terraform code for deploying and managing **NSG rules** to support Aviatrix deployments in China.  
It automates:

- Security rule creation for **Azure Transit Gateways**  
- Security rule creation for **Azure Spoke Gateways**  
- Security rule creation for **AWS Transit Gateways**  
- Security rule creation for **AWS Spoke Gateways**  

It ensures consistent, repeatable infrastructure deployment across subscriptions.

---

## ✅ Prerequisites

Before using this repo, you need:

- [Terraform](https://developer.hashicorp.com/terraform/downloads) ≥ 1.3  
- AzureRM & AWS Terraform providers  
- Access to required subscriptions/accounts with permission to manage **NSGs & Security Rules**  
- Properly configured credentials (via environment variables, service principals, or CI/CD secrets)  
- Basic understanding of Aviatrix controller & gateway architecture  

---

## 🏗 Architecture

- **Transit Gateways**: connect multiple networks across clouds/regions  
- **Spoke Gateways**: connect individual VNets/VPCs  
- **NSGs/Security Rules**: restrict and allow specific traffic (e.g. HTTPS on 443)  

Rules are defined in Terraform, grouped by provider (Azure/AWS) and gateway type (spoke/transit).

---

## 📂 Modules & Files

| File / Module | Purpose |
|---------------|---------|
| `providers.tf` | Configure Azure & AWS providers, with aliases for multiple subscriptions. |
| `variables.tf` | Input variable definitions. |
| `locals.tf` | Local values used across rules. |
| `terraform.tfvars` | Input values (IPs, subscription IDs, priorities). **Never commit secrets.** |
| `aws_spoke_gws_nsg.tf` | NSG rules for AWS Spoke Gateways. |
| `aws_transit_gws_nsg.tf` | NSG rules for AWS Transit Gateways. |
| `azure_spoke_gws_nsg.tf` | NSG rules for Azure Spoke Gateways. |
| `azure_transit_gws_nsg.tf` | NSG rules for Azure Transit Gateways. |
| `output.tf` | Outputs (NSG names, IDs, etc). |
| `modules/` | Optional reusable Terraform modules. |

---

## ⚙️ Variables

Key variables include:

- **Azure subscription IDs**  
- **AWS account IDs**  
- **IP address lists** for NSG rules  
- **Priorities** for rules to avoid conflicts  
- **Naming prefixes** for resources  

Example (`terraform.tfvars`):

```hcl
azure_spoke_gateway_ips = [
  "163.228.140.74",
  "163.228.145.37",
  "40.162.17.243"
]

aws_transit_gateway_ips = [
  "54.183.22.10",
  "13.57.101.22"
]

subscription_ids = {
  azure_controllersub = "8f14a30e-xxxx-xxxx-xxxx-c02eca2bd0a6"
}


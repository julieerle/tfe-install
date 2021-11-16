# tfe-install

Infrastructure requirements for Terraform Enterprise range from a single AWS EC2 instance for demo installations to multiple instances connected to RDS and S3 for a stateless production installation, [source](https://www.terraform.io/docs/enterprise/before-installing/reference-architecture/aws.html).

## [Pre Install Checklist](https://www.terraform.io/docs/enterprise/before-installing/index.html)

### Terraform Enterprise Server (EC2 via Auto Scaling Group)

| Type	| CPU 	| Memory	| Disk	| AWS Instance Types |
| ------ | ------ | ------ | ------ | ------ |
| Minimum | 	4 core| 	16 GB RAM| 	50GB| 	m5.xlarge| 
| Scaled |	8 core |	32 GB RAM |	50GB |	m5.2xlarge |

### RDS instance

| Type	| CPU 	| Memory	| Disk	| AWS Instance Types |
| ------ | ------ | ------ | ------ | ------ |
| Minimum|	4 core|	16 GB RAM|	50GB|	db.m4.xlarge|
|Scaled	|8 core|	32 GB RAM|	50GB|	db.m4.2xlarge|

## Workflow

1. download `replicated` license file.
2. create linux ec2 instance w/ public IP
3. server security group
   1. Ingress: 80, 443, 8800, (if A/A 8201 Vault)
   2. Egress: 0.0.0.0/0
4. Public DNS record resolving to public IP of server
5. `ssh` to server
6. Download the installation script using `sudo curl -o /tmp/install.sh https://install.terraform.io/ptfe/stable`
7. Make the installation script executable using `sudo chmod +x /tmp/install.sh`
8. Execute the installation script using `sudo /tmp/install.sh`
9. Follow the installation script prompts
10. Navigate to the outputted URL, called the Replicated console, and complete steps

# Terraform Code repo for AWS Workspaces

The following resources will be created:

1. A VPC 
2. Two private subnets(To host AD and Workspaces ENI to customer VPC) and one Public subnet(For internet Access).
3. A route table for private subnets and One Route table for Public subnets.
4. A nat Gateway and Internet Gateway for Internet Access which Needed for workspace.
5. Provides network associations for AWS Client VPN endpoints.
6. A Simple Active Directory to user details.
7. A WorkSpaces directory in AWS WorkSpaces Service.
8. A workspace.
9. A security group for Workspace Directory.
10. IAM role for workspace and A KMS key.

___
## Terraform execution steps

* To initialize a working directory containing Terraform configuration files:

<pre><code>terraform init</pre></code>

* To validate the Terraform configuration

<pre><code>terraform validate</pre></code>

* To format your Terraform code 

<pre><code>terraform fmt --recursive</pre></code>

* To create an execution plan, which lets you preview the changes to your infrastructure:

<pre><code>terraform plan</pre></code>

<img width="386" alt="image" src="https://user-images.githubusercontent.com/65828245/212667983-21d5f51c-a165-4a83-9712-f0e54621840a.png">
<img width="356" alt="image" src="https://user-images.githubusercontent.com/65828245/212662914-36f02d96-470d-4640-9cbe-4a14d52f6fba.png">
<img width="352" alt="image" src="https://user-images.githubusercontent.com/65828245/212663032-f5d70296-c9a6-40af-995b-45fdaafe69ad.png">

* To execute the actions proposed in a Terraform plan:

<pre><code>terraform apply</pre></code>



* To destroy the infrastructure created before by using Terraform:

<pre><code>terraform destroy</pre></code>

## Add user to Simple Active Directory Created before
1. Launch an Windows EC2 Instance and Install Active Directory [administration tools](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/simple_ad_install_ad_tools.html)

<img width="783" alt="image" src="https://user-images.githubusercontent.com/65828245/212678655-efde5f62-498a-4b0e-8669-75eb79e6c87c.png">

2. Join the Ec2 Instance to Simple AD domain by following [this](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/simple_ad_join_windows_instance.html) document.
 
 <img width="296" alt="image" src="https://user-images.githubusercontent.com/65828245/212684842-2857e0b6-54be-4beb-9d61-b753091da107.png">
<img width="538" alt="image" src="https://user-images.githubusercontent.com/65828245/212685308-52f7234d-7b08-4039-aa3b-bcfbdee7f06d.png">

 
 <img width="305" alt="image" src="https://user-images.githubusercontent.com/65828245/212681557-681ee50e-1ea8-4e30-ba46-49fc67f93f36.png">

3. Create a User by following [this](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/simple_ad_manage_users_groups_create_user.html) document
 Open the Active Directory Users and Computers tool. Run as a different user. Put the Active directory userid and password.
 
 <img width="339" alt="image" src="https://user-images.githubusercontent.com/65828245/212684126-a5f615e7-6352-425a-b8f9-48c63b841560.png">
<img width="508" alt="image" src="https://user-images.githubusercontent.com/65828245/212688061-2cae87fe-7827-44b7-bd22-5172dd05799c.png">
<img width="323" alt="image" src="https://user-images.githubusercontent.com/65828245/212688201-1bb460d1-88a3-4afd-b80a-4a13ba5bf8db.png">
<img width="482" alt="image" src="https://user-images.githubusercontent.com/65828245/212688283-3ca8f68d-9671-4caf-8d6f-719556d7d647.png">


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_directory_service_directory.simple](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_directory) | resource |
| [aws_iam_role.workspaces-default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.workspaces-default-self-service-access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.workspaces-default-service-access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_kms_key.workspaces-kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_nat_gateway.workspace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.workspace-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.workspace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_workspaces_directory.workspaces-directory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/workspaces_directory) | resource |
| [aws_workspaces_workspace.workspaces](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/workspaces_workspace) | resource |
| [aws_iam_policy_document.workspaces](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bundle_id"></a> [bundle\_id](#input\_bundle\_id) | ID of the bundle to deploy workspaces as | `string` | `""` | yes |
| <a name="input_directory_name"></a> [directory\_name](#input\_directory\_name) | Active directory name | `string` | `""` | yes |
| <a name="input_password"></a> [password](#input\_password) | Active directory password | `string` | `""` | yes |
| <a name="input_username"></a> [username](#input\_username) | workspace username | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace-directory-customer-name"></a> [workspace-directory-customer-name](#output\_workspace-directory-customer-name) | The user name for the service account. |
| <a name="output_workspace-directory-name"></a> [workspace-directory-name](#output\_workspace-directory-name) | The name of the directory. |
| <a name="output_workspace-id"></a> [workspace-id](#output\_workspace-id) | The workspaces ID. |
| <a name="output_workspace-name"></a> [workspace-name](#output\_workspace-name) | The name of the WorkSpace, as seen by the operating system. |

For more information on Amazon Workspaces Manual Setup, visit [Amazon Workspaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces.html).

For more information on Amazon Workspaces, visit [Amazon Workspaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces.html).

For more information on Terraform AWS Workspaces, visit [Terraform Resource: AWS Workspaces](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/workspaces_workspace).

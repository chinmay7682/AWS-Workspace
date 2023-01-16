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

<img width="415" alt="image" src="https://user-images.githubusercontent.com/65828245/212662585-7080aaff-0731-41f2-881a-85549eab6d8e.png">
<img width="356" alt="image" src="https://user-images.githubusercontent.com/65828245/212662914-36f02d96-470d-4640-9cbe-4a14d52f6fba.png">
<img width="352" alt="image" src="https://user-images.githubusercontent.com/65828245/212663032-f5d70296-c9a6-40af-995b-45fdaafe69ad.png">

* To execute the actions proposed in a Terraform plan:

<pre><code>terraform apply</pre></code>



* To destroy the infrastructure created before by using Terraform:

<pre><code>terraform destroy</pre></code>

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

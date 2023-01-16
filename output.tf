output "workspace-id" {
  description = "The workspaces ID."
  value       = aws_workspaces_workspace.workspaces.id
}
output "workspace-name" {
  description = "The name of the WorkSpace, as seen by the operating system."
  value       = aws_workspaces_workspace.workspaces.computer_name
}
output "workspace-directory-customer-name" {
  description = "The user name for the service account."
  value       = aws_workspaces_directory.workspaces-directory.customer_user_name
}
output "workspace-directory-name" {
  description = "The name of the directory."
  value       = aws_workspaces_directory.workspaces-directory.directory_name
}
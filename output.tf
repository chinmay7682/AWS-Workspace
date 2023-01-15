output "workspace-id" {
  value = aws_workspaces_workspace.workspaces.id
}
output "workspace-name" {
  value = aws_workspaces_workspace.workspaces.computer_name
}
output "workspace-directory-customer-name" {
  value = aws_workspaces_directory.workspaces-directory.customer_user_name
}
output "workspace-directory-name" {
  value = aws_workspaces_directory.workspaces-directory.directory_name
}
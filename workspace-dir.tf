resource "aws_workspaces_directory" "workspaces-directory" {
  directory_id = aws_directory_service_directory.simple.id
  subnet_ids   = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ] #Subnets where AD resides
  self_service_permissions {
    change_compute_type  = true
    increase_volume_size = true
    rebuild_workspace    = true
    restart_workspace    = true
    switch_running_mode  = true
  }
  workspace_access_properties {
    device_type_android = "ALLOW"
    device_type_chromeos = "ALLOW"
    device_type_ios = "ALLOW"
    device_type_linux = "DENY"
    device_type_osx = "ALLOW"
    device_type_web = "ALLOW"
    device_type_windows = "ALLOW"
    device_type_zeroclient = "DENY"
  }
  workspace_creation_properties {
    custom_security_group_id = aws_security_group.workspace-sg.id
    default_ou = "OU=Computers,OU=ad,DC=ad,DC=com"
    enable_internet_access = true
    enable_maintenance_mode = true
    user_enabled_as_local_administrator = true
  }
  depends_on = [aws_iam_role.workspaces-default]
}
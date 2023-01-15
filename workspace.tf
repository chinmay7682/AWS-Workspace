resource "aws_workspaces_workspace" "workspaces" {
  directory_id = aws_workspaces_directory.workspaces-directory.id
  bundle_id = var.bundle_id
  # Admin is the Administrator of the AWS Directory Service
  user_name = var.username
  root_volume_encryption_enabled = true
  user_volume_encryption_enabled = true
  volume_encryption_key = aws_kms_key.workspaces-kms.arn
  workspace_properties {
    compute_type_name = "STANDARD"
    user_volume_size_gib = 50
    root_volume_size_gib = 80
    running_mode = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }
  tags = {
    Name = "dev-workspaces"
  }
  depends_on = [
    aws_iam_role.workspaces-default,
    aws_workspaces_directory.workspaces-directory,
    aws_kms_key.workspaces-kms
  ]
}

resource "aws_kms_key" "workspaces-kms" {
  description             = "KMS key for workspace"
  deletion_window_in_days = 10
}
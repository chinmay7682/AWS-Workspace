resource "aws_directory_service_directory" "simple" {
  name     = var.directory_name
  password = var.password
  size     = "Small"

  vpc_settings {
    vpc_id     = aws_vpc.workspace.id
    subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]
  }

  tags = {
    Project = "dev"
  }

  depends_on = [
   aws_vpc.workspace,
   aws_subnet.private1,
   aws_subnet.private2
  ]
}
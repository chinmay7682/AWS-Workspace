## AWS Security Group for Workspaces
resource "aws_security_group" "workspace-sg" {
  name        = "Workspace SG"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.workspace.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Workspace SG"
  }
}

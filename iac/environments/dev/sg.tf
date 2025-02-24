# RDS Security Group
resource "aws_security_group" "sql_sg" {
  name        = "${var.environment}-sql_sg"
  description = "Allow MySQL traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr] # Restrict access to the VPC range
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-sql-sg"
  }
}
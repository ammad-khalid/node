resource "aws_db_subnet_group" "sql_subnet_group" {
  name       = "${var.environment}-sql_subnet_group"
  subnet_ids = module.vpc.private_subnets
  tags = {
    Name = "${var.environment}-mysql-subnet-group"
  }
}

resource "aws_db_instance" "mysql_instance" {
  identifier             = "${var.environment}-app-mysql"
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.small"  # Choose an appropriate instance size
  allocated_storage     = 20  # Adjust as per your requirement
  max_allocated_storage = 100 # Allows storage autoscaling up to this limit

  db_name               = "app"
  username             = "admin"
  password             = var.rds_mysql_master_password

  db_subnet_group_name  = aws_db_subnet_group.sql_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sql_sg.id]

  tags = {
    Name = "${var.environment}-app-mysql"
  }
}
# Configuración del grupo de subred para la base de datos (RDS)
resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = [
    aws_subnet.main_subnet_1.id,  # Subred en la AZ us-east-1a
    aws_subnet.main_subnet_2.id   # Subred en la AZ us-east-1b
  ]
  tags = {
    Name = "Main RDS Subnet Group"
  }
}

# Configuración de la instancia RDS Oracle
resource "aws_db_instance" "reyGasExpress" {
  identifier             = "reygasexpress-db-oracle"
  allocated_storage      = var.db_allocated_storage
  engine                 = "oracle-ee"
    engine_version         = "19.0.0.0.ru-2025-01.rur-2025-01.r1"
    instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = true 
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
}
output "db_endpoint" {
  value       = aws_db_instance.postgres.endpoint
  description = "Endpoint de conexão do banco de dados"
}

output "db_connection_string" {
  sensitive   = true
  value       = "postgresql://${var.db_user}:${var.db_password}@${aws_db_instance.postgres.endpoint}/soat_db"
  description = "String completa de conexão Prisma"
}
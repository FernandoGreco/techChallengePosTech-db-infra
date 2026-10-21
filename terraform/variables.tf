variable "db_user" {
  type        = string
  default     = "db_admin"
  description = "Usuário mestre do banco de dados"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Senha do banco de dados (passada via Secrets do GitHub Actions)"
}
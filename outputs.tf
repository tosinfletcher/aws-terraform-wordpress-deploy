output "Wordpress_Instance_ID" {
  description = "ID of the EC2 instance"
  value       = aws_instance.tfletcher_wordpress.id
}

output "Wordpress_public_IP" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.tfletcher_wordpress.public_ip
}

output "Database_Host" {
  description = "IP address of the RDS mysql instance"
  value       = aws_db_instance.tfletcher_rds_mysql.address
}

output "Database_Name" {
  description = "IP address of the RDS mysql instance"
  value       = aws_db_instance.tfletcher_rds_mysql.db_name
}

output "Database_Endpoint" {
  description = "IP address of the RDS mysql instance"
  value       = aws_db_instance.tfletcher_rds_mysql.endpoint
}

output "Wordpress_Initial_Setup_URL" {
  description = "The url to setup wordpress for the first time"
  value       = join("/", [aws_instance.tfletcher_wordpress.public_ip, "wp-admin/setup-config.php"])
}


provider "aws" {
  region = var.region
}

data "aws_ssm_parameter" "amazon_linux_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


resource "aws_instance" "tfletcher_wordpress" {
  ami                         = data.aws_ssm_parameter.amazon_linux_ami.value
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.tfletcher_public.id
  key_name                    = "tfletcher-keypair"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.tfletcher_sg_wordpress.id]
  user_data                   = <<-EOF
    #! /bin/bash
    sudo yum update -y && sudo yum upgrade -y
    sudo yum install git -y
    sudo yum install -y amazon-linux-extras
    sudo amazon-linux-extras enable php7.4
    sudo yum clean metadata
    sudo yum install -y php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap}
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo systemctl start php
    sudo wget https://wordpress.org/latest.zip
    sudo unzip latest.zip
    sudo cp -r wordpress/* /var/www/html/
    sudo systemctl restart httpd
    EOF

  tags = {
    Name = "tfletcher_web"
  }
}



resource "aws_db_instance" "tfletcher_rds_mysql" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  db_subnet_group_name   = aws_db_subnet_group.tfletcher_db_subnet_group.id
  vpc_security_group_ids = [aws_security_group.tfletcher_sg_rds_mysql.id]
  db_name                = "tfletcher_wordpress"
  identifier             = "tfletcher-wordpress"
  username               = "tfletcher"
  password               = "password"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
}

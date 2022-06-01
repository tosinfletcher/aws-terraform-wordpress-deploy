# aws-terraform-wordpress-deploy

This following terraform IaaC is used to deploy wordpress. The wordpress server runs on an AWS EC2 Instance and backed by a Mysql RDS

Prerequisite:

    1.  Terraform
    2.  AWS CLI
    3.  Pre-created EC2 keypair


USAGE:


1.  Initialize terraform
    
        terraform init

2.  Format terraform files
    
        terraform fmt
    
3.  Validate that the terraform files were configured correctly
    
        terraform validate

4.  Issue terraform plan to preview the infrastructure plan that will be deployed to AWS
    
        terraform plan

5.  Issue terraform apply to deploy the infrastructure to AWS
    
        terraform apply
    
6.  Copy the Wordpress_Initial_Setup_URL value from the output provided by terraform once it has completed the deployment and paste it in a web browser to setup
    wordpress
    
7.  Click on Let's go to create a wp-config.php file and setup wordpress

8.  Copy the value for the following information below from the output provided by terraform after it completed the deployment and paste it in the wordpress         setup as required.
    
        Database Name
        Database Host

9.  Provide the username and password you used to set up your Mysql RDS instance

10. Click submit

11. Copy the information provided for the wp-config.php file

12. SSH into or connect to your wordpress EC2 instance with the download private keypair you used to provision the instance

13. Use vim to open a wp-config.php in /var/www/html/ directory

        sudo vim /var/www/html/wp-config.php
 
14. paste the information you copied earlier into the file and save using :wq

15. After pasting and saving the file, Click on Run the installation

16. Provide the required information needed to complete the setup of your wordpress site

17. Click Install Wordpress

18. Login in with your newly created wordpress Username and Password

19. Enjoy using wordpress

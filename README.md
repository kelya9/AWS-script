# AWS-script
BASH script to create an Elastic Load Balancer (ELB) which directs traffic through the EC2 instance (Apache server)

Description:
The aim of this project was to create a security group with port 22 and 80 open to the world
Create an EC2 instance using a lunix2 AMI with Apache installed and associate the security group to the instance
Create a Target group with port 80 and register the EC2 instance
Created an Application Load Balancer (ALB) with listener to allow traffic to port 80 and associate it to the Target group
Load Balancer is then used to query the Apache Application running on the EC2 instance


Prerequisites:
AWS CLI installed:
AMS User with programmatic access that is AWS IAM profile configured on the CLI using Access ID and Secret Access Key


Best Practices:

For my demo practice, SSH (port 22 ) on the instance was opened to the world but best practice is to open only to your IP address
Hardcoded values were used but it is bestpractice to use variables.

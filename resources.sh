#!/bin/bash
#Creation Date: September 24, 2022
#Author: Nicole Takam
#Description: Creating an ELB that routes traffic to an EC2 instances and security groups

# create an ec2 instance
aws ec2 run-instances \
--image-id ami-026b57f3c383c2eec \
--count 1 \
--instance-type t2.micro \
--key-name devops \
--security-group-ids sg-078dbfb44b564e20c \
--subnet-id subnet-0b91791f5d30ae7fe \
--user-data fileb://script1.sh \
--tag-specifications \
'ResourceType=instance,Tags=[{Key=Name,Value=web1}]'

# create target group
aws elbv2 create-target-group \
    --name Takam \
    --protocol HTTP \
    --port 80 \
    --target-type instance \
    --vpc-id vpc-05113ca2cb2980b8f

# add target to target group
aws elbv2 register-targets \
    --target-group-arn arn:aws:elasticloadbalancing:us-east-1:145682747025:targetgroup/Takam/1a2493e7ae22b098 \
    --targets Id=i-0045730bd146cfd9d

# create a load balancer, subnet IDS are generic values
aws elbv2 create-load-balancer --name my-load-balancer \
--subnets subnet-0e3f5cac72EXAMPLE subnet-081ec835f3EXAMPLE --security-groups sg-07e8ffd50fEXAMPLE

#create listener
aws elbv2 create-listener --load-balancer-arn loadbalancer-arn \
--protocol HTTP --port 80 \
--default-actions Type=forward,TargetGroupArn=targetgroup-arn



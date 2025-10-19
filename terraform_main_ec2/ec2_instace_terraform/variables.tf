variable "region" {
    description = "AWS region"
    type = string
    default = "us-east-1"
}

variable "vpc-name" {
    description = "VPC name for our Jumphost server"
    type = string
    default = "Jumphost-vpc"
}

variable "igw-name" {
    description = "Internet Gate way Name for our jump host"
    type = string
    default = "Jumphost-igw"
}

variable "subnet_name1" {
    description = "Public subnet 1"
    type = string
    default = "Public-subnet1"
}

variable "subnet_name2" {
    description = "public subnet2"
    type = string
    default = "Public-subnet2"
}

variable "private_subnet_name1" {
    description = "private subnet1"
    type = string
    default = "Private-subnet1"
}

variable "private_subnet_name2" {
    description = "private_subnet_name2"
    type = string
    default = "Private-subnet2"
}

variable "rt-name" {
    description = "Route Table Name for our jump server"
    type = string
    default = "Jumphost-rt"
}

variable "sg-name" {
    description = "security group for our Jumphost"
    type = string
    default = "Jumphost-sg"
}

variable "iam-role" {
    description = "I am role for the jumphost server" 
    type = string
    default = "jumphost-iam-role1"
}

variable "ami_id" {
    description = "ami_id for Ec2-instance"
    type = string
    default = "ami-0018b373aba829819"
}

variable "instance_type" {
    description = "Ec2 instance type"
    type=string
    default="t2.large"
}

variable "key_name" {
    description = "Ec2 key pair" 
    type = string
    default = "vinay-project-keypair"
}

variable "instance_name" {
    description = "EC2 instance name for jump host"
    type = string
    default = "Jumphost-server" 
}
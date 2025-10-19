output "region" {
    description = "Jumphost server region" 
    value = var.region 
}

output "jumphost_public_ip" {
    description = "public_ip address of the Ec2 jumphost"
    value = aws_instance.ec2.public_ip
}
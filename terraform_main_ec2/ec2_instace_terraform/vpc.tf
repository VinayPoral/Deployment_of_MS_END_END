resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = var.vpc-name
    }
}



resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id 
    tags = {
        Name = var.igw-name
    }

}

resource "aws_subnet" "public_subnet_1" {
    vpc_id = aws_vpc.vpc.id 
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags  = {
        Name = var.subnet_name1
    }
}



resource "aws_subnet" "public_subnet_2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = var.subnet_name2
    }
}

resource "aws_subnet" "private_subnet_1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    tags = {
        Name = var.private_subnet_name1
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    tags = {
        Name = var.private_subnet_name2
    }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id

    }
    tags = {
        Name = var.rt-name
    }
}

resource "aws_route_table_association" "rt-association1" {
    route_table_id = aws_route_table.rt.id 
    subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "rt-assocation2" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.public_subnet_2.id
}

resource "aws_eip" "nat_eip" {
    depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat_gtw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public_subnet_1.id
} 

resource "aws_route_table" "rt-private" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gtw.id 
    }
    tags = {
        Name = "Private-RT"
    }
}




resource "aws_route_table_association" "rt-association3" {
    route_table_id = aws_route_table.rt.id 
    subnet_id = aws_subnet.private_subnet_1.id 

}

resource "aws_route_table_association" "rt-association4" {
    route_table_id = aws_route_table.rt.id 
    subnet_id = aws_subnet.private_subnet_2.id 
}

resource "aws_security_group" "security_group" {
    vpc_id = aws_vpc.vpc.id 
    description = "This is for allowing Jenkins, Sonar,SSH Access" 
    ingress = [
        for port in [22, 443, 8080, 9000, 9090, 3306, 80, 9200, 5044, 5601] : {
            description = "TLS from VPC" 
            from_port = port 
            to_port = port 
            protocol = "tcp"
            ipv6_cidr_blocks = ["::/0"]
            self = false
            prefix_list_ids = []
            security_groups = []
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"  
        cidr_blocks = ["0.0.0.0/0"]
    }
     
     tags = {
        Name = var.sg-name
     }
}
 


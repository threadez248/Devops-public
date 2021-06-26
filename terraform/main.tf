#Terraform vars##
provider "aws" {
  profile = "default"
  region  = var.aws_region
}

##Creation of vpc
resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    tags = {
      Name = "itmunk_vpc"
    }
}

##Subnet created public
resource "aws_subnet" "subnet_public" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "${var.aws_region}${var.aws_region_az}"
    tags = {
      Name = "itmunk_pub_subnet"
    }
}

##Create IGW for Internet route

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "itmunk_igw"
    }
}

##Route table creation and associating with IGW as this is public RT

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.vpc.id
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.igw.id
    }
    
    tags = {
        Name = "itmunk_public_rt"
    }
}

## Route table association
resource "aws_route_table_association" "public-rt-subnet-assoc"{
    subnet_id = aws_subnet.subnet_public.id
    route_table_id = aws_route_table.public-rt.id
}


##Instance creation
resource "aws_instance" "instance" {
  count         = var.instance_count
  ami                         = var.instance_ami
  availability_zone           = "${var.aws_region}${var.aws_region_az}"
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ssh_allowed.id]
  subnet_id                   = aws_subnet.subnet_public.id
  key_name                    = var.key_pair
 
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }
  user_data =  "${file("install_ansible.sh")}"        
  tags = {
     Name  = element(var.instance_tags, count.index)
     Owner = var.owner
  }
}

# deatils of key pair
resource "aws_key_pair" "my_key" {
     key_name = "terraform-key"
     public_key = file("terraform-key.pub")
}
resource "aws_default_vpc" "mpsaps_vpc" {
}

resource "aws_security_group" "mpsaps_sg" {
      name = "mpsaps_security"
      vpc_id = aws_default_vpc.mpsaps_vpc.id # using interpolation
      
      # inbound role
      ingress {
        from_port =  22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

     }
     ingress {
       from_port = 80
       to_port = 80
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
     from_port = 0
     to_port = 0
     protocol = -1  # all protocol allow
     cidr_blocks = ["0.0.0.0/0"]

    }

}
resource "aws_instance" "mpsaps_instance" {
     for_each = var.map_value
     key_name = aws_key_pair.my_key.key_name # suing interpolation 
     vpc_security_group_ids = [aws_security_group.mpsaps_sg.id]
     ami = var.ami_id
     instance_type = each.value
     root_block_device {
       volume_size = 15
       volume_type = "gp3"
}
  tags = {
   Name = each.key

}

}

resource "aws_instance" "mpsaps_instance1" { 
          key_name = aws_key_pair.my_key.key_name # suing interpolation
          vpc_security_group_ids = [aws_security_group.mpsaps_sg.id]
          ami = var.ami_id
          instance_type = var.ec2-instance-type
          root_block_device {
             volume_size = 15
             volume_type = "gp3"
}
}


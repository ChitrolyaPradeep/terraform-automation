# deatils of key pair
resource "aws_key_pair" "my_key" {
     key_name = "${var.env}-terraform-key"
     public_key = file("terraform-key.pub")
}
resource "aws_default_vpc" "mpsaps_vpc" {
}

resource "aws_security_group" "mpsaps_sg" {
      name = "${var.env}-mpsaps-security"
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
     key_name = aws_key_pair.my_key.key_name # suing interpolation 
     vpc_security_group_ids = [aws_security_group.mpsaps_sg.id]
     ami = var.ami_id
     instance_type = var.ec2-instance-type
     root_block_device {
       volume_size = var.volume_size
       volume_type = var.volume_type
}
  tags = {
   Name = "${var.env}-mpsaps-instance"

}

}



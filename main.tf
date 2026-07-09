module ec2 {
  source = "./module/"
  name_ec2 = "mpsaps"
  ec2-instance-type = "t3.micro"
  ami_id = "ami-02167eae61967e403"
  volume_size = 8
  volume_type = "gp2"
  env = "dev" 

}





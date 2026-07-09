
variable "ec2-instance-type" {
   description = "this is used to ec2 type "
   type = string

}

variable "ami_id" {
  description = "this is ami id used for ec2 instance"
  type = string
}

variable "name_ec2" {
  description = "name of ec2 instance for create"
  type = string
}
variable "volume_size" {
  description = "this is volume size for ec2 instance"
  type = number

}

variable "volume_type" {
  description = "this is key name for ec2 instance"
  type = string
}

variable "env" {
  description = "this is key name for ec2 instance"
  type = string
}


variable "instance_count" {
    default = 3
    type = number
    description = "this is count for ec2 instance"
}

variable "instance_types" {
  default = [
    "t3.micro",
    "t2.small",
    "t3.micro"
  ]
}
variable "set_value" {
    type = set(string)
    description = "using the for_each argument then create multiple resource"
    default = [
    "pradeep",
     "shivani",
      "Yashika"
       
]

}

variable "map_value" {
    description = "using the to_map for create the multiple resource using this map"
    default = {
      "viraj" = "t3.micro"
      "shivani" = "t3.micro"
       "yashika" = "t3.micro"

}

}




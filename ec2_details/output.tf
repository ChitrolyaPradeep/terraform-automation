output "public_ip" {
   value = ([ for public in aws_instance.mpsaps_instance : public.public_ip ])
}

output "mpsaps_int" {
    value = aws_instance.mpsaps_instance1.public_ip

}

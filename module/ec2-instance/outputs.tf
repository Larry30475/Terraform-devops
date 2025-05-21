output "public_ip" {
  value = aws_instance.my_vm.public_ip
}

output "instance_id" {
  value = aws_instance.my_vm.id
}
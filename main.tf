module "web_server_1" {
  source        = "./module/ec2-instance"
  instance_type = "t2.micro"
  name_tag      = "WebServer1"
  ami           = "ami-084568db4383264d4"
}

module "web_server_2" {
  source        = "./module/ec2-instance"
  instance_type = "t2.micro"
  name_tag      = "WebServer2"
  ami           = "ami-084568db4383264d4"
}

output "web_server_1_ip" {
  value = module.web_server_1.public_ip
}

output "web_server_1_id" {
  value = module.web_server_1.instance_id
}

output "web_server_2_ip" {
  value = module.web_server_2.public_ip
}

output "web_server_2_id" {
  value = module.web_server_2.instance_id
}
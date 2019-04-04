# outputs the private ip address of the backend api instance
output "backend_private_ip_address" {
  value = "${aws_instance.api_backend.private_ip}"
}

# outputs the private ip address of the DB instance
output "db_private_ip_address" {
  value = "${aws_instance.db_instance.private_ip}"
}

# outputs the public ip address of the Bastion Host
output "bastion_host_ip_address" {
  value = "${aws_instance.bastion-host.public_ip}"
}

# outputs the public ip address of the Frontend Instance 
output "frontend_ip_address" {
  value = "${aws_instance.frontend.public_ip}"
}

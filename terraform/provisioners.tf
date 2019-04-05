# resource that allows configure provisioners that are not directly associated with a single existing resource.
resource "null_resource" "connect_to_frontend_instance" {
  connection {
    bastion_host = "${aws_instance.bastion-host.public_ip}"
    host         = "${aws_instance.frontend.private_ip}"
    user         = "ubuntu"
    agent        = true
  }

    # connect to provisioned instance to setup the env variables
  provisioner "remote-exec" {
    inline = [
      "git clone https://github.com/rafmme/instance-setup",
      "cd instance-setup",
      "chmod u+x frontend-setup.sh",
      "export BACKEND_IP=${aws_instance.api_backend.private_ip}",
      "./frontend-setup.sh",
    ]
  }

  depends_on = ["aws_instance.bastion-host", "aws_instance.api_backend"]
}

resource "null_resource" "connect_to_api_backend_instance" {
  connection {
    bastion_host = "${aws_instance.bastion-host.public_ip}"
    host         = "${aws_instance.api_backend.private_ip}"
    user         = "ubuntu"
    agent        = true
  }

  # connect to provisioned instance to setup the env variables
  provisioner "remote-exec" {
    inline = [
      "export DATABASE_URL=postgresql://postgres:''@'${aws_instance.db_instance.private_ip}':5432/haven_db",
      "export PORT=${var.PORT}",
      "export JWT_SECRET=${var.JWT_SECRET}",
      "export SENDGRID_API_KEY=${var.SENDGRID_API_KEY}",
      "export GOOGLE_CLIENT_ID=${var.GOOGLE_CLIENT_ID}",
      "export GOOGLE_CLIENT_SECRET=${var.GOOGLE_CLIENT_SECRET}",
      "export FACEBOOK_CLIENT_ID=${var.FACEBOOK_CLIENT_ID}",
      "export FACEBOOK_CLIENT_SECRET=${var.FACEBOOK_CLIENT_SECRET}",
      "export LINKEDIN_CLIENT_ID=${var.LINKEDIN_CLIENT_ID}",
      "export LINKEDIN_CLIENT_SECRET=${var.LINKEDIN_CLIENT_SECRET}",
      "export TWITTER_CLIENT_ID=${var.TWITTER_CLIENT_ID}",
      "export TWITTER_CLIENT_SECRET=${var.TWITTER_CLIENT_SECRET}",
      "export SESSION_SECRET=${var.SESSION_SECRET}",
      "export PUSHER_APP_ID=${var.PUSHER_APP_ID}",
      "export PUSHER_KEY=${var.PUSHER_KEY}",
      "export PUSHER_SECRET=${var.PUSHER_KEY}",
      "export PUSHER_CLUSTER=${var.PUSHER_CLUSTER}",
      "export SUPER_ADMIN_ROLE_ID=${var.SUPER_ADMIN_ROLE_ID}",
      "export SUPER_ADMIN_FULLNAME=${var.SUPER_ADMIN_FULLNAME}",
      "export SUPER_ADMIN_USERNAME=${var.SUPER_ADMIN_USERNAME}",
      "export SUPER_ADMIN_EMAIL=${var.SUPER_ADMIN_EMAIL}",
      "export SUPER_ADMIN_PASSWORD=${var.SUPER_ADMIN_PASSWORD}",
      "export SUPER_ADMIN_AUTHTYPEID=${var.SUPER_ADMIN_AUTHTYPEID}",
      "git clone https://github.com/rafmme/instance-setup",
       "cd instance-setup",
      "chmod u+x api-setup.sh",
      "./api-setup.sh"
    ]
  }

  depends_on = ["aws_instance.bastion-host", "aws_instance.db_instance", "aws_instance.nat-instance"]
}

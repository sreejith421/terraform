data "aws_ami" "latest_ami_v2_ebs" {
  most_recent = true
  owners      = ["amazon"]  
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-ebs"]
  }
}
resource "aws_instance" "sentry" {
  ami                    = data.aws_ami.latest_ami_v2_ebs.id
  instance_type          = "t3a.medium"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  


tags = {
    Name                = "${var.host_name}"
    prod                = "${var.host_prod}"
    ec2_schedule        = "${var.host_ec2_schedule}"
    owner               = "${var.host_owner}"
    working_environment = "${var.host_working_environment}"
    terraform           = "True"
    dom_is_zone         = "${var.host_dom_is_zone}"
    to_be_terminated    = "False"
    
  }

  connection {
    user        = "ec2-user"
    host        = self.private_ip
    private_key = file(var.ssh_private_key)
  }  
  
 
  
    provisioner "remote-exec" {
      inline = [
        "sudo amazon-linux-extras install -y docker",
        "sudo service docker start",
        "sudo usermod -a -G docker $USER",
        "sudo chkconfig docker on",
        "export DOCKER_COMPOSE_VERSION=${var.docker_compose_version}",
        "sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose"
    ]
  }  

     provisioner "remote-exec" {
       inline = [
         "chmod +x ${path.cwd}/onpremise/install.sh",
         "chmod +x ${path.cwd}/onpremise/cron/entrypoint.sh",
         "docker-compose up -d"
    ]
  
}


}

resource "aws_instance" "centos-7-newbox" {
  count                       = 2
  ami                         = var.ami-image
  associate_public_ip_address = var.public_ip
  vpc_security_group_ids = ["${aws_security_group.remo_sg.id}"]
  instance_type               = var.image-size
  subnet_id                   = var.se_subnet_id
  key_name                    = var.ssh_key
  tags                        = {
    dept                      = var.department_name
    shutdown_policy           = var.shutdown_rules
    owner                     = var.owner
    Name                      = "${var.vm_name}-${count.index +1}"
  }
  
  provisioner "remote-exec" {
    #connection {
    #  type  = "ssh"
    #  user  = "centos"
    #  #host = "${join(",", aws_instance.centos-7[count.index].id)}"
    #  host  = self.public_ip
    #  #host  = "${element(aws_instance.centos-7.*.public_ip, count.index)}"
    #  agent = "true"
    #}
    inline = [
     "sudo yum install -y yum-utils",
     "sudo yum-config-manager  --add-repo  https://download.docker.com/linux/centos/docker-ce.repo",
     "sudo yum install -y docker"
    ]
  }
}

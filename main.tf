
resource "aws_instance" "centos-7-newbox" {
  count                       = 2
  #Name                        = "${var.vm_name}-${count.index}"
  ami                         = "${var.ami-image}"
  associate_public_ip_address = "${var.public_ip}"
  security_groups             = ["${aws_security_group.remo_sg.id}"]
  instance_type               = "${var.image-size}"
  subnet_id                   = "${var.se_subnet_id}"
  key_name                    = "remo-key-openstack"
  tags                        = {
    Name                     = "${var.vm_name}-${count.index}"
    dept                      = "${var.department_name}"
    shutdown_policy           = "${var.shutdown_rules}"
    owner                     = "${var.owner}"
    Name                      = "${var.vm_name}-${count.index +1}"
  }
  
  provisioner "remote-exec" {
    connection {
      type  = "ssh"
      user  = "centos"
      #host = "${join(",", aws_instance.centos-7[count.index].id)}"
      host  = self.public_ip
      #host  = "${element(aws_instance.centos-7.*.public_ip, count.index)}"
      agent = "true"
    }
    inline = [
      "sudo systemctl mask firewalld",
      "sudo systemctl stop firewalld",
      "sudo systemctl install iptables.services",
      "sudo systemctl enable --now iptables.services",
      "sudo yum install -y docker",
      "sudo systemctl enable --now docker",
    ]
  }
}

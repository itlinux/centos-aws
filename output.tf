output  public_ip {
  value =  aws_instance.centos-7-newbox[*].public_ip
 }

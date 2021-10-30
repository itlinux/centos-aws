output  public_ip {
  value =  aws_instance.centos-7-newbox[*].public_ip
 }
 # output ssh_gen {
 #  value = file("./${aws_key_pair.generated.key_name}.pem")
 #  sensitive = false
# }

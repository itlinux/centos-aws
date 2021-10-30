terraform {
  backend "remote" {
    organization = "remo"

    workspaces {
      name = "centos-aws"
    }
  }
}

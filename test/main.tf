provider "aws" {
  version = "1.7.1"
}

module "dockercloud_swarm_role" {
  source = ".."
}

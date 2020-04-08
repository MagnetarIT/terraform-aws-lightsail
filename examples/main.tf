provider "aws" {
  region = "eu-west-2"
}

module "lightsail" {
  source = "../"
  namespace = "mag"
  environment = "dev"
  name = "myapp"
}

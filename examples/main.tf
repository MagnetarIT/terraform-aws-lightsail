provider "aws" {
  region = "eu-west-2"
}

module "lightsail" {
  source                 = "../"
  namespace              = "mag"
  environment            = "dev"
  name                   = "wordpress"
  customer_email         = "lewis@magnetarit.co.uk"
  customer_business_name = "Magnetar Consulting Ltd"
}

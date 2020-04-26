provider "aws" {
  region = "eu-west-2"
}

module "lightsail" {
  source                 = "../"
  namespace              = "mag"
  environment            = "dev"
  name                   = "myapp"
  customer_email         = "kate@writingit.co.uk"
  customer_business_name = "WritingIT"
  application            = "website"
}

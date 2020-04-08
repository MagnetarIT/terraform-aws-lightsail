module "naming" {
  source      = "git::https://github.com/MagnetarIT/terraform-naming-standard.git?ref=tags/0.1.0"
  namespace   = var.namespace
  environment = var.environment
  name        = var.name
  attributes  = var.attributes
  tags        = var.tags
}

data "aws_region" "default" {
}

resource "aws_lightsail_instance" "instance" {
  name              = module.naming.id
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.key_pair_name == "" ? "${module.naming.id}-keypair" : var.key_pair_name
  tags              = module.naming.tags
  depends_on        = [aws_lightsail_key_pair.instance]
}

resource "aws_lightsail_static_ip_attachment" "instance" {
  count          = var.create_static_ip == true ? 1 : 0
  static_ip_name = aws_lightsail_static_ip.instance[count.index].id
  instance_name  = aws_lightsail_instance.instance.id
}

resource "aws_lightsail_static_ip" "instance" {
  count = var.create_static_ip == true ? 1 : 0
  name  = "${module.naming.id}-IP"
}

resource "aws_lightsail_key_pair" "instance" {
  count = var.key_pair_name == "" ? 1 : 0
  name  = "${module.naming.id}-keypair"
}

resource "null_resource" "email_alarm" {
  count = var.enable_email_alarm == true ? 1 : 0
  provisioner "local-exec" {
    command = <<EOT
      aws lightsail put-alarm --alarm-name ${module.naming.id}-status-checks --metric-name StatusCheckFailed --monitored-resource-name ${module.naming.id} --comparison-operator GreaterThanThreshold --threshold 0 --evaluation-periods 1 --region ${data.aws_region.default.name} --contact-protocols Email ;
    EOT 
  }
  depends_on = [aws_lightsail_instance.instance]
}

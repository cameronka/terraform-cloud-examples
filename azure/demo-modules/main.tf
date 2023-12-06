module "instance" {
  source  = "app.terraform.io/mack-demo/instance/dsiprouter"
  version = "1.0.4"
  prefix = "mack_dev"
}

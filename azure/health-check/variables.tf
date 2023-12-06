variable "number_of_servers" {
	default="1"
}

variable "branch" {
	default="master"
}

variable "region" {
	default="tor1"
}

variable "hostname" {
	default="demo.dsiprouter.org"
}

variable "image" {
	default="debian-9-x64"
}

variable "prefix" {}

variable "location" {
	default="northcentralus"
}

variable "resource_group" {
	default="dopensource-dev"
}

variable "num_of_fusionpbx_instances" {
	default=2
}

variable "installopts" {

	default="-all -servernat"
}

variable "pvt_key" {
	default="~/.ssh/jump"
}

variable "pub_key" {
	 default="~/.ssh/jump.pub"
}



variable "subscription_id" {
	default=""
}

variable "client_id" {
	default=""
}

variable "client_secret" {
	default=""
}

variable "tenant_id" {
	default=""

}

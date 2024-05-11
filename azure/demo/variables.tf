variable "dropletname" {}

variable "number_of_servers" {}

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
	default="0c506d70-8b26-4107-82c1-a703f9088588"
}

variable "client_id" {
	default=""
}

variable "client_secret" {
	default=""
}

variable "tenant_id" {
	default="710c616d-6dcf-4384-99bb-6f652a890333"

}

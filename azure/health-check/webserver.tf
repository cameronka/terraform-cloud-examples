resource "tls_private_key" "webserver_ssh" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "azurerm_linux_virtual_machine" "webserver" {
  name                            = "${var.prefix}-webserver${count.index}"
  count                           = var.number_of_servers
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  size                            = "Standard_F1"
  admin_username                  = "jump"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.main.id,
    azurerm_network_interface.internal.id,
  ]

  admin_ssh_key {
    username   = "jump"
    public_key = tls_private_key.webserver_ssh.public_key_openssh
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-11"
    sku       = "11"
    version   = "latest"
  }
  #source_image_reference {
  #  publisher = "OpenLogic"
  #  offer     = "CentOS"
  #  sku       = "7.7"
  #  version   = "latest"
  #}

# provisioner "remote-exec" {
#
#   inline = [
#
#     "sudo yum update -y",
#      "sudo yum install -y git",
#      "sudo bash -c 'cd /opt'",
#      "sudo bash -c 'cd /opt && git clone https://github.com/dOpensource/webserver.git -b ${var.branch}'" ,
#      "sudo bash -c 'cd /opt/webserver && ./webserver.sh install ${var.installopts}'"
#
#  ]
#
#  connection {
#    type = "ssh"
#    user = azurerm_linux_virtual_machine.webserver[count.index].admin_username
#    private_key = file(var.pvt_key)
#    host = azurerm_linux_virtual_machine.webserver[count.index].public_ip_address
#  }

#}

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

output "webserver_ip_addr" {
  value = azurerm_linux_virtual_machine.webserver.*.public_ip_address
  description = "Webserver IP addresses"
}

output "webserver_private_key" {
  value = tls_private_key.webserver_ssh.private_key_openssh
  description = "Webserver Private Key"
  sensitive = true
}

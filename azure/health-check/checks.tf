#VM is UP Check

#data "azurerm_virtual_machine" "webserver" {
#  name                = azurerm_virtual_machine.webserver.*.name
#  resource_group_name = azurerm_resource_group.main.name 
#}

#check "check_vm_state" {
#  assert {
#    condition = data.azurerm_linux_virtual_machine.webserver.*.power_state == "running"
#    error_message = format("Virtual Machine (%s) should be in a 'running' status, instead state is '%s'",
#      data.azurerm_linux_virtual_machine.webserver.*.id,
#      data.azurerm_linux_virtual_machine.webserver.*.power_state
#    )
#  }
#}

#HTTP Server is up
check "health_check" {
  data "http" "webserver" {
    url = "http://${azurerm_linux_virtual_machine.webserver[count.index].public_ip_address}"
  }

  assert {
    condition = data.http.webserver.status_code == 200
    error_message = "${azurerm_linux_virtual_machine.webserver.*.url} returned an unhealthy status code"
  }
}



rg_x = {
  "rg1" = {
    name     = "rg_prod_tanu"
    location = "centralindia"
  }
}

# sa_x = {
#   "sa1" = {
#     name                     = "satanu"
#     rg_name                  = "rg_prod_tanu"
#     location                 = "centralindia"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#   }
# }

vnet_x = {
  "vnet1" = {
    name          = "vnet_tanu"
    location      = "centralindia"
    rg_name       = "rg_prod_tanu"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_x = {
  "subnet1" = {
    subnet_name      = "front_subnet"
    rg_name          = "rg_prod_tanu"
    vnet_name        = "vnet_tanu"
    address_prefixes = ["10.0.1.0/24"]
  }

  "subnet2" = {
    subnet_name      = "back_subnet"
    rg_name          = "rg_prod_tanu"
    vnet_name        = "vnet_tanu"
    address_prefixes = ["10.0.2.0/24"]
  }
}

IP_x = {
  "IP1" = {
    IP_name           = "front_pip"
    rg_name           = "rg_prod_tanu"
    IP_location       = "centralindia"
    allocation_method = "Static"
    sku               = "Standard"
  }
  "IP2" = {
    IP_name           = "back_pip"
    rg_name           = "rg_prod_tanu"
    IP_location       = "centralindia"
    allocation_method = "Static"
    sku               = "Standard"
  }
}

nic_x = {
  "front_nic" = {
    name                = "front_nic"
    location            = "centralindia"
    resource_group_name = "rg_prod_tanu"
    subnet_name         = "front_subnet"
    public_ip_name      = "front_pip"
    ip_configuration    = [
      {
        name                          = "front_ipconfig"
        private_ip_address_allocation = "Dynamic"
      }
    ]
  }

  "back_nic" = {
    name                = "back_nic"
    location            = "centralindia"
    resource_group_name = "rg_prod_tanu"
    subnet_name         = "back_subnet"
    public_ip_name      = "back_pip"
    ip_configuration    = [
      {
        name                          = "back_ipconfig"
        private_ip_address_allocation = "Dynamic"
      }
    ]
  }
}

vm_x = {
  "vm1" = {
    vm_name          = "front-vm-tanu"
    rg_name          = "rg_prod_tanu"
    vm_location      = "centralindia"
    vm_size          = "Standard_D2s_v3"
    admin_username   = "admin_login"
    admin_password   = "admin_password"
    disable_password = false
    network_interface_name = "front_nic"

    os_disk = {
      "os_disk_1" = {
      name = "osdisk_tanu_prod1"
      disk_size_gb = 30
      os_caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
      }
    }

    source_image_reference = {
    "image_ref_1" = {
      image_publisher   = "Canonical"
      image_offer      = "0001-com-ubuntu-server-jammy"
      image_sku        = "22_04-LTS"
      image_version    = "latest"
    }
    }
  }

"vm2" = {
    vm_name          = "back-vm-tanu"
    rg_name          = "rg_prod_tanu"
    vm_location      = "centralindia"
    vm_size          = "Standard_D2s_v3"
    admin_username   = "admin_login"
    admin_password   = "admin_password"
    disable_password = false
    network_interface_name = "back_nic"

    os_disk = {
      "os1" = {
      name = "osdisk_tanu_prod2"
      disk_size_gb = 30
      os_caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
      }
    }

    source_image_reference = {

    "image1" = {
      image_publisher   = "Canonical"
      image_offer      = "0001-com-ubuntu-server-jammy"
      image_sku        = "22_04-LTS"
      image_version    = "latest"
    }
    }
  }
}


sql_server_name_x ={
    "sql_server" = {
        sql_name = "sql-server-tanu"
        rg_name = "rg_prod_tanu"
        location = "centralindia"
        sql_version = "12.0"
        administrator_login = "sql_admin_login"
        administrator_password = "sql_admin_password"
    }
}

db_name = {
    "db1" = {
        db_name = "db-tanu"
        collation = "SQL_Latin1_General_CP1_CI_AS"
        license_type = "LicenseIncluded"
        size_gb = "10"
        sku_name = "GP_Gen5_2"
    }
}

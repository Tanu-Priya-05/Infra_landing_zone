module "resource_group" {
    source = "../Module/resource_group"
    rg_name = var.rg_x
}

# module "storage_account" {
#     depends_on = [module.resource_group]
#     source = "../Module/storage_acc"
#     sa_name = var.sa_x
# }

module "virtual_network" {
    depends_on = [module.resource_group]
    source = "../Module/Virtual_network"
    vnet_name = var.vnet_x
}

module "subnet" {
    depends_on = [module.resource_group, module.virtual_network]    
    source = "../Module/subnet"
    subnet_name = var.subnet_x
}

module "public_ip" {
    depends_on = [module.resource_group]
    source = "../Module/public_ip"
    IP_name = var.IP_x
}

module "nic_front" {
    depends_on = [module.subnet, module.public_ip]
    source = "../Module/Nic"
    nic_config = var.nic_x
}

module "virtual_machine" {
    depends_on = [module.subnet, module.public_ip, module.nic_front]
    source = "../Module/Virtual_Machine"
    vm_name = var.vm_x
}

module "sql_server" {
    depends_on = [module.resource_group]
    source = "../Module/sql_server"
    sql_server_name = var.sql_server_name_x
}

module "mysql_database" {
    depends_on = [module.sql_server]
    source = "../Module/mysqldatabase"
    db_name = var.db_name
}
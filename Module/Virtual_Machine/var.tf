variable "vm_name" {
    type = map(object({
        vm_name = string
        vm_location = string
        rg_name = string
        vm_size = string
        admin_username = string
        admin_password = string
        disable_password = bool
        network_interface_name = string

        os_disk = map(object({
            name = string
            disk_size_gb = number
            os_caching = string
            storage_account_type = string
        }))

        source_image_reference = map(object({
        image_publisher = string
        image_offer = string
        image_sku = string
        image_version = string
        }))
    }))
}
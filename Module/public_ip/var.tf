variable "IP_name" {
    type = map(object({
        IP_name = string
        rg_name = string
        IP_location = string
        allocation_method = string
        sku = string
    }))
}
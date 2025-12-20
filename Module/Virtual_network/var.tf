variable "vnet_name" {
    type = map(object({
        name = string
        location = string
        rg_name = string
        address_space = list(string)
    }))
}
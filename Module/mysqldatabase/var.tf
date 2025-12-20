variable "db_name" {
    type = map(object({
        db_name = string
        collation = string
        license_type = string
        size_gb = string
        sku_name = string
    }))
}
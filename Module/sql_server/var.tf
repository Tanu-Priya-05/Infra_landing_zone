variable "sql_server_name" {
    type = map(object({
        sql_name = string
        rg_name = string
        location = string
        sql_version = string
        administrator_login = string
        administrator_password = string
    }))
}
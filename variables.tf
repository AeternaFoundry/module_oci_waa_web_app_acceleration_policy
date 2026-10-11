variable "waa_web_app_acceleration_policies" {
  description = <<EOT
Map of waa_web_app_acceleration_policies, attributes below
Required:
    - compartment_id
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - system_tags
    - response_caching_policy (block):
        - is_response_header_based_caching_enabled (optional)
    - response_compression_policy (block):
        - gzip_compression (optional, block):
            - is_enabled (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    defined_tags   = optional(map(string))
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    system_tags    = optional(map(string))
    response_caching_policy = optional(object({
      is_response_header_based_caching_enabled = optional(bool)
    }))
    response_compression_policy = optional(object({
      gzip_compression = optional(object({
        is_enabled = optional(bool)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}


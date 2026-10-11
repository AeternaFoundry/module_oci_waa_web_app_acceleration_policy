resource "oci_waa_web_app_acceleration_policy" "waa_web_app_acceleration_policies" {
  for_each = var.waa_web_app_acceleration_policies

  compartment_id = each.value.compartment_id
  defined_tags   = each.value.defined_tags
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags
  system_tags    = each.value.system_tags

  dynamic "response_caching_policy" {
    for_each = each.value.response_caching_policy != null ? [each.value.response_caching_policy] : []
    content {
      is_response_header_based_caching_enabled = response_caching_policy.value.is_response_header_based_caching_enabled
    }
  }

  dynamic "response_compression_policy" {
    for_each = each.value.response_compression_policy != null ? [each.value.response_compression_policy] : []
    content {
      dynamic "gzip_compression" {
        for_each = response_compression_policy.value.gzip_compression != null ? [response_compression_policy.value.gzip_compression] : []
        content {
          is_enabled = gzip_compression.value.is_enabled
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}


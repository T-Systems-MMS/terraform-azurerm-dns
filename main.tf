/**
 * # dns
 *
 * This module manages Azure DNS Zones.
 *
*/

/** DNS Zone */
resource "azurerm_dns_zone" "dns_zone" {
  for_each = var.dns_zone

  name                = local.dns_zone[each.key].name == "" ? each.key : local.dns_zone[each.key].name
  resource_group_name = local.dns_zone[each.key].resource_group_name

  tags = local.dns_zone[each.key].tags
}

/** Private DNS Zone */
resource "azurerm_private_dns_zone" "private_dns_zone" {
  for_each = var.private_dns_zone

  name                = local.private_dns_zone[each.key].name == "" ? each.key : local.private_dns_zone[each.key].name
  resource_group_name = local.private_dns_zone[each.key].resource_group_name

  tags = local.private_dns_zone[each.key].tags
}

/** DNS A Records */
resource "azurerm_dns_a_record" "dns_a_record" {
  for_each = var.dns_a_record

  name                = local.dns_a_record[each.key].name == "" ? each.key : local.dns_a_record[each.key].name
  resource_group_name = local.dns_a_record[each.key].resource_group_name
  zone_name           = local.dns_a_record[each.key].zone_name
  ttl                 = local.dns_a_record[each.key].ttl
  records             = local.dns_a_record[each.key].records

  tags = local.dns_a_record[each.key].tags
}

/** DNS Alias Records to Azure Resources */
resource "azurerm_dns_a_record" "dns_a_target" {
  for_each = var.dns_a_target

  name                = local.dns_a_target[each.key].name == "" ? each.key : local.dns_a_target[each.key].name
  resource_group_name = local.dns_a_target[each.key].resource_group_name
  zone_name           = local.dns_a_target[each.key].zone_name
  ttl                 = local.dns_a_target[each.key].ttl
  target_resource_id  = local.dns_a_target[each.key].target_resource_id

  tags = local.dns_a_target[each.key].tags
}

/** DNS CNAME Records */
resource "azurerm_dns_cname_record" "dns_cname_record" {
  for_each = var.dns_cname_record

  name                = local.dns_cname_record[each.key].name == "" ? each.key : local.dns_cname_record[each.key].name
  resource_group_name = local.dns_cname_record[each.key].resource_group_name
  zone_name           = local.dns_cname_record[each.key].zone_name
  ttl                 = local.dns_cname_record[each.key].ttl
  record              = local.dns_cname_record[each.key].record

  tags = local.dns_cname_record[each.key].tags
}

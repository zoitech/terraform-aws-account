resource "aws_kms_key" "key" {
  count                   = local.create_kms_keys
  description             = lookup(element(var.kms_keys, count.index), "description")
  deletion_window_in_days = lookup(element(var.kms_keys, count.index), "deletion_window_in_days")
  is_enabled              = lookup(element(var.kms_keys, count.index), "is_enabled")
  enable_key_rotation     = lookup(element(var.kms_keys, count.index), "enable_key_rotation")
  #policy =
  #tags = 
}

resource "aws_kms_alias" "key_alias" {
  count         = local.create_kms_keys
  name          = lookup(element(var.kms_keys, count.index), "alias_name")
  target_key_id = aws_kms_key.key[count.index].key_id
}

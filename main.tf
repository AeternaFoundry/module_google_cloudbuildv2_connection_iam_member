resource "google_cloudbuildv2_connection_iam_member" "cloudbuildv2_connection_iam_members" {
  for_each = var.cloudbuildv2_connection_iam_members

  member   = each.value.member
  name     = each.value.name
  role     = each.value.role
  location = each.value.location
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}


module "iam_assumable_role_admin" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 4.0"

  create_role = true

  role_name        = var.iam_role_name
  role_path        = var.iam_role_path
  role_description = var.iam_role_description

  role_permissions_boundary_arn = var.iam_role_permission_boundary

  provider_url = replace(var.cluster_oidc_issuer_url, "https://", "")
  oidc_fully_qualified_subjects = [
    "system:serviceaccount:${var.chart_namespace}:${local.service_account_name}"
  ]

  tags = var.iam_role_tags
}

locals {
  fetch_iam_policy = var.iam_role_policy == "" || var.iam_role_policy == null
}

data "http" "iam_policy" {
  count = local.fetch_iam_policy ? 1 : 0

  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/${var.image_tag}/docs/install/iam_policy.json"
}

resource "aws_iam_role_policy" "controller" {
  name_prefix = "AWSLoadBalancerControllerIAMPolicy"
  policy      = local.fetch_iam_policy ? data.http.iam_policy[0].body : var.iam_role_policy
  role        = module.iam_assumable_role_admin.iam_role_name
}

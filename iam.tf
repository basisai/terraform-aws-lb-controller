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

# Policy from https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2_ga/docs/install/iam_policy.json
resource "aws_iam_role_policy" "controller" {
  name_prefix = "AWSLoadBalancerControllerIAMPolicy"
  policy      = file("${path.module}/templates/policy.json")
  role        = module.iam_assumable_role_admin.iam_role_name
}

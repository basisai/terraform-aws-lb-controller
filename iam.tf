module "lb_controller_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 4.21.1"

  role_name_prefix = coalesce(var.iam_role_name, "${var.cluster_name}-lb-")
  role_description = "EKS Cluster ${var.cluster_name} LoadBalancer Controller"

  attach_load_balancer_controller_policy = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["kube-system:${local.service_account_name}"]
    }
  }
}

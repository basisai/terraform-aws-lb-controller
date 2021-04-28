locals {
  service_account_name = var.service_account_name

  values = {
    name_override     = var.name_override
    fullname_override = var.fullname_override

    replicas = var.replicas

    image_repository = var.image_repository
    image_tag        = var.image_tag

    service_account_name = var.service_account_name
    service_account_annotations = jsonencode(merge(
      {
        "eks.amazonaws.com/role-arn" = module.iam_assumable_role_admin.iam_role_arn
      },
      var.service_account_annotations,
    ))

    pod_security_context             = jsonencode(var.pod_security_context)
    security_context                 = jsonencode(var.security_context)
    termination_grace_period_seconds = var.termination_grace_period_seconds
    resources                        = jsonencode(var.resources)

    priority_class_name = var.priority_class_name
    tolerations         = jsonencode(var.tolerations)
    affinity            = jsonencode(var.affinity)

    pod_annotations = jsonencode(var.pod_annotations)
    pod_labels      = jsonencode(var.pod_labels)

    env                 = jsonencode(var.env)
    host_network        = var.host_network
    extra_volumes       = jsonencode(var.extra_volumes)
    extra_volume_mounts = jsonencode(var.extra_volume_mounts)
    pdb                 = jsonencode(var.pdb)

    enable_cert_manager = var.enable_cert_manager

    cluster_name                                 = var.cluster_name
    ingress_class                                = var.ingress_class
    region                                       = var.region
    vpc_id                                       = var.vpc_id
    aws_max_retries                              = var.aws_max_retries
    enable_pod_readiness_gate_inject             = var.enable_pod_readiness_gate_inject
    enable_shield                                = var.enable_shield
    enable_waf                                   = var.enable_waf
    enable_wafv2                                 = var.enable_wafv2
    ingress_max_concurrent_reconciles            = var.ingress_max_concurrent_reconciles
    log_level                                    = var.log_level
    metrics_bind_addr                            = var.metrics_bind_addr
    webhook_bind_port                            = var.webhook_bind_port
    service_max_concurrent_reconciles            = var.service_max_concurrent_reconciles
    targetgroupbinding_max_concurrent_reconciles = var.targetgroupbinding_max_concurrent_reconciles
    sync_period                                  = var.sync_period
    watch_namespace                              = var.watch_namespace
    default_tags                                 = jsonencode(var.default_tags)
  }
}

resource "helm_release" "release" {
  name       = var.release_name
  chart      = var.chart_name
  repository = var.chart_repository
  version    = var.chart_version
  namespace  = var.chart_namespace

  max_history = var.max_history
  timeout     = var.chart_timeout

  values = [
    templatefile("${path.module}/templates/values.yaml", local.values),
  ]
}

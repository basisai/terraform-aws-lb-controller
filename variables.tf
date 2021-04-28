variable "release_name" {
  description = "Helm release name"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "chart_name" {
  description = "Helm chart name to provision"
  default     = "aws-load-balancer-controller"
}

variable "chart_repository" {
  description = "Helm repository for the chart"
  default     = "https://aws.github.io/eks-charts"
}

variable "chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = "1.1.6"
}

variable "chart_namespace" {
  description = "Namespace to install the chart into"
  default     = "kube-system"
}

variable "chart_timeout" {
  description = "Timeout to wait for the Chart to be deployed."
  default     = 300
}

variable "max_history" {
  description = "Max History for Helm"
  default     = 20
}

########################
# Chart Values
########################
variable "replicas" {
  description = "Number of replicas"
  type        = number
  default     = 1
}

variable "image_repository" {
  description = "Image repository"
  type        = string
  default     = "amazon/aws-alb-ingress-controller"
}

variable "image_tag" {
  description = "Image tag"
  type        = string
  default     = "v2.1.3"
}

variable "name_override" {
  description = "Name override for resources"
  type        = string
  default     = ""
}

variable "fullname_override" {
  description = "Full name override for resources"
  type        = string
  default     = ""
}

variable "service_account_name" {
  description = "Name of service account to create. Not generated"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "service_account_annotations" {
  description = "Addiitional Annotations for service account"
  type        = map(string)
  default     = {}
}

variable "pod_security_context" {
  description = "Pod Security Context"
  type        = map(any)
  default = {
    fsGroup = 65534
  }
}

variable "security_context" {
  description = "Security Context for container"
  type        = map(any)
  default = {
    readOnlyRootFilesystem   = true
    runAsNonRoot             = true
    allowPrivilegeEscalation = false
  }
}

variable "termination_grace_period_seconds" {
  description = "Time period for the controller pod to do a graceful shutdown"
  type        = number
  default     = 10
}

variable "resources" {
  description = "Pod Resources"
  type        = map(any)
  default = {
    requests = {
      cpu    = "100m"
      memory = "500Mi"
    }
    limits = {
      cpu    = "200m"
      memory = "500Mi"
    }
  }
}

variable "priority_class_name" {
  description = "Priority class for pod"
  type        = string
  default     = "system-cluster-critical"
}

variable "tolerations" {
  description = "Pod Tolerations"
  type        = list(any)
  default     = []
}

variable "affinity" {
  description = "Pod affinity"
  type        = map(any)
  default     = {}
}

variable "pod_annotations" {
  description = "Additional annotations on a pod"
  type        = map(string)
  default     = {}
}

variable "pod_labels" {
  description = "Additional labels on a pod"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "Fixed environment variables for container"
  type        = map(string)
  default     = {}
}

variable "host_network" {
  description = "Use Host Network for pod"
  type        = bool
  default     = false
}

variable "extra_volumes" {
  description = "Extra volumes"
  type        = list(any)
  default     = []
}

variable "extra_volume_mounts" {
  description = "Extra Volume mounts"
  type        = list(any)
  default     = []
}

variable "pdb" {
  description = "PDB for pod"
  type        = map(any)
  default     = {}
}

variable "enable_cert_manager" {
  description = "Enable cert-manager injection of webhook certficates"
  type        = bool
  default     = false
}

########################
# Controller Settings
variable "cluster_name" {
  ########################
  description = "Name of Kubernetes Cluster"
  type        = string
}

variable "ingress_class" {
  description = "The ingress class this controller will satisfy. If not specified, controller will match all ingresses without ingress class annotation and ingresses of type alb"
  type        = string
  default     = "alb"
}

variable "region" {
  description = "The AWS region for the kubernetes cluster. Set to use KIAM or kube2iam for example."
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The VPC ID for the Kubernetes cluster. Set this manually when your pods are unable to use the metadata service to determine this automatically"
  type        = string
  default     = ""
}

variable "aws_max_retries" {
  description = "Maximum retries for AWS APIs (default 10)"
  type        = number
  default     = 10
}

variable "enable_pod_readiness_gate_inject" {
  description = "If enabled, targetHealth readiness gate will get injected to the pod spec for the matching endpoint pods (default true)"
  type        = bool
  default     = true
}

variable "enable_shield" {
  description = "Enable Shield addon for ALB (default true)"
  type        = bool
  default     = true
}

variable "enable_waf" {
  description = "Enable WAF addon for ALB (default true)"
  type        = bool
  default     = true
}

variable "enable_wafv2" {
  description = "Enable WAF V2 addon for ALB (default true)"
  type        = bool
  default     = true
}

variable "ingress_max_concurrent_reconciles" {
  description = "Maximum number of concurrently running reconcile loops for ingress (default 3)"
  type        = number
  default     = 3
}

variable "log_level" {
  description = "Log level. Either `info` or `debug"
  type        = string
  default     = "info"
}

variable "metrics_bind_addr" {
  description = "The address the metric endpoint binds to. (default ':8080')"
  type        = string
  default     = ":8080"
}

variable "webhook_bind_port" {
  description = "The TCP port the Webhook server binds to. (default 9443)"
  type        = number
  default     = 9443
}

variable "service_max_concurrent_reconciles" {
  description = "Maximum number of concurrently running reconcile loops for service (default 3)"
  type        = number
  default     = 3
}

variable "targetgroupbinding_max_concurrent_reconciles" {
  description = "Maximum number of concurrently running reconcile loops for targetGroupBinding"
  type        = number
  default     = 3
}

variable "sync_period" {
  description = "Period at which the controller forces the repopulation of its local object stores. (default 1h0m0s)"
  type        = string
  default     = "1h0m0s"
}

variable "watch_namespace" {
  description = "Watch a single namespace if specified, or all namespaces if not"
  type        = string
  default     = ""
}

variable "default_tags" {
  description = "Default tags to apply to all AWS resources managed by this controller"
  type        = map(string)
  default     = {}
}

########################
# IAM Role
########################
variable "cluster_oidc_issuer_url" {
  description = "OIDC provider URL for EKS cluster"
  type        = string
}

variable "iam_role_name" {
  description = "Name of IAM role for controller"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "iam_role_description" {
  description = "Description for IAM role for controller"
  type        = string
  default     = "Used by AWS Load Balancer Controller for EKS"
}

variable "iam_role_path" {
  description = "IAM Role path for controller"
  type        = string
  default     = ""
}

variable "iam_role_permission_boundary" {
  description = "Permission boundary ARN for IAM Role for controller"
  type        = string
  default     = ""
}

variable "iam_role_tags" {
  description = "Tags for IAM Role for controller"
  type        = map(string)
  default     = {}
}

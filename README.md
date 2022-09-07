# AWS LoadBalancer Controller for Kubernetes

This module deploys
[AWS LoadBalancer Controller](https://kubernetes-sigs.github.io/aws-load-balancer-controller)
to a Kubernetes Cluster.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.28 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.28 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2 |
| <a name="provider_http"></a> [http](#provider\_http) | >= 2.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_assumable_role_admin"></a> [iam\_assumable\_role\_admin](#module\_iam\_assumable\_role\_admin) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role_policy.controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [helm_release.release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [http_http.iam_policy](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_affinity"></a> [affinity](#input\_affinity) | Pod affinity | `map(any)` | `{}` | no |
| <a name="input_aws_max_retries"></a> [aws\_max\_retries](#input\_aws\_max\_retries) | Maximum retries for AWS APIs (default 10) | `number` | `10` | no |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | Helm chart name to provision | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_chart_namespace"></a> [chart\_namespace](#input\_chart\_namespace) | Namespace to install the chart into | `string` | `"kube-system"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | Helm repository for the chart | `string` | `"https://aws.github.io/eks-charts"` | no |
| <a name="input_chart_timeout"></a> [chart\_timeout](#input\_chart\_timeout) | Timeout to wait for the Chart to be deployed. | `number` | `300` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of Chart to install. Set to empty to install the latest version | `string` | `"1.3.2"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of Kubernetes Cluster | `string` | n/a | yes |
| <a name="input_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#input\_cluster\_oidc\_issuer\_url) | OIDC provider URL for EKS cluster | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags to apply to all AWS resources managed by this controller | `map(string)` | `{}` | no |
| <a name="input_enable_cert_manager"></a> [enable\_cert\_manager](#input\_enable\_cert\_manager) | Enable cert-manager injection of webhook certficates | `bool` | `false` | no |
| <a name="input_enable_pod_readiness_gate_inject"></a> [enable\_pod\_readiness\_gate\_inject](#input\_enable\_pod\_readiness\_gate\_inject) | If enabled, targetHealth readiness gate will get injected to the pod spec for the matching endpoint pods (default true) | `bool` | `true` | no |
| <a name="input_enable_shield"></a> [enable\_shield](#input\_enable\_shield) | Enable Shield addon for ALB (default true) | `bool` | `true` | no |
| <a name="input_enable_waf"></a> [enable\_waf](#input\_enable\_waf) | Enable WAF addon for ALB (default true) | `bool` | `true` | no |
| <a name="input_enable_wafv2"></a> [enable\_wafv2](#input\_enable\_wafv2) | Enable WAF V2 addon for ALB (default true) | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | Fixed environment variables for container | `map(string)` | `{}` | no |
| <a name="input_extra_volume_mounts"></a> [extra\_volume\_mounts](#input\_extra\_volume\_mounts) | Extra Volume mounts | `list(any)` | `[]` | no |
| <a name="input_extra_volumes"></a> [extra\_volumes](#input\_extra\_volumes) | Extra volumes | `list(any)` | `[]` | no |
| <a name="input_fullname_override"></a> [fullname\_override](#input\_fullname\_override) | Full name override for resources | `string` | `""` | no |
| <a name="input_host_network"></a> [host\_network](#input\_host\_network) | Use Host Network for pod | `bool` | `false` | no |
| <a name="input_iam_role_description"></a> [iam\_role\_description](#input\_iam\_role\_description) | Description for IAM role for controller | `string` | `"Used by AWS Load Balancer Controller for EKS"` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of IAM role for controller | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_iam_role_path"></a> [iam\_role\_path](#input\_iam\_role\_path) | IAM Role path for controller | `string` | `""` | no |
| <a name="input_iam_role_permission_boundary"></a> [iam\_role\_permission\_boundary](#input\_iam\_role\_permission\_boundary) | Permission boundary ARN for IAM Role for controller | `string` | `""` | no |
| <a name="input_iam_role_policy"></a> [iam\_role\_policy](#input\_iam\_role\_policy) | Override the IAM policy for the controller | `string` | `""` | no |
| <a name="input_iam_role_tags"></a> [iam\_role\_tags](#input\_iam\_role\_tags) | Tags for IAM Role for controller | `map(string)` | `{}` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | Image repository on Dockerhub | `string` | `"amazon/aws-alb-ingress-controller"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Image tag | `string` | `"v2.3.0"` | no |
| <a name="input_ingress_class"></a> [ingress\_class](#input\_ingress\_class) | The ingress class this controller will satisfy. If not specified, controller will match all ingresses without ingress class annotation and ingresses of type alb | `string` | `"alb"` | no |
| <a name="input_ingress_max_concurrent_reconciles"></a> [ingress\_max\_concurrent\_reconciles](#input\_ingress\_max\_concurrent\_reconciles) | Maximum number of concurrently running reconcile loops for ingress (default 3) | `number` | `3` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | Log level. Either `info` or `debug` | `string` | `"info"` | no |
| <a name="input_max_history"></a> [max\_history](#input\_max\_history) | Max History for Helm | `number` | `20` | no |
| <a name="input_metrics_bind_addr"></a> [metrics\_bind\_addr](#input\_metrics\_bind\_addr) | The address the metric endpoint binds to. (default ':8080') | `string` | `":8080"` | no |
| <a name="input_name_override"></a> [name\_override](#input\_name\_override) | Name override for resources | `string` | `""` | no |
| <a name="input_pdb"></a> [pdb](#input\_pdb) | PDB for pod | `map(any)` | `{}` | no |
| <a name="input_pod_annotations"></a> [pod\_annotations](#input\_pod\_annotations) | Additional annotations on a pod | `map(string)` | `{}` | no |
| <a name="input_pod_labels"></a> [pod\_labels](#input\_pod\_labels) | Additional labels on a pod | `map(string)` | `{}` | no |
| <a name="input_pod_security_context"></a> [pod\_security\_context](#input\_pod\_security\_context) | Pod Security Context | `map(any)` | <pre>{<br>  "fsGroup": 65534<br>}</pre> | no |
| <a name="input_prefer_ecr_repositories"></a> [prefer\_ecr\_repositories](#input\_prefer\_ecr\_repositories) | Prefer ECR repositories according to the region. If none can be found, `var.image_repository` is used | `bool` | `true` | no |
| <a name="input_priority_class_name"></a> [priority\_class\_name](#input\_priority\_class\_name) | Priority class for pod | `string` | `"system-cluster-critical"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region for the kubernetes cluster. Set to use KIAM or kube2iam for example. | `string` | `""` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Helm release name | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of replicas | `number` | `1` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Pod Resources | `map(any)` | <pre>{<br>  "limits": {<br>    "cpu": "200m",<br>    "memory": "500Mi"<br>  },<br>  "requests": {<br>    "cpu": "100m",<br>    "memory": "500Mi"<br>  }<br>}</pre> | no |
| <a name="input_security_context"></a> [security\_context](#input\_security\_context) | Security Context for container | `map(any)` | <pre>{<br>  "allowPrivilegeEscalation": false,<br>  "readOnlyRootFilesystem": true,<br>  "runAsNonRoot": true<br>}</pre> | no |
| <a name="input_service_account_annotations"></a> [service\_account\_annotations](#input\_service\_account\_annotations) | Addiitional Annotations for service account | `map(string)` | `{}` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Name of service account to create. Not generated | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_service_max_concurrent_reconciles"></a> [service\_max\_concurrent\_reconciles](#input\_service\_max\_concurrent\_reconciles) | Maximum number of concurrently running reconcile loops for service (default 3) | `number` | `3` | no |
| <a name="input_sync_period"></a> [sync\_period](#input\_sync\_period) | Period at which the controller forces the repopulation of its local object stores. (default 1h0m0s) | `string` | `"1h0m0s"` | no |
| <a name="input_targetgroupbinding_max_concurrent_reconciles"></a> [targetgroupbinding\_max\_concurrent\_reconciles](#input\_targetgroupbinding\_max\_concurrent\_reconciles) | Maximum number of concurrently running reconcile loops for targetGroupBinding | `number` | `3` | no |
| <a name="input_termination_grace_period_seconds"></a> [termination\_grace\_period\_seconds](#input\_termination\_grace\_period\_seconds) | Time period for the controller pod to do a graceful shutdown | `number` | `10` | no |
| <a name="input_tolerations"></a> [tolerations](#input\_tolerations) | Pod Tolerations | `list(any)` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID for the Kubernetes cluster. Set this manually when your pods are unable to use the metadata service to determine this automatically | `string` | `""` | no |
| <a name="input_watch_namespace"></a> [watch\_namespace](#input\_watch\_namespace) | Watch a single namespace if specified, or all namespaces if not | `string` | `""` | no |
| <a name="input_webhook_bind_port"></a> [webhook\_bind\_port](#input\_webhook\_bind\_port) | The TCP port the Webhook server binds to. (default 9443) | `number` | `9443` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | Name of IAM role |
| <a name="output_iam_role_path"></a> [iam\_role\_path](#output\_iam\_role\_path) | Path of IAM role |
| <a name="output_iam_role_unique_id"></a> [iam\_role\_unique\_id](#output\_iam\_role\_unique\_id) | Unique ID of IAM role |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_controller_role"></a> [lb\_controller\_role](#module\_lb\_controller\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 4.21.1 |

## Resources

| Name | Type |
|------|------|
| [helm_release.release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_affinity"></a> [affinity](#input\_affinity) | Pod affinity | `map(any)` | `{}` | no |
| <a name="input_aws_max_retries"></a> [aws\_max\_retries](#input\_aws\_max\_retries) | Maximum retries for AWS APIs (default 10) | `number` | `10` | no |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | Helm chart name to provision | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_chart_namespace"></a> [chart\_namespace](#input\_chart\_namespace) | Namespace to install the chart into | `string` | `"kube-system"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | Helm repository for the chart | `string` | `"https://aws.github.io/eks-charts"` | no |
| <a name="input_chart_timeout"></a> [chart\_timeout](#input\_chart\_timeout) | Timeout to wait for the Chart to be deployed. | `number` | `300` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of Chart to install. Set to empty to install the latest version | `string` | `"1.3.2"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of Kubernetes Cluster | `string` | n/a | yes |
| <a name="input_cluster_tag_check"></a> [cluster\_tag\_check](#input\_cluster\_tag\_check) | Enable or disable subnet tag check | `bool` | `false` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags to apply to all AWS resources managed by this controller | `map(string)` | `{}` | no |
| <a name="input_enable_cert_manager"></a> [enable\_cert\_manager](#input\_enable\_cert\_manager) | Enable cert-manager injection of webhook certficates | `bool` | `false` | no |
| <a name="input_enable_pod_readiness_gate_inject"></a> [enable\_pod\_readiness\_gate\_inject](#input\_enable\_pod\_readiness\_gate\_inject) | If enabled, targetHealth readiness gate will get injected to the pod spec for the matching endpoint pods (default true) | `bool` | `true` | no |
| <a name="input_enable_shield"></a> [enable\_shield](#input\_enable\_shield) | Enable Shield addon for ALB (default true) | `bool` | `true` | no |
| <a name="input_enable_waf"></a> [enable\_waf](#input\_enable\_waf) | Enable WAF addon for ALB (default true) | `bool` | `true` | no |
| <a name="input_enable_wafv2"></a> [enable\_wafv2](#input\_enable\_wafv2) | Enable WAF V2 addon for ALB (default true) | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | Fixed environment variables for container | `map(string)` | `{}` | no |
| <a name="input_extra_volume_mounts"></a> [extra\_volume\_mounts](#input\_extra\_volume\_mounts) | Extra Volume mounts | `list(any)` | `[]` | no |
| <a name="input_extra_volumes"></a> [extra\_volumes](#input\_extra\_volumes) | Extra volumes | `list(any)` | `[]` | no |
| <a name="input_fullname_override"></a> [fullname\_override](#input\_fullname\_override) | Full name override for resources | `string` | `""` | no |
| <a name="input_host_network"></a> [host\_network](#input\_host\_network) | Use Host Network for pod | `bool` | `false` | no |
| <a name="input_iam_role_description"></a> [iam\_role\_description](#input\_iam\_role\_description) | Description for IAM role for controller | `string` | `"Used by AWS Load Balancer Controller for EKS"` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of IAM role for controller | `string` | `""` | no |
| <a name="input_iam_role_path"></a> [iam\_role\_path](#input\_iam\_role\_path) | IAM Role path for controller | `string` | `""` | no |
| <a name="input_iam_role_permission_boundary"></a> [iam\_role\_permission\_boundary](#input\_iam\_role\_permission\_boundary) | Permission boundary ARN for IAM Role for controller | `string` | `""` | no |
| <a name="input_iam_role_policy"></a> [iam\_role\_policy](#input\_iam\_role\_policy) | Override the IAM policy for the controller | `string` | `""` | no |
| <a name="input_iam_role_tags"></a> [iam\_role\_tags](#input\_iam\_role\_tags) | Tags for IAM Role for controller | `map(string)` | `{}` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | Image repository on Dockerhub | `string` | `"amazon/aws-alb-ingress-controller"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Image tag | `string` | `"v2.3.0"` | no |
| <a name="input_ingress_class"></a> [ingress\_class](#input\_ingress\_class) | The ingress class this controller will satisfy. If not specified, controller will match all ingresses without ingress class annotation and ingresses of type alb | `string` | `"alb"` | no |
| <a name="input_ingress_max_concurrent_reconciles"></a> [ingress\_max\_concurrent\_reconciles](#input\_ingress\_max\_concurrent\_reconciles) | Maximum number of concurrently running reconcile loops for ingress (default 3) | `number` | `3` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | Log level. Either `info` or `debug` | `string` | `"info"` | no |
| <a name="input_max_history"></a> [max\_history](#input\_max\_history) | Max History for Helm | `number` | `20` | no |
| <a name="input_metrics_bind_addr"></a> [metrics\_bind\_addr](#input\_metrics\_bind\_addr) | The address the metric endpoint binds to. (default ':8080') | `string` | `":8080"` | no |
| <a name="input_name_override"></a> [name\_override](#input\_name\_override) | Name override for resources | `string` | `""` | no |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN for IRSA | `string` | n/a | yes |
| <a name="input_pdb"></a> [pdb](#input\_pdb) | PDB for pod | `map(any)` | `{}` | no |
| <a name="input_pod_annotations"></a> [pod\_annotations](#input\_pod\_annotations) | Additional annotations on a pod | `map(string)` | `{}` | no |
| <a name="input_pod_labels"></a> [pod\_labels](#input\_pod\_labels) | Additional labels on a pod | `map(string)` | `{}` | no |
| <a name="input_pod_security_context"></a> [pod\_security\_context](#input\_pod\_security\_context) | Pod Security Context | `map(any)` | <pre>{<br>  "fsGroup": 65534<br>}</pre> | no |
| <a name="input_prefer_ecr_repositories"></a> [prefer\_ecr\_repositories](#input\_prefer\_ecr\_repositories) | Prefer ECR repositories according to the region. If none can be found, `var.image_repository` is used | `bool` | `true` | no |
| <a name="input_priority_class_name"></a> [priority\_class\_name](#input\_priority\_class\_name) | Priority class for pod | `string` | `"system-cluster-critical"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region for the kubernetes cluster. Set to use KIAM or kube2iam for example. | `string` | `""` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Helm release name | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of replicas | `number` | `1` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Pod Resources | `map(any)` | <pre>{<br>  "limits": {<br>    "cpu": "200m",<br>    "memory": "500Mi"<br>  },<br>  "requests": {<br>    "cpu": "100m",<br>    "memory": "500Mi"<br>  }<br>}</pre> | no |
| <a name="input_security_context"></a> [security\_context](#input\_security\_context) | Security Context for container | `map(any)` | <pre>{<br>  "allowPrivilegeEscalation": false,<br>  "readOnlyRootFilesystem": true,<br>  "runAsNonRoot": true<br>}</pre> | no |
| <a name="input_service_account_annotations"></a> [service\_account\_annotations](#input\_service\_account\_annotations) | Addiitional Annotations for service account | `map(string)` | `{}` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Name of service account to create. Not generated | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_service_max_concurrent_reconciles"></a> [service\_max\_concurrent\_reconciles](#input\_service\_max\_concurrent\_reconciles) | Maximum number of concurrently running reconcile loops for service (default 3) | `number` | `3` | no |
| <a name="input_sync_period"></a> [sync\_period](#input\_sync\_period) | Period at which the controller forces the repopulation of its local object stores. (default 1h0m0s) | `string` | `"1h0m0s"` | no |
| <a name="input_targetgroupbinding_max_concurrent_reconciles"></a> [targetgroupbinding\_max\_concurrent\_reconciles](#input\_targetgroupbinding\_max\_concurrent\_reconciles) | Maximum number of concurrently running reconcile loops for targetGroupBinding | `number` | `3` | no |
| <a name="input_termination_grace_period_seconds"></a> [termination\_grace\_period\_seconds](#input\_termination\_grace\_period\_seconds) | Time period for the controller pod to do a graceful shutdown | `number` | `10` | no |
| <a name="input_tolerations"></a> [tolerations](#input\_tolerations) | Pod Tolerations | `list(any)` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID for the Kubernetes cluster. Set this manually when your pods are unable to use the metadata service to determine this automatically | `string` | `""` | no |
| <a name="input_watch_namespace"></a> [watch\_namespace](#input\_watch\_namespace) | Watch a single namespace if specified, or all namespaces if not | `string` | `""` | no |
| <a name="input_webhook_bind_port"></a> [webhook\_bind\_port](#input\_webhook\_bind\_port) | The TCP port the Webhook server binds to. (default 9443) | `number` | `9443` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | Name of IAM role |
| <a name="output_iam_role_path"></a> [iam\_role\_path](#output\_iam\_role\_path) | Path of IAM role |
| <a name="output_iam_role_unique_id"></a> [iam\_role\_unique\_id](#output\_iam\_role\_unique\_id) | Unique ID of IAM role |
<!-- END_TF_DOCS -->
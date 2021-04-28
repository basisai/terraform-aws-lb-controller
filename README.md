# AWS LoadBalancer Controller for Kubernetes

This module deploys
[AWS LoadBalancer Controller](https://kubernetes-sigs.github.io/aws-load-balancer-controller)
to a Kubernetes Cluster.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| aws | >= 3.28 |
| helm | >= 2 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.28 |
| helm | >= 2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| affinity | Pod affinity | `map(any)` | `{}` | no |
| aws\_max\_retries | Maximum retries for AWS APIs (default 10) | `number` | `10` | no |
| chart\_name | Helm chart name to provision | `string` | `"aws-load-balancer-controller"` | no |
| chart\_namespace | Namespace to install the chart into | `string` | `"kube-system"` | no |
| chart\_repository | Helm repository for the chart | `string` | `"https://aws.github.io/eks-charts"` | no |
| chart\_timeout | Timeout to wait for the Chart to be deployed. | `number` | `300` | no |
| chart\_version | Version of Chart to install. Set to empty to install the latest version | `string` | `"1.1.6"` | no |
| cluster\_name | Name of Kubernetes Cluster | `string` | n/a | yes |
| cluster\_oidc\_issuer\_url | OIDC provider URL for EKS cluster | `string` | n/a | yes |
| default\_tags | Default tags to apply to all AWS resources managed by this controller | `map(string)` | `{}` | no |
| enable\_cert\_manager | Enable cert-manager injection of webhook certficates | `bool` | `false` | no |
| enable\_pod\_readiness\_gate\_inject | If enabled, targetHealth readiness gate will get injected to the pod spec for the matching endpoint pods (default true) | `bool` | `true` | no |
| enable\_shield | Enable Shield addon for ALB (default true) | `bool` | `true` | no |
| enable\_waf | Enable WAF addon for ALB (default true) | `bool` | `true` | no |
| enable\_wafv2 | Enable WAF V2 addon for ALB (default true) | `bool` | `true` | no |
| env | Fixed environment variables for container | `map(string)` | `{}` | no |
| extra\_volume\_mounts | Extra Volume mounts | `list(any)` | `[]` | no |
| extra\_volumes | Extra volumes | `list(any)` | `[]` | no |
| fullname\_override | Full name override for resources | `string` | `""` | no |
| host\_network | Use Host Network for pod | `bool` | `false` | no |
| iam\_role\_description | Description for IAM role for controller | `string` | `"Used by AWS Load Balancer Controller for EKS"` | no |
| iam\_role\_name | Name of IAM role for controller | `string` | `"aws-load-balancer-controller"` | no |
| iam\_role\_path | IAM Role path for controller | `string` | `""` | no |
| iam\_role\_permission\_boundary | Permission boundary ARN for IAM Role for controller | `string` | `""` | no |
| iam\_role\_tags | Tags for IAM Role for controller | `map(string)` | `{}` | no |
| image\_repository | Image repository | `string` | `"amazon/aws-alb-ingress-controller"` | no |
| image\_tag | Image tag | `string` | `"v2.1.3"` | no |
| ingress\_class | The ingress class this controller will satisfy. If not specified, controller will match all ingresses without ingress class annotation and ingresses of type alb | `string` | `"alb"` | no |
| ingress\_max\_concurrent\_reconciles | Maximum number of concurrently running reconcile loops for ingress (default 3) | `number` | `3` | no |
| log\_level | Log level. Either `info` or `debug` | `string` | `"info"` | no |
| max\_history | Max History for Helm | `number` | `20` | no |
| metrics\_bind\_addr | The address the metric endpoint binds to. (default ':8080') | `string` | `":8080"` | no |
| name\_override | Name override for resources | `string` | `""` | no |
| pdb | PDB for pod | `map(any)` | `{}` | no |
| pod\_annotations | Additional annotations on a pod | `map(string)` | `{}` | no |
| pod\_labels | Additional labels on a pod | `map(string)` | `{}` | no |
| pod\_security\_context | Pod Security Context | `map(any)` | <pre>{<br>  "fsGroup": 65534<br>}</pre> | no |
| priority\_class\_name | Priority class for pod | `string` | `"system-cluster-critical"` | no |
| region | The AWS region for the kubernetes cluster. Set to use KIAM or kube2iam for example. | `string` | `""` | no |
| release\_name | Helm release name | `string` | `"aws-load-balancer-controller"` | no |
| replicas | Number of replicas | `number` | `1` | no |
| resources | Pod Resources | `map(any)` | <pre>{<br>  "limits": {<br>    "cpu": "200m",<br>    "memory": "500Mi"<br>  },<br>  "requests": {<br>    "cpu": "100m",<br>    "memory": "500Mi"<br>  }<br>}</pre> | no |
| security\_context | Security Context for container | `map(any)` | <pre>{<br>  "allowPrivilegeEscalation": false,<br>  "readOnlyRootFilesystem": true,<br>  "runAsNonRoot": true<br>}</pre> | no |
| service\_account\_annotations | Addiitional Annotations for service account | `map(string)` | `{}` | no |
| service\_account\_name | Name of service account to create. Not generated | `string` | `"aws-load-balancer-controller"` | no |
| service\_max\_concurrent\_reconciles | Maximum number of concurrently running reconcile loops for service (default 3) | `number` | `3` | no |
| sync\_period | Period at which the controller forces the repopulation of its local object stores. (default 1h0m0s) | `string` | `"1h0m0s"` | no |
| targetgroupbinding\_max\_concurrent\_reconciles | Maximum number of concurrently running reconcile loops for targetGroupBinding | `number` | `3` | no |
| termination\_grace\_period\_seconds | Time period for the controller pod to do a graceful shutdown | `number` | `10` | no |
| tolerations | Pod Tolerations | `list(any)` | `[]` | no |
| vpc\_id | The VPC ID for the Kubernetes cluster. Set this manually when your pods are unable to use the metadata service to determine this automatically | `string` | `""` | no |
| watch\_namespace | Watch a single namespace if specified, or all namespaces if not | `string` | `""` | no |
| webhook\_bind\_port | The TCP port the Webhook server binds to. (default 9443) | `number` | `9443` | no |

## Outputs

| Name | Description |
|------|-------------|
| iam\_role\_arn | ARN of IAM role |
| iam\_role\_name | Name of IAM role |
| iam\_role\_path | Path of IAM role |
| iam\_role\_unique\_id | Unique ID of IAM role |

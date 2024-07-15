# canso-helm-charts
Helm charts to use the Canso Feature and ML Platform

## Chart Releases

[canso-aws-eks-superchart](https://github.com/Yugen-ai/canso-helm-charts/tree/main/canso-data-plane/canso-aws-eks-superchart)


| Release Version | Release Date | Release Summary                                                          |
|-----------------|--------------|--------------------------------------------------------------------------|
| `0.1.2`         | 2023-10-12   | Support IRSA roles in `canso-agent` and `spark-operator` service account |
| `0.1.1`         | -            | First release of the Canso Helm Chart for AWS EKS                        |


## Support

Please reach out to the Canso Team to get the values of the following -
- `config.control_plane_role_arn`
- `tenantName`
- `tenantID` 
- `deployment_sqs_url` 
- `notification_sqs_url`
- `sqs_region`
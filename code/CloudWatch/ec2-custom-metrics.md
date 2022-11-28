## PutMetricData CLI Command

aws cloudwatch put-metric-data --metric-name bytes --namespace MyCustomNameSpace --unit Bytes --value 242678092 --dimensions InstanceId=	i-091c3d83c0f313f13,InstanceType=t2.micro --region us-east-1

aws cloudwatch put-metric-data --metric-name latency --namespace MyCustomNameSpace --unit Milliseconds --value 24 --dimensions InstanceId=	i-091c3d83c0f313f13,InstanceType=t2.micro --region us-east-1


## Trigger CloudWatch Alarm

aws cloudwatch put-metric-data --metric-name latency --namespace MyCustomNameSpace --unit Milliseconds --value 35 --dimensions InstanceId=	i-091c3d83c0f313f13,InstanceType=t2.micro --region us-east-1


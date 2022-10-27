resource "aws_cloudwatch_log_group" "my-subnet-logs" {
  name              = "my-subnet-logs"
  retention_in_days = 5

  tags = {
    Environment = "Playground"
    Application = "testing"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log
resource "aws_flow_log" "example" {
  iam_role_arn    = aws_iam_role.flow-logs-cloudwatch-role.arn
  log_destination = aws_cloudwatch_log_group.my-subnet-logs.arn
  traffic_type    = "ALL"
  eni_id          = data.aws_instance.instance-data.network_interface_id
}

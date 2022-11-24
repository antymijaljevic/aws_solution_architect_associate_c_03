# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair

resource "aws_key_pair" "playground_key" {
  key_name   = "playground-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWBNwOnPrdbOW+qv/dsy1ughhUPB4XFYJKFcKAf4mft3nV8F68UQCdJ5mHS5Ana7as0N8dKR91i7Nj5Pv3+3K5htwVlr9h6KeVYxBoS8JLvTqg3FbQ+1oWE/Xj1Bk8LQLo5OSCa/9ToDwnEpBqJcCnY2Lblg7i2Sj6xf7N1QHX+RFWzitnfTjIyEmN1ruqvovPeAcOw43aVJEXVkKQtABDJabiDFbAfEgjjQt6SIFZxyM/7RH8wp0bNOWfLtUxgqUT+S3n5YL5zk3jIxQ/bXm4C7zeMZz0qMNJUf5bUjLzdMrhn8QhprV2LdkwS4nhUw4oejJf4OTlliUX5UfatCT5"
}
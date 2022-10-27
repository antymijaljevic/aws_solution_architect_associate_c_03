# Launch instance in Public 1A
aws ec2 run-instances --image-id <value> --instance-type <value> --security-group-ids <value> --subnet-id <value> --key-name <value> --user-data <value>


# Launch instance in Public 1B


# Launch instance in Private 1B


# Terminate instances

aws ec2 terminate-instances --instance-ids <value> <value>


# default
aws ec2 run-instances --image-id ami-09d3b3274b6c5d4aa --instance-type t2.micro --security-group-ids sg-0915374ea15eee577 --subnet-id subnet-0db86876bff311ecb --user-data file://user-data-subnet-id.txt

# playground
aws ec2 run-instances --image-id ami-09d3b3274b6c5d4aa --instance-type t2.micro --security-group-ids sg-0dac9d8ff487e002c --subnet-id subnet-0e933e96b4c0bfa94 --user-data file://user-data-subnet-id.txt


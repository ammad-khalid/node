region     = "us-east-2"
environment= "dev"
vpc_cidr= "10.70.0.0/16"
availability_zones= ["us-east-2a", "us-east-2b"]
private_subnets= ["10.70.1.0/24", "10.70.3.0/24"]
public_subnets= ["10.70.2.0/24", "10.70.4.0/24"]
bastion_ami= "ami-0cb91c7de36eed2cb"
account="app"
account_id="779160054397"
instance_type_bastion= "t3.micro"
instance_type= ["t3.small"]
key_name= "app-ssh-key"
eks_version= "1.31"
desired_size=1
max_size= 3
min_size= 1
disk_size= 20
rds_mysql_master_password= "BQubCZSXzyxg6aAYj3Kmek"

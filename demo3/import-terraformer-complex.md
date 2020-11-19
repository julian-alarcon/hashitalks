terraform init

terraformer import aws --resources=vpc,subnet,igw,route_table --regions=us-east-1

cd generated/aws/

terraform init

terraform plan

Replace Subnet ID with hashitalks_demo_subnet_public

-- Add additional info

terraform plan

terraform apply

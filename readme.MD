![Alt text](3-tier-vpc-sg-bastion-ansible.svg)


* 10-vpc: Terraform script creates multiple resources includes VPC ,Internet Gateway, Subnets in multiple available zones, route tables.

* Creates routes and associate routes to corresponding subnets.

* Peering connection with default VPC

* 20-sg: it uses terraform_aws_security_group module to create security groups required for each resource as shown above.

* Communication between the frontend, backend and database will occur with the help of security groups' ingress rules argument source_security_group_id instead of CIDR blocks

* By specifying the backend security group ID in the database security group’s ingress rule, only servers in the backend group can access the database, ensuring that no other external IPs or unrelated services can interact with your database.

* Using a CIDR block opens the service to a broader range of IP addresses, including potential external addresses if misconfigured. Security group IDs provide a more focused and controlled access scope.

* 30-bastion: in the above repo, for bastion host, several ingress rules are configured to access all three layers instances on ssh 22 port.

* 40-apps: in this repo, all the ec2 resources are created and provisioned frontend service, backend app, database mysql using anisble server.
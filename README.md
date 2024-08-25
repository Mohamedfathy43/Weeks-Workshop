# Weeks-Workshop
Week Two Workshop
At the end of the week, submit the following workshop.
use IaC Terrafrom to build the following resource besides requirement specifications:
In the following task will walk thrugh the S3 creation from the AWS console and trying to build each option that appears on the console using Terrafrom

Create a diagram of this deployment.

Use S3 to store Terraform statefile using "erakiterrafromstatefiles" bucket

Consider to use difrrent name that others (i.e. specify a unique name for state file key)
Create a general pupose Bucket.

Configure the object ownership as "Bucket owner enforced".

Block all public access.

Enable bukcet versioning.

specify tags that include in the Requirement Specifications below.

Configure objects encryption as "SSE-S3".



Week Three Workshop
At the end of the week, submit the following workshop.
use IaC Terrafrom to build the following resource besides requirement specifications:
In the following task will walk through the S3 creation, create IAM users and roles, configure S3 Policy, and test accessibility using AWS CLI s3 and s3api using IAM user credentials and IAM Role credentials using Terrafrom

Create a diagram of this deployment.

Use S3 to store Terraform statefile using "erakiterrafromstatefiles" bucket

Consider to use difrrent name that others (i.e. specify a unique name for state file key)
Create a Directory under created S3 called "logs".

Create two IAM Users (Mostafa, Taha).

Create IAM Role for Taha have s3:GetObject policy from logs directory only.

Set an S3 Policy allow Mostafa to put objects (i.e. s3:PutObject) at the entire S3.

Check accessability using AWS CLI:

Utilizing AWS CLI s3 commands.
Utilizing AWS CLI s3api commands.
After all Create a fork from this repository, Then append your code at the code samples section below and request to accept.
Enable Bucket key.

Disable object lock.



Week Four Workshop
At the end of the week, submit the following workshop.
use IaC Terraform to build the following resource besides requirement specifications:
In the following task will walk through the s3 creation, ec2 creation, create IAM Role holds s3 full access permission and attach it to the ec2, Then test accessibility by sending file to s3 from the ec2 machine using AWS CLI s3 and s3api using Terrafrom

Create a diagram of this deployment.

Use S3 to store Terraform statefile using "erakiterrafromstatefiles" bucket

Consider to use different name that others (i.e. specify a unique name for state file key)
Create a general purpose Bucket.

Create a Directory under created S3 called "logs".

Create IAM Role for The ec2 machine have s3 full access aws managed policy.

Create an ec2 machine holds the above role.

Check accessability using AWS CLI, by sending a file to s3 bucket from The EC2 machine.

After all Create a fork from this repository, Then append your code at the code samples section below and request to accept.




Week Five Workshop
At the end of the week, submit the following workshop.
use IaC Terraform to build the following resource besides requirement specifications:
In the following task will walk through the RDS creation, Then test accessibility by pgadmin program.

Create a diagram of this deployment.

Use S3 to store Terraform statefile using "erakiterrafromstatefiles" bucket

Consider to use different name that others (i.e. specify a unique name for state file key)
Create a VPC called vpc-01

Create Subnets called subnet-01, subnet-02.

Create a Security Group called sg-01

Allows inbound 5432 port form all.
Allows outbound role for all.
Create a subnet group of RDS Holds the created subnets.

Create a RDS instance of PostgreSQL latest version.

define allocate storage as 20
engine as postgres
engine_version as LATEST
instance_calss as db.t3.micro
name as postgresqldatabase
username as postgres
password as CHOOSE ONE
db_security_group_ids as created
vpc_security_group_ids as created
skip_final_snapshot as true
DON'T FORGET THE TAGS
after deployed, Check connection using pgadmin program from you local device; this requires the RDS to be publicly accessable.
-----------------------
At the end of the week, submit the following workshop.
use IaC Terraform to build the following resource besides requirement specifications:
In the following task will walk through the RDS creation, Then test accessibility by a bastion server.

Create a diagram of this deployment.

Use S3 to store Terraform statefile using "erakiterrafromstatefiles" bucket

Consider to use different name that others (i.e. specify a unique name for state file key)
Deploy a Higly-available RDS in multiple Avalibility zones i.e. multi-az instance

The RDS structure should be as primary and standby with out read replica.

Both of RDS using the same security group.

Allows inbound 5432 port form all.
Allows outbound role for all.
The RDS should NOT be publicly accessable.

Create a bastion host at the same VPC and connect to The RDS using psql commands.













Configure lifecycle expiration object at 7 days.


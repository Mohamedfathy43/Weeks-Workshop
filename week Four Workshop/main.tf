#deploy S3 bucket 
resource "aws_s3_bucket" "general_week4" {
  bucket = "myweek4-devops-kitchen"
}

# Create object 
resource "aws_s3_object" "s3_directory_logs" {
  bucket = aws_s3_bucket.general_week4.bucket
  key    = "logs/"
}
# Create EC2 Instance
resource "aws_instance" "my_instance" {
  ami                         = "ami-06c68f701d8090592"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet-public.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  tags = {
    Name = "myec2-01"
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  role = aws_iam_role.ec2_s3_full_access_role.name
}

#Create an IAM Role for EC2 with S3 Full Access
resource "aws_iam_role" "ec2_s3_full_access_role" {
  name               = "EC2S3FullAccessRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "Service": "ec2.amazonaws.com" },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_s3_full_access_policy" {
  role       = aws_iam_role.ec2_s3_full_access_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}


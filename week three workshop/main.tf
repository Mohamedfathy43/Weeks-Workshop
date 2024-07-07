resource "aws_s3_bucket" "s3_bucket_1" {
bucket = "mostaf-dev-2024"
}

# Create directory
resource "aws_s3_object" "s3_directory_logs" {
  bucket = aws_s3_bucket.s3_bucket_1.bucket
  key    = "logs/"
}
# Create user
resource "aws_iam_user" "mostafa" {
  name = "mostafa"
  }

# Create user
  resource "aws_iam_user" "taha" {
  name = "taha"
  }

# Create policy
  resource "aws_iam_policy" "policy_mostafa" {
  name        = "policy-mostafa"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action   = "s3:PutObject",
      Effect   = "Allow",
      Resource = "arn:aws:s3:::${aws_s3_bucket.s3_bucket_1.id}/*"
    }]
  })
}

# Attach policy to the mostafa
resource "aws_iam_user_policy_attachment" "mostafa_policy_attachment" {
  user       = aws_iam_user.mostafa.id
  policy_arn = aws_iam_policy.policy_mostafa.arn
}


# Create IAM Role 
resource "aws_iam_role" "taha_role" {
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
         "Service": "s3.amazonaws.com" 
      },
      Action    = "sts:AssumeRole"
    }]
  }) 
}
# Create policy for Taha
resource "aws_iam_policy" "taha_s3_policy" {
  name = "TahaS3GetObjectPolicy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
        ],
        Resource = "arn:aws:s3:::${aws_s3_bucket.s3_1.bucket}/logs/*"
      },
    ]
  })
}
# Attach policy to the role
resource "aws_iam_role_policy_attachment" "taha_s3_policy_attachment" {
  role       = aws_iam_role.taha_role.name
  policy_arn = aws_iam_policy.taha_s3_policy.arn
}
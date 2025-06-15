resource "aws_iam_role" "ec2_readonly" {
  name = "ec2_readonly_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "readonly_policy" {
  name        = "readonly_policy"
  description = "Read-only access policy for EC2"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action   = ["ec2:Describe*"],
      Effect   = "Allow",
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_readonly_policy" {
  role       = aws_iam_role.ec2_readonly.name
  policy_arn = aws_iam_policy.readonly_policy.arn
}
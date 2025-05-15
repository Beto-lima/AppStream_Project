resource "aws_iam_role" "appstream_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "appstream.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_appstream_policy" {
  role       = aws_iam_role.appstream_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAppStreamFullAccess"
}

resource "aws_iam_policy" "appstream_autoscaling_policy" {
  name        = "${var.env}-appstream-autoscaling"
  description = "Allows resources to scale the AppStream fleet via API"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "appstream:UpdateFleet",
          "appstream:DescribeFleets"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "autoscaling_attach" {
  role       = aws_iam_role.appstream_role.name
  policy_arn = aws_iam_policy.appstream_autoscaling_policy.arn
}

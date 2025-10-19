resource "aws_iam_instance_profile" "instance_profile" {
    name = "vinay_instance"
    role = aws_iam_role.iam-role.name 
}


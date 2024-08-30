resource "aws_iam_role" "lambda-role" {
  name = "lambda-role"

  assume_role_policy = "${file("iam/lambda-assume-role-policy.json")}"

  tags = {
    Name = "lambda-role"
  }
}

resource "aws_iam_role_policy" "lambda-policy" {
  name = "lambda-policy"
  role = aws_iam_role.lambda-role.id 

  policy = "${file("iam/lambda-policy.json")}"

}
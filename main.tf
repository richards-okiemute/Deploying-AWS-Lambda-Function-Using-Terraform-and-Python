locals {
  
  lambda_zip_location = "outputs/circle_terraform.zip"
}

data "archive_file" "circle_terraform" {
  type        = "zip"
  source_file = "circle_terraform.py"
  output_path = "${local.lambda_zip_location}"
}

resource "aws_lambda_function" "circle_terraform" {
  filename      = "${local.lambda_zip_location}"
  function_name = "circle_calculation"
  role          = aws_iam_role.lambda-role.arn
  handler       = "circle_terraform.circle_calculation"

  source_code_hash = data.archive_file.circle_terraform.output_base64sha256

  runtime = "python3.8"

}
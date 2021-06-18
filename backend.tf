terraform {
  backend "s3" {
    bucket = "shegoj-tutorial-1"
    key    = "training/june2021/day3-statefile"
    region = "eu-west-1"
  }
}
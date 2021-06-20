output "instance-public-ip" {
  value = aws_instance.web_server.public_dns
}
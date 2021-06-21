output "instance-public-ip" {
  value = aws_instance.web_server.*.public_ip
}


output "instance-public-dns" {
  value = aws_instance.web_server.*.public_dns
}
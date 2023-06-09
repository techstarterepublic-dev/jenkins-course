output "jenkins-ip" {
  value = [aws_instance.jenkins-instance.public_ip]
}

output "website_url" {
  value = "https://${local.record_name}/"
}

output "web-instance" {
  value = [aws_instance.web-instance.public_ip]
}

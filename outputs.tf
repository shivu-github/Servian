output "instance_ips" {
  value = ["${aws_instance.servian-ec35.*.public_ip}"]
}

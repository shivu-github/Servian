output "instance_ips" {
  value = ["${aws_instance.servian-ec2.*.public_ip}"]
}

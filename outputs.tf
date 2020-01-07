output "instance_ips" {
  value = ["${aws_instance.servian-ec2-new.*.public_ip}"]
}

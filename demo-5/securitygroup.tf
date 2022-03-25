data "aws_ip_ranges" "southeast_ec2" {
  regions  = ["ap-southeast-1"]
  services = ["ec2"]
}

resource "aws_security_group" "ap_southeast-1" {
  name        = "ap_southeast-1"
  description = "ap-southeast-1 IP addressses range"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = slice(data.aws_ip_ranges.southeast_ec2.cidr_blocks, 0, 40)
  }
  tags = {
    CreateDate = data.aws_ip_ranges.southeast_ec2.create_date
    SyncToken  = data.aws_ip_ranges.southeast_ec2.sync_token
  }
}


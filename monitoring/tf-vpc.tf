# Virtual Private Cloud Module
module "vpc" {
  source                  = "git::https://github.com/bootcampus-elitesolutionsit/terraform-vpc-module.git?ref=v2.0.0"
  name                    = "jenkins"
  security_group_name     = "jenkins-sg"
  description             = "Monitoring Jenkins Server infrastructure with AWS CloudWatch."
  cidr_block              = "10.0.0.0/16"
  enable_dns_support      = true
  instance_tenancy        = "default"
  public_subnets          = ["10.0.0.0/20"]
  private_subnets         = ["10.0.64.0/20"]
  map_public_ip_on_launch = true
  azs                     = ["us-east-1a"]
  security_group_ingress = [{

    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "Jenkins Port"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  security_group_egress = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }]
}
#!/bin/sh
sudo yum update -y
sudo amazon-linux-extras install docker
sudo yum install docker git
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ssm-user
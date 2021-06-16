#! /bin/bash

yum update -y

wget -O /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

yum upgrade -y

yum install jenkins java-1.8.0-openjdk-devel -y

systemctl daemon-reload
  
systemctl start jenkins
  


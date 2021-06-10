#! /bin/bash
yum update -y
wget https://dl.fedoraproject.org/pub/epel/epel-release-yum update -y
yum install epel-release-latest-7.noarch.rpm -y
yum install git python python-devel python-pip openssl ansible -y
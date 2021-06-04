## Devops-public

### Terraform installation on MAC

 brew tap hashicorp/tap

 brew install hashicorp/tap/terraform
 
 
## Ubuntu/Debian

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

## CentOS

sudo yum install -y yum-utils && sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

## Amazon Linux

sudo yum install -y yum-utils && sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform


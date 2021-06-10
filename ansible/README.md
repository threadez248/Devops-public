## Devops-public

### Ansible installation on MAC

See if PIP installed
>>  which pip  && pip –version
If pip isn’t on your system and you’re using the default Python version on your system, you can usually install pip by running sudo easy_install pip.
>>  pip install --upgrade pip to update pip 
>> pip install ansible
If ansible --version runs successfully, congratulations! You now have Ansible’s automation at your fingertips and you’re ready to start managing your servers.

 
 
## Ubuntu/Debian, CentOS && RHEL

### Ubuntu 18.04 / Ubuntu 16.04 ### 
sudo apt update 
sudo apt install software-properties-common 
sudo apt-add-repository --yes --update ppa:ansible/ansible 
sudo apt install ansible

Install Ansible.
### CentOS 7 / RHEL 7 : yum install -y ansible 
### Ubuntu 18.04 / 16.04 & Debian 9: sudo apt-get install -y ansible 

Once Ansible is installed, verify the version of Ansible by executing below command.
ansible –version
Output:
ansible 2.6.3 config file = /etc/ansible/ansible.cfg
configured module search path = [u'/root/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules’]
ansible python module location = /usr/lib/python2.7/site-packages/ansible executable location = /usr/bin/ansible python version = 2.7.5

To enable the Ansible Engine repository for RHEL 8, run the following command:
	sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms 
To enable the Ansible Engine repository for RHEL 7, run the following command:
	sudo subscription-manager repos --enable rhel-7-server-ansible-2.9-rpms

## Amazon Linux

amazon-linux-extras install epel
yum update -y
yum install ansible -y
ansible --version

Testing Installation:

### ansible --version

##NOTE: Not coveredd for Windows since we usually not recomment Ansible to those machines


USAGE:

Run Terraform Script to create instances and install Ansible following above Steps

Establish Password less authentication 
        ssh-keygen -t rsa
        copy created public file to remote server on which Ansible tasks need to run into ~/.ssh/authorized_keys
        Once done: Test with: ssh <private_ip> and should be logged in.
        Private IP since AWS internal instances will use Private IPs to communicate.

Ansible run Steps:

Step 1: cd /etc/ansible ---Default Location
Step 2: There will be hosts file. Place internal Private IP of remote host into it.
Step 3: Replace ansible.cfg if you want to. Its optional, we created simple config file for reference
Step 4: ansible all -m ping -v ( This lets you know if hosts are connected correctly)
Step 5: ansible-playbook -i hosts httpd.yml ( Please get httpd.yml sample playbook file from repo)



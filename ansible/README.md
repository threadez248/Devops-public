

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
**ansible 2.6.3 config file = /etc/ansible/ansible.cfg**

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

##NOTE: Not covered for Windows since we usually not recomment Ansible to those machines

<img width="1036" alt="Screen Shot 2021-06-10 at 5 56 03 PM" src="https://user-images.githubusercontent.com/81865907/121604295-3e689800-ca18-11eb-9a11-e9fcfd5b5f47.png">


USAGE:

Run Terraform Script in this repository to create instances and install Ansible following above Steps

Establish Password less authentication 

        ssh-keygen -t rsa
	
        copy created public file to remote server on which Ansible tasks need to run into ~/.ssh/authorized_keys
	
        Once done: Test with: ssh <private_ip> and should be logged in.
	
        Private IP since AWS internal instances will use Private IPs to communicate.

##Ansible run Steps:

##Step 1: cd /etc/ansible ---Default Location


##Step 2: There will be hosts file located at /etc/ansible. Place internal Private IP of remote host into it.


##Step 3: Replace ansible.cfg if you want to. Its optional, we created simple config file for reference


##Step 4: ansible all -m ping -v ( This lets you know if hosts are connected correctly)


<img width="1088" alt="Screen Shot 2021-06-10 at 5 57 47 PM" src="https://user-images.githubusercontent.com/81865907/121604299-3f012e80-ca18-11eb-93d9-9eb049973810.png">


##Step 5: ansible-playbook -i hosts httpd.yml ( Please get httpd.yml sample playbook file from repo)


<img width="777" alt="Screen Shot 2021-06-10 at 5 56 19 PM" src="https://user-images.githubusercontent.com/81865907/121604298-3f012e80-ca18-11eb-951d-735304b5f056.png">
<img width="1131" alt="Screen Shot 2021-06-10 at 5 58 18 PM" src="https://user-images.githubusercontent.com/81865907/121604300-3f99c500-ca18-11eb-9ec3-780e0e7e3998.png">



NOTE:  
Instances now created will be loaded with Ansible by default when you use Terraform script in this repo. 

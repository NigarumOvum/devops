# Ansible LAMP stack

## Pre-install
- set `ansible_ssh_pass` in `hosts.ini` if you don't have ssh keys authentication setup

## Installation
- install ansible
- edit `hosts.ini`
- run `./run_playbooks`

## Post-install
- run `sudo service apache2 stop`
- run `sudo certbot certonly` and configure https in `/etc/apache2/sites-available/vhosts.conf`
- run `sudo service apache2 start`
- run `sudo mysql_secure_installation` and set a new root password
- run `sudo mysql -uroot -p` and run `update mysql.user set plugin = 'mysql_native_password' where User='root';` and `FLUSH PRIVILEGES;` so any user can log into mysql

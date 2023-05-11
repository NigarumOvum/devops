#!/bin/bash

# Some core settings of Nginx and MariaDB that are often underestimated are configured properly
# This configuration was tested in heavy loaded environment (>500k requests to a webserver a day) more then six months straight
# Don't struggle anymore with adding new server blocks to Nginx when you add new websites to your server
wget https://raw.githubusercontent.com/sutlxwhx/Highload-LEMP-Installation/master/install.sh && bash install.sh

# LEMP will be configured in such a way that it will try to find a folder which is identical to a website name in your /var/www/ directory.
# For example if you created an A-record in your DNS panel where you pointed '@' name of 'test.com' domain to '1.2.3.4' IP adress of your server and you try to access 'test.com' LEMP will try to serve index.php or index.html from the /var/www/test.com directory as an initial response.

# MariaDB password is generated using md5 hash of your server hostname and will be put in your /etc/mysql/my.cnf after [client] directive.

# Example Files
# These files will be created in order to help you understand how this installation works:

# "Hello World" website in /var/www/test.com
# phpinfo(); file at /var/www/test.com/info.php
# opcache.php at /var/www/test.com/opcache.php

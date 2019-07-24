#!/bin/sh
yum -y install httpd php \n
chkconfig httpd on \n
/etc/init.d/httpd start \n
aws s3 cp s3://csa03-studentX/index.php /var/www/html 
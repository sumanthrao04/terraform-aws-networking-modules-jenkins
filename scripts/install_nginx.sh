#!/bin/bash
yum update -y
amazon-linux-extras install nginx1 -y || yum install nginx -y
systemctl enable nginx
systemctl start nginx
echo "<h1>terraform-aws-networking-modules-Jenkins</h1>" > /usr/share/nginx/html/index.html
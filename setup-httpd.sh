#Instalamos este repositior
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y epel-release
 
#Actualizamos el sistema
yum update -y
 
#Opcional: En lo personal instalo todos estas herramientas y 
#liberias porque siempre suelo utilizarlas
yum install -y wget nano lynx git iputils net-tools nmap mtr gcc gcc-c++ make autoconf glibc rcs pcre-devel openssl-devel expat-devel geoip-devel zlib-devel mlocate ncdu mytop composer npm
 
yum install yum-utils -y
 
#Instalamos Nginx, MariaDB y SSH
yum install -y httpd mariadb-server openssh-server nginx node
 
#Con esto instalaremos PHP 5.4, 5.5, 5.6, 7.0, 7.1, 7.2 y 7.3 
#ademas de todas las librerías necesarias mas PHP-FPM para
#cada versión de PHP anterior
yum install -y php54 php55 php56 php70 php71 php72 php73 \
php54-php-fpm php55-php-fpm php56-php-fpm php70-php-fpm php71-php-fpm php72-php-fpm php73-php-fpm \
php54-php-mysql php54-php-mcrypt php54-php-mbstring php54-php-cli php54-php-fpm php54-php-gd php54-php-json php54-php-ioncube-loader php54-php-intl php54-php-pdo php54-php-pgsql php54-php-soap php54-php-xml php54-php-xmlrpc \
php55-php-mysql php55-php-mcrypt php55-php-mbstring php55-php-cli php55-php-fpm php55-php-gd php55-php-json php55-php-ioncube-loader php55-php-intl php55-php-pdo php55-php-pgsql php55-php-soap php55-php-xml php55-php-xmlrpc \
php56-php-mysql php56-php-mcrypt php56-php-mbstring php56-php-cli php56-php-fpm php56-php-gd php56-php-json php56-php-ioncube-loader php56-php-intl php56-php-pdo php56-php-pgsql php56-php-soap php56-php-xml php56-php-xmlrpc \
php70-php-mysql php70-php-mcrypt php70-php-mbstring php70-php-cli php70-php-fpm php70-php-gd php70-php-json php70-php-ioncube-loader php70-php-intl php70-php-pdo php70-php-pgsql php70-php-soap php70-php-xml php70-php-xmlrpc \
php71-php-mysql php71-php-mcrypt php71-php-mbstring php71-php-cli php71-php-fpm php71-php-gd php71-php-json php71-php-ioncube-loader php71-php-intl php71-php-pdo php71-php-pgsql php71-php-soap php71-php-xml php71-php-xmlrpc \
php72-php-mysql php72-php-mcrypt php72-php-mbstring php72-php-cli php72-php-fpm php72-php-gd php72-php-json php72-php-ioncube-loader php72-php-intl php72-php-pdo php72-php-pgsql php72-php-soap php72-php-xml php72-php-xmlrpc \
php73-php-mysql php73-php-mcrypt php73-php-mbstring php73-php-cli php73-php-fpm php73-php-gd php73-php-json php73-php-ioncube-loader php73-php-intl php73-php-pdo php73-php-pgsql php73-php-soap php73-php-xml php73-php-xmlrpc \

yum -y install phpmyadmin
 
#Detenemos estos servicios
systemctl stop php54-php-fpm
systemctl stop php55-php-fpm
systemctl stop php56-php-fpm
systemctl stop php70-php-fpm
systemctl stop php71-php-fpm
systemctl stop php72-php-fpm
systemctl stop php73-php-fpm
 
#A cada version de PHP-FPM le asignamos un
#puerto diferente mediante los siguientes comandos
sed -i 's/:9000/:9054/' /opt/remi/php54/root/etc/php-fpm.d/www.conf
sed -i 's/:9000/:9055/' /opt/remi/php55/root/etc/php-fpm.d/www.conf
sed -i 's/:9000/:9056/' /etc/opt/remi/php56/php-fpm.d/www.conf
sed -i 's/:9000/:9070/' /etc/opt/remi/php70/php-fpm.d/www.conf
sed -i 's/:9000/:9071/' /etc/opt/remi/php71/php-fpm.d/www.conf
sed -i 's/:9000/:9072/' /etc/opt/remi/php72/php-fpm.d/www.conf
sed -i 's/:9000/:9073/' /etc/opt/remi/php73/php-fpm.d/www.conf
 
#Cambimos el usuario, nginx en lugar de apache
sed -i 's/user = apache/user = nginx/' /opt/remi/php54/root/etc/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/' /opt/remi/php54/root/etc/php-fpm.d/www.conf
sed -i 's/user = apache/user = nginx/' /opt/remi/php55/root/etc/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/' /opt/remi/php55/root/etc/php-fpm.d/www.conf
sed -i 's/user = apache/user = nginx/' /etc/opt/remi/php56/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/' /etc/opt/remi/php56/php-fpm.d/www.conf
sed -i 's/user = apache/user = nginx/' /etc/opt/remi/php70/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/' /etc/opt/remi/php70/php-fpm.d/www.conf
sed -i 's/user = apache/user = nginx/' /etc/opt/remi/php71/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/' /etc/opt/remi/php71/php-fpm.d/www.conf
sed -i 's/user = apache/user = nginx/' /etc/opt/remi/php72/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/' /etc/opt/remi/php72/php-fpm.d/www.conf
sed -i 's/user = apache/user = nginx/' /etc/opt/remi/php73/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/' /etc/opt/remi/php73/php-fpm.d/www.conf

#Cambiamos propietraios y grupos
chown nginx /opt/remi/php54/root/var/log/php-fpm
chown nginx /opt/remi/php55/root/var/log/php-fpm
chown nginx /opt/remi/php56/root/var/log/php-fpm
chown nginx /var/opt/remi/php70/log/php-fpm
chown nginx /var/opt/remi/php71/log/php-fpm
chown nginx /var/opt/remi/php72/log/php-fpm
chown nginx /var/opt/remi/php73/log/php-fpm

chgrp nginx -R /opt/remi/php54/root/var/lib/php/wsdlcache
chgrp nginx -R /opt/remi/php56/root/var/lib/php/wsdlcache
chgrp nginx -R /opt/remi/php55/root/var/lib/php/wsdlcache
chgrp nginx -R /var/opt/remi/php70/lib/php/wsdlcache
chgrp nginx -R /var/opt/remi/php70/lib/php/opcache
chgrp nginx -R /var/opt/remi/php72/lib/php/wsdlcache
chgrp nginx -R /var/opt/remi/php72/lib/php/opcache
chgrp nginx -R /var/opt/remi/php71/lib/php/wsdlcache
chgrp nginx -R /var/opt/remi/php71/lib/php/opcache
chgrp nginx -R /var/opt/remi/php73/lib/php/wsdlcache
chgrp nginx -R /var/opt/remi/php73/lib/php/opcache

chown nginx:nginx /opt/remi/php54/root/var/lib/php/session
chown nginx:nginx /opt/remi/php55/root/var/lib/php/session
chown nginx:nginx /var/opt/remi/php56/lib/php/session
chown nginx:nginx /var/opt/remi/php70/lib/php/session
chown nginx:nginx /var/opt/remi/php71/lib/php/session
chown nginx:nginx /var/opt/remi/php72/lib/php/session
chown nginx:nginx /var/opt/remi/php73/lib/php/session

 
#Iniciamos los servicios
systemctl start php56-php-fpm
systemctl start php55-php-fpm
systemctl start php56-php-fpm
systemctl start php70-php-fpm
systemctl start php71-php-fpm
systemctl start php72-php-fpm
systemctl start php73-php-fpm
 
 
 
#Los iniciamos
systemctl start nginx
#systemctl start mariadb
 
#Configuramos para que todos arranque
#desde el inicio de la ejecucion
#del contenedor
systemctl enable nginx
systemctl enable mariadb
systemctl enable php54-php-fpm
systemctl enable php55-php-fpm
systemctl enable php56-php-fpm
systemctl enable php70-php-fpm
systemctl enable php71-php-fpm
systemctl enable php72-php-fpm
systemctl enable php73-php-fpm

mkdir -p /etc/nginx/conf.d.example/

cat > /etc/nginx/conf.d.example/example.lan.conf << EOF
server {
 
        listen 80;
        listen [::]:80;
 
        server_name example.lan;
 
        root /var/www/example.lan;
        index index.php index.html index.htm index.nginx-debian.html;
 
        location / {
                try_files \$uri \$uri/ =404;
        }
 
        location ~ \.php$ {
            try_files \$uri =404;
 
            #PHP 5.4
            #fastcgi_pass 127.0.0.1:9054;
 
            #PHP 5.5
            #fastcgi_pass 127.0.0.1:9055;
 
            #PHP 5.6
            fastcgi_pass 127.0.0.1:9056;
 
            #PHP 7.0
            #fastcgi_pass 127.0.0.1:9070;
 
            #PHP 7.1
            #fastcgi_pass 127.0.0.1:9071;
 
            #PHP 7.2
            #fastcgi_pass 127.0.0.1:9072;
 
            #PHP 7.3
            #fastcgi_pass 127.0.0.1:9073;
 
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;
            include        fastcgi_params;
            fastcgi_buffer_size 128k;
            fastcgi_buffers 256 4k;
            fastcgi_busy_buffers_size 256k;
            fastcgi_temp_file_write_size 256k;
 
            #php.ini
            fastcgi_param PHP_VALUE "
                        memory_limit=512M;
                        upload_max_filesize=5M;
                        error_reporting=E_ALL;
            ";
        }
 
         location ~ /\.ht {
                 deny all;
        }
}
EOF


cat > /etc/nginx/conf.d.example/node.lan.conf << EOF
server {
        listen 80;
        listen [::]:80;

        server_name node.lan www.node.lan;


        location / {
                proxy_pass http://127.0.0.1:3000;
                include /etc/nginx/conf.d/proxy_params;
        }

		location ~* ^/images/.+.(jpg|jpeg|gif|png|ico|css)\$ {
 			root /var/www/node.lan/public;
 		}

		location ~* ^.+\.(css|js|html)\$ {
 			root /var/www/node.lan/public;
 		}
}
EOF

cat > /etc/nginx/conf.d.example/proxy_params << EOF
proxy_buffers 16 32k;
proxy_buffer_size 64k;
proxy_busy_buffers_size 128k;
proxy_cache_bypass \$http_pragma \$http_authorization;
proxy_connect_timeout 59s;
proxy_hide_header X-Powered-By;
proxy_http_version 1.1;
proxy_ignore_headers Cache-Control Expires;
proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504 http_404;
proxy_no_cache \$http_pragma \$http_authorization;
proxy_pass_header Set-Cookie;
proxy_read_timeout 600;
proxy_redirect off;
proxy_send_timeout 600;
proxy_temp_file_write_size 64k;
proxy_set_header Accept-Encoding '';
proxy_set_header Cookie \$http_cookie;
proxy_set_header Host \$host;
proxy_set_header Proxy '';
proxy_set_header Referer \$http_referer;
proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Host \$host;
proxy_set_header X-Forwarded-Server \$host;
proxy_set_header X-Real-IP \$remote_addr;
proxy_set_header X-Forwarded-Proto \$scheme;
proxy_set_header X-Original-Request \$request_uri;
EOF

#systemctl restart mariadb
systemctl restart php54-php-fpm
systemctl restart php55-php-fpm
systemctl restart php56-php-fpm
systemctl restart php70-php-fpm
systemctl restart php71-php-fpm
systemctl restart php72-php-fpm
systemctl restart php73-php-fpm

systemctl restart nginx 

cat > /usr/bin/setphp << EOF
#!/bin/bash

ln -sf /usr/bin/php\$1 /usr/bin/php

EOF

chmod +x /usr/bin/setphp

echo -en "\033[1;31m" >> /etc/issue
echo "Default" >> /etc/issue

echo "System" >> /etc/issue
echo "User: root" >> /etc/issue
echo "Password: docker" >> /etc/issue
echo "" >> /etc/issue
echo "MySQL: " >> /etc/issue
echo "User: root" >> /etc/issue
echo "Password: empty" >> /etc/issue
echo "" >> /etc/issue
echo "phpMyAdmin: " >> /etc/issue
echo "User: dbroot" >> /etc/issue
echo "Password: dbroot" >> /etc/issue
echo "" >> /etc/issue

echo "If MySQL fail on boot and /var/lib/mysql is empty, please execute mysql_repair" >> /etc/issue

echo "For more instruction: https://www.alvarodeleon.net/centos7-nginx-multiphp" >> /etc/issue

echo "" >> /etc/issue

echo -en "\033[0m" >> /etc/issue

cat > /bin/mysql_repair << EOF
mysql_install_db
find /var/lib/mysql/ -type d | xargs chmod -v 700
find /var/lib/mysql/ -type f | xargs chmod -v 660
chmod 777 /var/lib/mysql/
chown mysql:mysql -R /var/lib/mysql/
service mariadb restart

mysql  -u root -Bse "GRANT ALL PRIVILEGES ON *.* TO 'dbroot'@'localhost' IDENTIFIED BY 'dbroot';GRANT ALL PRIVILEGES ON *.* TO 'dbroot'@'127.0.0.1' IDENTIFIED BY 'dbroot';GRANT ALL PRIVILEGES ON *.* TO 'dbroot'@'%' IDENTIFIED BY 'dbroot';";

EOF

chmod +x /bin/mysql_repair


cat > /etc/nginx/conf.d.example/phpmyadmin << EOF
server {
 
        listen 80;
        listen [::]:80;
 
        server_name phpmyadmin;
 
        root /usr/share/phpMyAdmin/;
        index index.php index.html index.htm index.nginx-debian.html;
 
        location / {
                try_files \$uri \$uri/ =404;
        }
 
        location /phpmyadmin \.php\$ {
                alias /usr/share/phpMyAdmin/
   
            try_files \$uri =404;
 
             #PHP 7.0
            fastcgi_pass 127.0.0.1:9070;

             fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;
            include        fastcgi_params;
            fastcgi_buffer_size 128k;
            fastcgi_buffers 256 4k;
            fastcgi_busy_buffers_size 256k;
            fastcgi_temp_file_write_size 256k;
 
        }
 
         location ~ /\.ht {
                 deny all;
        }
}

EOF
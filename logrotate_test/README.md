apt update
apt install logrotate
apt install cron
/etc/init.d/cron status
/etc/init.d/cron start
apt install vim -y
vim --version

vi /etc/logrotate.d/httpd

cd /var/log/httpd
touch access1.log access2.log
logrotate -dv /etc/logrotate.d/httpd

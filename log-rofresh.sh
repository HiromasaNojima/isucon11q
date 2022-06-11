mv /var/log/nginx/access.log /var/log/nginx/access.log.`date +%Y%m%d-%H%M%S`
rm /var/log/mysql/mysql-slow.log
nginx -s reopen
mysqladmin flush-logs
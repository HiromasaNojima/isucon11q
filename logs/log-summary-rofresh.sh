pt-query-digest /var/log/mysql/mysql-slow.log | tee digest_$(date +%Y%m%d-%H%M%S).txt
cat /var/log/nginx/access.log | alp json -m '/api/condition/[0-9a-zA-Z\-]+,/api/isu/[0-9a-zA-Z\-]+/icon,/api/isu/[0-9a-zA-Z\-]+/graph,/api/condition/[0-9a-zA-Z\-]+,/api/isu/[0-9a-zA-Z\-]+,/isu/[0-9a-zA-Z\-]+/condition,/isu/[0-9a-zA-Z\-]+,/isu/[0-9a-zA-Z\-]+/graph' --sort=avg -r | tee alp_$(date +%Y%m%d-%H%M%S).txt
mv /var/log/nginx/access.log /var/log/nginx/access.log.`date +%Y%m%d-%H%M%S`
rm /var/log/mysql/mysql-slow.log
nginx -s reopen
mysqladmin flush-logs
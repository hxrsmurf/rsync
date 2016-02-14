#!/bin/bash
#Backup the databases of Seafile
thedate=$(date +%d%b%Y)
mysqldump -h localhost -u root -ppassword --opt ccnet-db > /seafile/seafile-data/backups/database/ccnet-db_$thedate.sql
mysqldump -h localhost -u root -ppassword --opt seafile-db > /seafile/seafile-data/backups/database/seafile-db_$thedate.sql
mysqldump -h localhost -u root -ppassword --opt seahub-db > /seafile/seafile-data/backups/database/seahub-db_$thedate.sql
mysqldump -h localhost -u root -ppassword --opt quotes > /seafile/seafile-data/backups/database/quotes_$thedate.sql

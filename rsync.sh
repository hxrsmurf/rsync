#!/bin/sh
thedate=$(date +%d%b%Y)
if df -h | grep -q '/mnt/seafile'; then
	clear
	echo "Beginning..."
	echo "Database Backup"

	mysqldump -h localhost -u root -ppassword --opt ccnet-db > /seafile/seafile-data/backups/database/ccnet-db_$thedate.sql
	mysqldump -h localhost -u root -ppassword --opt seafile-db > /seafile/seafile-data/backups/database/seafile-db_$thedate.sql
	mysqldump -h localhost -u root -ppassword --opt seahub-db > /seafile/seafile-data/backups/database/seahub-db_$thedate.sql
	echo "Database backup done"

	rsync -ahvz --progress --log-file=/root/rsync_seafile_logs/rsync_seafile_$thedate.log /seafile/seafile-data /mnt/seafile/seafile-data
	echo "I've completed database backup of Seafile as well as the data directory." | mail kevin@hxrsmurf.info -s "Rsync Synchronization Complete" -a "From: rsync@hxrsmurf.info"
else
	echo "Error rsync, check the mount" | mail kevin@hxrsmurf.info -s "Rsync Errore" -a "From: rsync@hxrsmurf.info"
	echo "Check the mount point."
fi

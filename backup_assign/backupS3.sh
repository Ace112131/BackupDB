DATE=`date +"%d_%b_%Y_%H%M"`
SQLFILE=/var/backups/db/db_backup_${DATE}.sql
DATABASE="demosite"
USER="root"
PASSWORD="ashu@123"
sudo mysqldump -u ${USER} -p${PASSWORD} ${DATABASE}|gzip > ${SQLFILE}.gz
sudo s3cmd -c /root/.s3cfg put ${SQLFILE}.gz s3://demo-buck112
sudo find /var/backups/db/. -mtime +7 -exec rm {} \;

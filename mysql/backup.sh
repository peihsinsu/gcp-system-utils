#!/bin/bash
echo "Start to backup DB ..."
 
export BK_DIR=$HOME/script/backup
export DB_ADDR=localhost
export USER_NAME=root
export PASSWD=
SOURCE_DIR[0]=mydb01
SOURCE_DIR[1]=mydb02
SOURCE_DIR[2]=mydb03

for name in ${SOURCE_DIR[*]}
do
  echo "Backing up..." $name
  /usr/bin/mysqldump --routines --add-drop-database --add-drop-table --hex-blob --opt --host=$DB_ADDR -u $USER_NAME --password=$PASSWD $name > $BK_DIR/$name-$(date +"%Y-%m-%d").sql
  /bin/gzip -f $BK_DIR/$name-$(date +"%Y-%m-%d").sql
  /usr/local/bin/gsutil cp $BK_DIR/$name-$(date +"%Y-%m-%d").sql.gz gs://my-db-backup-bucket/
done

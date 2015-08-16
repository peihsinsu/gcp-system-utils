#!/bin/bash
#說明：這個script會依照所列出的路徑做差異備份，
BUCKET=gs://your-backup-bucket
SOURCE_DIR[0]="/your/path1|$BUCKET/path1"
SOURCE_DIR[1]="/your/path2|$BUCKET/path2"
SOURCE_DIR[2]="/your/path3|$BUCKET/path3"

for name in ${SOURCE_DIR[*]}
do
  FROM=`echo $name | awk -F'|' '{print $1}'`
  TO=`echo $name | awk -F'|' '{print $2}'`
  echo "Backing up..." $FROM "to" $TO
  gsutil -m rsync -r -d $FROM $TO
done

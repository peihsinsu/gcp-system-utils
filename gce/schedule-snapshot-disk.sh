#!/bin/bash
 
# Environments
export PATH=/root/google-cloud-sdk/bin:$PATH
 
# Daily create snapshot for "backup_path" listed disks
# And remove snapshot 1 week old before
 
# Create snap date
export DT=`date +%Y%m%d`
 
# Delete snap date
export DT2=`date -d'-1 week' +%Y%m%d`
 
# ex: ( "disk1 asia-east1-b" "disk2 asia-east1-a" ...)
backup_path=( "disk-name disk-region" ) 
 
for txt in "${backup_path[@]}"
do
export name=`echo $txt | awk '{print $1}'`
export zone=`echo $txt | awk '{print $2}'`
gcloud compute disks snapshot $name --snapshot-name snap-$name-v$DT --zone $zone
gcloud compute snapshots delete snap-$name-v$DT2 -q
done

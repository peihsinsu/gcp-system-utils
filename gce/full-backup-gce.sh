#!/bin/bash
# 目的：給訂主機名稱，針對其下所有disk做snapshot

export PROJECT=mitac-cp300-taipei101
export INST=simon-debian6

export ZONE=`gcloud --project $PROJECT compute instances list | grep $INST | awk '{print $2}'`
export TS=`date +%Y%m%d`

for name in `gcloud --project $PROJECT compute instances describe $INST --zone $ZONE | grep deviceName | awk -F ": " '{print $2}'`
do

	gcloud compute --project $PROJECT disks snapshot $name --zone $ZONE --snapshot-names snap-$name-$TS

done

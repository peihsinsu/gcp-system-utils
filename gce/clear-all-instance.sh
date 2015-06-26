#!/bin/bash
export PROJECT=test-project-id
export ALL=`gcloud --project=$PROJECT compute instances list | grep -v ^NAME | awk '{print $1","$2}'`
 
for line in `echo $ALL`
do
  export name=`echo $line | awk -F',' '{print $1}'`
  export zone=`echo $line | awk -F',' '{print $2}'`
  gcloud --project=senao-gcp-course-713 compute instances delete $name --zone $zone --delete-disks all -q
done

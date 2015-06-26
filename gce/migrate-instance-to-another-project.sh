export INSTANCE=aaa-couchdb
export INSTANCE_DISK=aaa-couchdb
export INSTANCE_ZONE=asia-east1-b
 
export OLD_PROJECT=gce-micloud
export NEW_PROJECT=aaa-apple
export NEW_INSTANCE_NAME=aaa-couchdb
export NEW_INSTANCE_ZONE=asia-east1-c
 
gcloud --project=$OLD_PROJECT compute images create $INSTANCE --source-disk=$INSTANCE_DISK --source-disk-zone=$INSTANCE_ZONE
 
gcloud --project=$NEW_PROJECT compute instances create $NEW_INSTANCE_NAME \
 --image https://www.googleapis.com/compute/v1/projects/$OLD_PROJECT/global/images/$INSTANCE\
 --zone $NEW_INSTANCE_ZONE\
 --machine-type f1-micro

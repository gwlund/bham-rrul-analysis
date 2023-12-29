#!/bin/bash

#aws s3 ls s3://fful-lundpi-bucket/TAR --recursive | grep 'dreammachine.*\.tar\.gz'
#exit

#aws s3 cp s3://fful-lundpi-bucket/TAR/2023-12-27-08-00-01_lundpi_dreammachine-RRUL.tar.gz data/dreammachine

# Set your bucket name
BUCKET_NAME="fful-lundpi-bucket"
# Set your local directory where you want to download the files
LOCAL_DIRECTORY="data/dreammachine"

# List and download all .tar.gz files
aws s3 ls s3://$BUCKET_NAME/TAR --recursive | grep 'dreammachine.*\.tar\.gz' | while read -r line; do
    # Extract the file name
    FILENAME=`echo $line | awk '{print $4}'`
    #if [[ $FILENAME == *".tar.gz" ]]; then
    # Copy file from S3 to local directory
    aws s3 cp s3://$BUCKET_NAME/$FILENAME $LOCAL_DIRECTORY/$FILENAME
    #fi
done

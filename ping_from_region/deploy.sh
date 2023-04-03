#!/bin/bash

REGIONS=$( aws ec2 describe-regions \
    --all-regions \
    --query "Regions[].{Name:RegionName}" \
    --output text \
    --region cn-north-1)

for region in $REGIONS
do
    echo $region
    export AWS_DEFAULT_REGION=$region
    chalice deploy --stage prod
done

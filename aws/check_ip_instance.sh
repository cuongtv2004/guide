#!/bin/bash

# $1 Region

case $1 in
    front)
        instance_name_tag="front-stg";;
    batch)
        instance_name_tag="batch-stg";;
esac
aws ec2 describe-instances --region ap-northeast-1 --query 'Reservations[].Instances[].[PrivateIpAddress]' --filter Name=tag:Name,Values=$instance_name_tag Name=instance-state-name,Values=running --output text

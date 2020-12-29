#!/bin/bash
# capture region, then variablize

tablenames=$(aws dynamodb list-tables --region=us-east-1 | jq -r '.TableNames | .[]')
for i in $tablenames;
do
  aws dynamodb update-continuous-backups --region us-east-1 --table-name "$i" --point-in-time-recovery-specification PointInTimeRecoveryEnabled=true;
done
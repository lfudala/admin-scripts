#!/bin/bash

tablenames=$(aws dynamodb list-tables --region=us-east-1 | jq -r '.TableNames | .[]')
for i in $tablenames; do aws dynamodb describe-continuous-backups --table-name $i ; done

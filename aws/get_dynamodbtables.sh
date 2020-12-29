#!/bin/bash

tablenames=$(aws dynamodb list-tables --region=us-east-1 | jq -r '.TableNames | .[]')
echo "$tablenames"

#!/bin/bash

for region in $(aliyun ecs DescribeRegions | jq -r '.Regions.Region[] | .RegionId');
do
    echo -e "\nListing Instances in region:'$region'...";
    aliyun ecs DescribeInstances --RegionId "$region";
done
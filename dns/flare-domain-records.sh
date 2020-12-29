#!/bin/bash

# Requires flarectl from the cloudflare-go package
# https://github.com/cloudflare/cloudflare-go/tree/master/cmd/flarectl

domainprofile=
timestamp=$(date +%Y%m%dT%H%M%S)

zonefile=$(printf "%s-flare-zones-%s.csv" "$domainprofile" "$timestamp")
recordfile=$(printf "%s-flare-records-%s.csv" "$domainprofile" "$timestamp")
pagerulefile=$(printf "%s-flare-pagerules-%s.csv" "$domainprofile" "$timestamp")

mapfile -t zones < <(flarectl zone list)

i=1

for l in "${zones[@]}"; do
  test $i -lt 3 && ((i=$i+1)) && continue;
  zone=$(echo $l | awk '{ print $3 }');
  echo $zone >> $zonefile
done

#while read l; do
#  test $i -lt 3 && ((i=i+1)) && continue;
#  echo $l | awk '{ print $3 }';
#done <profile-flare-zones.txt

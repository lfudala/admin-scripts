#!/bin/bash
#
# Requires the cfcli command provided by the node
# cloudflare-cli package available at
# https://github.com/danielpigott/cloudflare-cli
# This script assumes that ~/cfcli.yml is configured
# with multi account profiles

if [[ $# -eq 0 ]] ; then
  echo 'cfcli profile required'
  exit 1
fi

# Set
domainprofile=$1
outfile=$(printf "%s-cf-records-%s.csv" "$domainprofile" "$(date +%Y%m%dT%H%M%S)")

# Get domains
mapfile -t domains < <(cfcli -u $domainprofile zones -f csv)

echo "Type,Name,Value,TTL,Active" > $outfile

for domain in "${domains[@]}"
do
  d=$(echo $domain | cut -f 1 -d ',');
  cfcli -u $domainprofile -d $d list -f csv >> $outfile;
done

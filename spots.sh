#!/bin/bash
#curl --socks5-hostname localhost:8080 https://www.dxcluster.co.uk/cluster/search -d callsign=kc4aaa \
#echo "================================================================================================================"
curl -s https://www.dxcluster.co.uk/cluster/search -d callsign=kc4aaa \
  | tr -d '\n' \
  | sed 's/<table/\n<table/g' \
  | sed 's/\/table>/\/table>\n/g' \
  | grep "class=\"spots\"" \
  | sed 's/\t/ /g' \
  | sed 's/<tr>/\n<tr>/g' \
  | sed 's/<table/\n<table/g' \
  | sed 's/<\/table>/\n<\/table>/g' \
  | sed 's/<tr>//g' \
  | sed 's/<td>/\t/g' \
  | sed 's/<\/tr>//g' \
  | sed 's/<\/td>//g' \
  | grep -v table \
  | sed 's/^   / /g' \
  | head -n 50 \
  | mail -s "DX Summary" jcasey@icecube.usap.gov
#echo "================================================================================================================"

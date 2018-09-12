#!/bin/bash
curl -s https://www.dxcluster.co.uk/cluster/search -d callsign=kc4aaa \
  | tr -d '\n' \
  | sed 's/<table/\n<table/g; s/\/table>/\/table>\n/g' \
  | grep "class=\"spots\"" \
  | sed 's/\t/ /g; s/<tr>/\n<tr>/g; s/<table/\n<table/g' \
  | sed 's/<\/table>/\n<\/table>/g; s/<tr>//g; s/<td>/\t/g' \
  | sed 's/<\/tr>//g; s/<\/td>//g' \
  | grep -v table \
  | sed 's/^   / /g' \
  | head -n 50

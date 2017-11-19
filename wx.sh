#!/bin/bash


echo > /tmp/wx.dat

for loc in nzfx nzwd nzcm nzsp
do

  metar ${loc} >> /tmp/wx.dat
  echo >> /tmp/wx.dat

done

for loc in nzfx nzwd nzcm nzsp
do
  curl -s https://bcaws.aviationweather.gov/taf/data?ids=${loc}\&format=raw\&submit=Get+TAF+data \
    | grep \<code\> \
    | sed 's/&nbsp;/ /g' \
    | sed -r 's/<[^>]*>//g' >> /tmp/wx.dat
  echo  >> /tmp/wx.dat

done



cat /tmp/wx.dat \
  | mail -s "WX Summary" jcasey@icecube.usap.gov

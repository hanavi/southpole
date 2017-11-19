#!/bin/bash

WEEK=44
BASEDIR=/home/james/remote/ws/svn/WinterOver/weekly_report/2017week${WEEK}

MUTT_CONFIG=usap REPLYTO=`mutt -A icecube` /usr/bin/mutt \
  -s "South Pole On-Ice Weekly Report #${WEEK}" \
  -c wo \
  -a "${BASEDIR}/OnIce Report 2017 week ${WEEK}.pdf" \
  -- icecube-c

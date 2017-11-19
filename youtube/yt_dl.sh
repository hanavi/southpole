#!/bin/bash

#DROPBOXDLDIR="/home/james/Dropbox/ytdl"
DROPBOXDLDIR=/home/james/tmp/ytdl
YTDL=/usr/bin/youtube-dl
DLDIR=/home/james/Dropbox/xfer/pole_mac
YTDLOPTS='-f mp4'
COMPLETEDDIR=/home/james/Downloads/finished
LOGDIR=/home/james/Dropbox/yt_logs

flist=$(ls ${DROPBOXDLDIR}/*.dl)

for fname in ${flist}
do
  DLFILES=$(cat ${fname})
  for dlfile in ${DLFILES}
  do
    echo cd ${DLDIR} && echo ${YTDL} ${YTDLOPTS} ${dlfile} 2\>\&1 \>${LOGDIR}/$(basename ${fname}).log
    echo mv ${fname} ${COMPLETEDDIR}
  done
done

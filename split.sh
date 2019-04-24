#!/bin/bash

# Default timetable and input file
TIMETABLE="timetable.txt"
INPUT="input.mp3"
NUM=0

# Getting options -t and -i
while getopts t:i: option 
do
  case "${option}" 
  in
    t) TIMETABLE=${OPTARG};;
    i) INPUT=${OPTARG};;
  esac
done

# Process timetable line by line
while read CMD; do
  let NUM=NUM+1
  START=$(echo "$CMD" | awk '{printf("00:%s", $1)}')
  END=$(echo "$CMD" | awk '{printf("00:%s", $3)}')
  FILENAME=$(printf "%02d" $NUM).$(echo "$CMD" | awk -f filename.awk)
  ffmpeg -i "$INPUT" -ss "$START" -t "$END" -acodec copy "$FILENAME"
done < "$TIMETABLE"

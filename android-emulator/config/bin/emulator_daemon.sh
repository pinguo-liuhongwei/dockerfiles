#!/bin/bash

killTime=2
program='emulator64-arm'

process=`ps -ef | grep $program | grep -v grep | awk '{print $2,$7}'`
if [ ! -z "$process" ]
then
    array=($process)
    pid=${array[0]}
    sTime=${array[1]}
    h=${sTime:0:2}
    if [ $h -ge $killTime ]
    then
        kill $pid
    fi
fi

process=`ps -ef | grep $program | grep -v grep | awk '{print $2,$7}'`
if [ -z "$process" ]
then
    /home/worker/bin/start-emulator
    sleep 5
    process=`ps -ef | grep $program | grep -v grep | awk '{print $2,$7}'`
fi

array=($process)
pid=${array[0]}
echo $pid
exit 0


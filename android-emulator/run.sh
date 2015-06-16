#!/bin/bash

echo '/etc/init.d/ssh start'
/etc/init.d/ssh start

echo 'run facedetect'
cd /home/worker/data/android
/home/worker/bin/start-emulator
adb shell am start -n us.pinguo.facedetect/us.pinguo.facedetect.MainActivity

echo '/usr/local/bin/supervisord -c /home/worker/supervisor/supervisord.conf'
/usr/local/bin/supervisord -c /home/worker/supervisor/supervisord.conf


#!/bin/bash

echo '/etc/init.d/ssh start'
/etc/init.d/ssh start

echo '/usr/bin/supervisord -c /home/worker/supervisor/supervisord.conf'
/usr/bin/supervisord -c /home/worker/supervisor/supervisord.conf


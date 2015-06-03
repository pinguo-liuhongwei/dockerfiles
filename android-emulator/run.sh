#!/bin/bash

echo '/etc/init.d/ssh start'
/etc/init.d/ssh start

echo '/usr/local/bin/supervisord -c /home/worker/supervisor/supervisord.conf'
/usr/local/bin/supervisord -c /home/worker/supervisor/supervisord.conf


#!/bin/bash

echo '/etc/init.d/sshd start'
/etc/init.d/sshd start

if [ -f /home/worker/bin/init.sh ]; then
    echo '/home/worker/bin/init.sh'
    chmod a+x /home/worker/bin/init.sh
    su worker -c '/home/worker/bin/init.sh'
fi

#echo '/usr/local/bin/supervisord -c /home/worker/supervisor/supervisord.conf'
#/usr/local/bin/supervisord -c /home/worker/supervisor/supervisord.conf

echo '/usr/bin/supervisord -c /home/worker/supervisor/supervisord.conf'
/usr/bin/supervisord -c /home/worker/supervisor/supervisord.conf


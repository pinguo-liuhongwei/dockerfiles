#!/bin/bash

echo '/etc/init.d/sshd start'
/etc/init.d/sshd start

if [ -f /home/worker/bin/init.sh ]; then
    echo '/home/worker/bin/init.sh'
    chmod a+x /home/worker/bin/init.sh
    su worker -c '/home/worker/bin/init.sh'
fi

echo 'service crond start'
service crond start

echo '/usr/bin/supervisord -c /home/worker/supervisor/supervisord.conf'
/usr/bin/supervisord -c /home/worker/supervisor/supervisord.conf


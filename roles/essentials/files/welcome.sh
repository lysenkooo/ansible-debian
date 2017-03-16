#!/bin/sh

[ -z "$PS1" ] && return

HOSTNAME=`uname -n`
FREE=`free -m`
LOADAVG=`cat /proc/loadavg`

USER_IP=`who am i | awk '{print $NF}' | sed 's/[()]//g'`
SERVER_IPS=`ip -o -4 addr list | grep -v 127.0.0.1 | awk '{print $4}' | tr '\n' ' ' | sed -e 's/\s*$//'`

LOAD1=`echo "$LOADAVG" | awk '{print $1}'`
LOAD5=`echo "$LOADAVG" | awk '{print $2}'`
LOAD15=`echo "$LOADAVG" | awk '{print $3}'`

MEMORY_USED=`echo "$FREE" | grep Mem | awk '{print $3}'`
MEMORY_TOTAL=`echo "$FREE" | grep Mem | awk '{print $2}'`
SWAP_USED=`echo "$FREE" | grep Swap | awk '{print $3}'`
SWAP_TOTAL=`echo "$FREE" | grep Swap | awk '{print $2}'`

TIME=`date '+%d.%m.%Y %H:%M:%S'`

echo "
=======================================================
 Time         : $TIME
 Hostname     : $HOSTNAME
 Interfaces   : $SERVER_IPS
=======================================================
 Load Average : $LOAD1 $LOAD5 $LOAD15
 Memory Usage : $MEMORY_USED / $MEMORY_TOTAL MB
 Swap Usage   : $SWAP_USED / $SWAP_TOTAL MB
=======================================================

Hello, ${USER}! Your IP is ${USER_IP}.
"

# colorful prompt

COLOR=31

echo "$HOSTNAME" | grep -q staging

if [ $? = 0 ]; then
    COLOR=33
fi

if [ $USER = "root" ]; then
    COLOR=36

    echo "Why you are logged as root, man?"
    echo
fi

PS1="\e[0;${COLOR}m[\u@\h \W]\\$\e[m "

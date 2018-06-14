#!/bin/sh
set -e
if test "$*" = ""
then
    /etc/init.d/ssh start
    exec socat -d -d TCP4-LISTEN:80,reuseaddr,fork TCP4:localhost:8080
else
    "$@"
fi

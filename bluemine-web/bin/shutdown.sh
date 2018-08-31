#!/bin/sh

JAVA="$JAVA_HOME/bin/java"
JAVAPS="$JAVA_HOME/bin/jps"

if $cygwin
then
    KILL=/bin/kill
else
    KILL=kill
fi

if readlink -f "$0" > /dev/null 2>&1 
then
  CRACKBIN=$(readlink -f $0)
else
  CRACKBIN=$(pwd -P)
fi

CRACKHOME=${CRACKBIN%'/bin'*}

echo "[INFO]Terminate the crack server; home=$CRACKHOME"

CRACKPS=$(ps -e -opid,cmd | grep -i "^[0-9]* .*java .*-Dapplication.home=$CRACKHOME .*com.lefeng.bi.crack.server.CrackServerMain$" | head -n 1 | sed 's/^ //')

if [ -z "$CRACKPS" ]; then
  echo "[INFO]Crack server is not running" 
  exit 1 
else
  PSID=${CRACKPS%% *}
  if [ $PSID -eq 0 ]; then
    echo "[ERROR]Not found PID"
    exit 1
  else
    $KILL -15 $PSID
    echo "[INFO]Stopped crack server; home=$CRACKHOME; PID=$PSID"
  fi
fi
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
  APP_BIN=$(readlink -f $0)
else
  APP_BIN=$(pwd -P)
fi

APP_HOME=${APP_BIN%'/bin'*}

echo "[INFO]Terminate the server; home=$APP_HOME"

CPS=$(ps -e -opid,cmd | grep -i "^[0-9]* .*java .*-Dapplication.home=$APP_HOME .*-Dconfig.file=$APP_HOME/config/application.properties .*bluemine.*\.jar$" | head -n 1 | sed 's/^ //')

if [ -z "$CPS" ]; then
  echo "[INFO]server is not running"
  exit 1
else
  PSID=${CPS%% *}
  if [ $PSID -eq 0 ]; then
    echo "[ERROR]Not found PID"
    exit 1
  else
    $KILL -15 $PSID
    echo "[INFO]Stopped server; home=$APP_HOME; PID=$PSID"
  fi
fi
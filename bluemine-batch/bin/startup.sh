#!/bin/sh

if [ "$JAVA_HOME" != "" ]; then
  JAVA="$JAVA_HOME/bin/java"
else
  JAVA=java
fi

echo "JAVA: "$JAVA

if readlink -f "$0" > /dev/null 2>&1
then
  BIN_PATH=$(readlink -f $0)
else
  BIN_PATH=$(pwd -P)
fi

APP_HOME=${BIN_PATH%"/bin"*}

echo "APP_HOME: "$APP_HOME

APP_JAR=$(find "$APP_HOME" -maxdepth 1 -name "bluemine*.jar" | head -n 1)

if [ -z "$APP_JAR" ]; then
 echo "[ERROR]Not found main jar file"
 exit 1
fi

echo "APP_JAR: "$APP_JAR

echo "[INFO]Start the server; home=$APP_HOME"

CPS=$(ps -e -opid,cmd | grep -i "^[0-9]* .*java .*-Dapplication.home=$APP_HOME$" | head -n 1 | sed 's/^ //')

if [ -n "$CRACKPS" ]; then
  echo "[ERROR]Server is running;"
  exit 1
else
  JAVAOPTS="-Xms512m -Xmx1024m -Xmn256m -Xss256k -XX:MaxPermSize=256m -Dfile.encoding=UTF-8 -Dapplication.home=$APP_HOME -Dconfig.file=$APP_HOME/config/application.properties"
  $JAVA $JAVAOPTS "-jar" $APP_JAR &
  exit 0
fi
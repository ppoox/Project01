#!/bin/sh
SERVICE_NAME=apisample
PATH_TO_JAR=/home/ubuntu/apps/apisample.jar
PID_PATH_NAME=/home/ubuntu/apps/apisample.pid
PID_NAME=apisample
PID_EXT=.pid
# JAVA_OPT="-Xms2048m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=512m"
#JAVA_OPT="-Dspring.profiles.active=dev"
JAVA_OPT=""
JAVA_OPT1="-Xms2048m -Xmx2048m -javaagent:/home/ubuntu/scouter/scouter/agent.java/scouter.agent.jar -Dobj_name="
JAVA_OPT2=" -Dscouter.config=/home/ubuntu/scouter/scouter/agent.java/conf/scouter.conf -Dserver.port=8110 "
JAVA_OPT=$JAVA_OPT1$PID_NAME$JAVA_OPT2
case $1 in
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ ! -f $PID_PATH_NAME ]; then
            # cat /dev/null > /home/nalpari/public/apps/apisample.log
            # nohup java $JAVA_OPT -jar $PATH_TO_JAR >> /home/nalpari/public/apps/apisample.log &
            nohup java $JAVA_OPT -jar $PATH_TO_JAR &
            echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is already running ..."
        fi
    ;;
    stop)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stoping ..."
            kill $PID;
            echo "$SERVICE_NAME stopped ..."
            rm $PID_PATH_NAME
            # rm /home/ubuntu/apps/apisample.log
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac

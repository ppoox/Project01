#!/bin/sh
SERVICE_NAME=apiapp_$2
PATH_TO_JAR=/home/ubuntu/apps_yoo/apiapp.jar
PID_PATH_NAME=/home/ubuntu/apps_yoo/apiapp_$2.pid
PID_NAME=apiapp_$2
PID_EXT=.pid
# JAVA_OPT="-Xms2048m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=512m"
#JAVA_OPT="-Dspring.profiles.active=dev"
# JAVA_OPT1="-Xms2048m -Xmx2048m -javaagent:/home/ubuntu/scouter/scouter/agent.java/scouter.agent.jar -Dobj_name="
JAVA_OPT1="-javaagent:/home/ubuntu/scouter/scouter/agent.java/scouter.agent.jar -Dobj_name="
JAVA_OPT2=" -Dscouter.config=/home/ubuntu/scouter/scouter/agent.java/conf/scouter.conf -Dserver.port="
JAVA_OPT=$JAVA_OPT1$PID_NAME$JAVA_OPT2$3
case $1 in
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ ! -f $PID_PATH_NAME ]; then
            # cat /dev/null > /home/nalpari/public/apps/apisample.log
            nohup java $JAVA_OPT -jar $PATH_TO_JAR >> /home/ubuntu/logs/apiapp_$2.log &
            # nohup java $JAVA_OPT -jar $PATH_TO_JAR &
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
            rm /home/ubuntu/logs/apiapp_$2.log
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac

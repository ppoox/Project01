#!/bin/sh
PATH_TO_JAR=/home/ubuntu/apps/deploy_fo.jar
PID_PATH_NAME=/home/ubuntu/apps_yoo/fo_$2.pid
COMMAND=$1
DEPLOY_DATE=$2
PID_NAME="fo_$3"
JAVA_OPT1="-javaagent:/home/ubuntu/scouter/scouter/agent.java/scouter.agent.jar -Dobj_name="
JAVA_OPT2=" -Dscouter.config=/home/ubuntu/scouter/scouter/agent.java/conf/scouter.conf -Dserver.port="
SERVER_PORT=0

case $3 in
    1)
        echo 'SERVER_PORT = 31010'
        SERVER_PORT=38080
    ;;
    2)
        echo 'SERVER_PORT = 31011'
        SERVER_PORT=38081
    ;;
esac

JAVA_OPTION=${JAVA_OPT1}${PID_NAME}${JAVA_OPT2}${SERVER_PORT}

case $1 in
    start)
        echo "Start ${PID_NAME}"
        echo "${JAVA_OPTION}${SERVER_PORT} -jar ${PATH_TO_JAR} &"
        nohup java ${JAVA_OPTION} -jar ${PATH_TO_JAR} >> /home/ubuntu/logs/fo_without_erueka_$3.log &
    ;;
    stop)
        echo "Stop ${PID_NAME}"
        if [ -z $(lsof -Pi:${SERVER_PORT} -sTCP:LISTEN -t) ]; then
            echo "${PID_NAME} is not activate"
        else 
            echo "${PID_NAME} will be shutdowned"
            curl -X POST http://localhost:${SERVER_PORT}/actuator/shutdown
        fi
    ;;
    bakcup)
        echo 'Backup'
        mv /home/ubuntu/apps/deploy_fo_without_erueka.jar /home/ubuntu/backup/deploy_fo_without_erueka_backup.jar
    ;;
    change)
        echo 'Change'
        cp /home/ubuntu/tmp/deploy_fo_without_erueka_$2.jar /home/ubuntu/apps/deploy_fo_without_erueka.jar
    ;;
    remove)
        echo 'Remove'
        rm /home/ubuntu/tmp/deploy_fo_without_erueka_$2.jar
    ;;
esac

#!/bin/sh

case $1 in
    backup)
        echo 'Backup'
        cp -r /home/ubuntu/apps/deploy_vue /home/ubuntu/backup/deploy_vue_backup
    ;;
    change)
        echo 'Change'
        cp -r /home/ubuntu/tmp/deploy_vue_$2/* /home/ubuntu/apps/deploy_vue/
        
     ;;
    remove)
        echo 'Remove'
        #rm -r ~/tmp/deploy_vue_$2
    ;;
esac

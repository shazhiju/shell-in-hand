合并文件
cat $(find logs/ -name "*.log") > target.log

create_folder_daily.sh
#!/bin/bash
current_date=`date '+%Y%m%d'`
mkdir $current_date



#!/bin/bash
# 由shell开始启动爬虫程序
python BaiduBaike_spider_shell.py


# 获取进程的pid号
ps -A |grep "cmdname"| awk '{print $1}'

间隔一段时间查询数据库数据，用以判断进程是否死掉，若监测到进程死掉，干掉进程然后重新启动
python BaiduBaike_spider_detection.py
if mark == 1
kill 爬虫程序的pid
否则不用管继续爬取。


Kill_process.sh
#!/bin/bash  
#ps term  
function psterm()  
{  
        [ ${#} -eq 0 ] && echo "usage: $FUNCNAME STRING" && return 0  
        local pid   
        pid=$(ps ax | grep "$1" | grep -v grep | awk '{ print $1 }')  
        echo -e "terminating '$1' / process(es):\n$pid"  
        kill -SIGTERM $pid  
}  
#ps grep  
ps aux | grep "$1" | grep -v 'grep'  
psterm $1




#!/bin/bash


# phpsyncserversd - Startup script for sync server


# chkconfig: 35 85 15
# description: sync redis cache data to redisdb.
# processname: php
# config: 
# pidfile: 


. /etc/rc.d/init.d/functions


SYNC_MQ="/opt/rest/code/Navi/sync_server/im/sync_im_mq_server.php"
SYNC_MQ_LOG="/opt/log/sync_im_mq_server.$(date +%Y-%m-%d).log"


SYNC_PUB_MQ="/opt/rest/code/Navi/sync_server/im/sync_im_pub_mq_server.php"
SYNC_PUB_MQ_LOG="/opt/log/sync_im_pub_mq_server.$(date +%Y-%m-%d).log"


SYNC_PERSIS_MQ="/opt/rest/code/Navi/sync_server/im/sync_im_persis_mq_server.php"
SYNC_PERSIS_MQ_LOG="/opt/log/sync_im_persis_mq_server.$(date +%Y-%m-%d).log"


SYNC_PERSIS_ERROR_MQ="/opt/rest/code/Navi/sync_server/im/sync_im_persis_error_mq_server.php"
SYNC_PERSIS_ERROR_MQ_LOG="/opt/log/sync_im_persis_error_mq_server.$(date +%Y-%m-%d).log"


SYNC_CENSORRES_MQ="/opt/rest/code/Navi/sync_server/im/sync_im_censorres_mq_server.php"
SYNC_CENSORRES_MQ_LOG="/opt/log/sync_im_censorres_mq_server.$(date +%Y-%m-%d).log"


SYNC_CENSORRES_ERR_MQ="/opt/rest/code/Navi/sync_server/im/sync_im_censorres_error_mq_server.php"
SYNC_CENSORRES_ERR_MQ_LOG="/opt/log/sync_im_censorres_error_mq_server.$(date +%Y-%m-%d).log"


SYNC_STAT_MQ="/opt/rest/code/Navi/sync_server/im/sync_im_stat_mq_server.php"
SYNC_STAT_MQ_LOG="/opt/log/sync_im_stat_mq_server.$(date +%Y-%m-%d).log"


PHPD="nohup /usr/bin/php "
killfindname() {
        local RC delay
        RC=0;delay=3
        if [ "$#" -eq 0 ]; then
                echo $"Usage: killbyname [-f findname] [ -d delay]"
                return 1
        fi
        if [ "$1" = "-f" ]; then
                findname=$2
                shift 2
        fi
        if [ "$1" = "-d" ]; then
                delay=$2
                shift 2
        fi
        for pid in $(ps -ef |grep "$findname" |grep -v "grep"|awk '{print $2}'); do
                if checkpid $pid 2>&1; then
                        kill -TERM $pid >/dev/null 2>&1
                        usleep 100000
                        if checkpid $pid && sleep $delay && checkpid $pid ; then
                                kill -KILL $pid >/dev/null 2>&1
                        fi
                        if checkpid $pid ; then
                                echo "stop $findname failed!"
            else
                echo "stop $findname succed!"
                        fi
                fi
        done
        return $RC
}


start()
{
  mkdir -p /opt/log
  for((i=0; i < PROCESS_COUNT; i++));do
    echo "Starting phpsyncserversd: $i"
    nohup /usr/bin/php $SYNC_MQ >> $SYNC_MQ_LOG &
    nohup /usr/bin/php $SYNC_PUB_MQ >> $SYNC_PUB_MQ_LOG &
    nohup /usr/bin/php $SYNC_PERSIS_MQ >> $SYNC_PERSIS_MQ_LOG &
    nohup /usr/bin/php $SYNC_PERSIS_ERROR_MQ >> $SYNC_PERSIS_ERROR_MQ_LOG &
    nohup /usr/bin/php $SYNC_CENSORRES_MQ >> $SYNC_CENSORRES_MQ_LOG &
    nohup /usr/bin/php $SYNC_CENSORRES_ERR_MQ >> $SYNC_CENSORRES_ERR_MQ_LOG &
    nohup /usr/bin/php $SYNC_STAT_MQ >> $SYNC_STAT_MQ_LOG &
  done;
}


stop()
{
  echo "Stopping phpsyncserversd: "
  killfindname -f $SYNC_MQ -d 4
  killfindname -f $SYNC_PUB_MQ -d 4
  killfindname -f $SYNC_PERSIS_MQ -d 4
  killfindname -f $SYNC_PERSIS_ERROR_MQ -d 4
  killfindname -f $SYNC_CENSORRES_MQ -d 4
  killfindname -f $SYNC_CENSORRES_ERR_MQ -d 4
  killfindname -f $SYNC_STAT_MQ -d 4
}


restart () {
    stop
    sleep 4
    start
}


RETVAL=0
PROCESS_COUNT=`echo $2 | awk '{if ($0 ~/^[1-9][0-9]*$/){print $0}else{print 1}}'`


case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart|reload|force-reload)
    restart
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|reload|force-reload}"
    RETVAL=1
esac


exit $RETVAL



if [ $? -eq 0 ]
上一个命令执行后的退出状态

if [ $# -ne 2 ]
传递到脚本的参数个数



split -l 2100000 video_image_07 image_
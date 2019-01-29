#! /bin/bash


#tmpdir=/home/hdfs/sz/runshell/tmp
#hdfsdir=/flumedata/testtmpdir 
#backdir=/home/hdfs/sz/runshell/tmpdata


beforeHour=6

tmpdir=/data1/flumelogtmp
hdfsdir=/flumedata/tmpdir
backdir=/nfs/flumetextlog

function init(){
  
#  killOldPid

  beforeTime=`date "+%Y-%m-%d_%H" -d "-$beforeHour hours"`

  echo "############ start backup befor currentTime logs ######## :  " $beforeTime

  if [ ! -e $tmpdir ];then
	mkdir $tmpdir
  fi

  if [ ! -e $backdir ];then
        mkdir $backdir
  fi

  cd $tmpdir
}

function killOldPid(){

    for loop in `ps -ef | grep '/home/hdfs/sz/runshell/backup_flume_textlog.sh' | awk '{print $2}'`
    do
        kill -9 $loop > /dev/null 2>&1
        echo kill -9 $loop > /dev/null 2>&1
    done

}

## 备份 effective invalid数据  在dsdc05备份
function bkhdfslogtolocal(){

  for loop in  `hdfs dfs -ls ${hdfsdir}/*_effective*.FINISH | awk -F '/' '{print $NF}' | awk -F '_p1' '{if($1 < beforeTime) print $0}' beforeTime="${beforeTime}"`
  do
	echo ">>>>>> get hdfs data : "  $hdfsdir/$loop

#       hdfs dfs -test -e $hdfsdir/$loop
#	if [ $? -eq 0 ];then
		rm -rf $tmpdir/$loop
		hdfs dfs -get $hdfsdir/$loop > /dev/null 2>&1
		
		if [ $? -eq 0 ];then
			 echo "`date "+%Y-%m-%d %H:%M:%S"` >>>>>> start backup logs  : " $loop
			localFileConvertBz2 $loop
		fi
#        fi
  done

}	


function localFileConvertBz2(){
	local backlog=$1
	if [ -e $backlog ] && [[ $backlog =~ .*\.FINISH$ ]] ; then
		pbzip2 -zk  -m300  -p3 $backlog > /dev/null 2>&1
		if [ $? -eq 0 ];then
			rm -rf $backlog > /dev/null 2>&1			
			
			logDay=${backlog:0:10}
			logDay=${logDay//-/}
			logHour=${backlog:11:2}
			
			bak2Dir=${backdir}/${logDay}/${logHour}
			if [ ! -e $bak2Dir ];then
				mkdir -p ${bak2Dir}
			fi
		
			rm -rf $bak2Dir/${backlog}.bz2 > /dev/null 2>&1
	
			mv ${backlog}.bz2 $bak2Dir
			
			if [ $? -eq 0 ];then
                       		hdfs dfs -rm -r ${hdfsdir}/$backlog > /dev/null 2>&1
				 echo "`date "+%Y-%m-%d %H:%M:%S"`  >>>>>> bak finish  : "  ${hdfsdir}/$backlog
			fi
		fi
	fi

}


init

bkhdfslogtolocal

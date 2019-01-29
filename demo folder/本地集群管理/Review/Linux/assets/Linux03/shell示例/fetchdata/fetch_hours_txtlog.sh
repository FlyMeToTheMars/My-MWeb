#! /bin/bash
# 提取数据目的是为了成本计算需要
#     成本计算 需要满足同时有竞价成功和展示的日志,所以为了避免竞价成功和展示跨小时问题. 现只把满足条件的广告请求日志提取出来计算,
#  不满足条件的放入等待队列,待下一个小时批次计算时再合并. 如果队列3小时还未有匹配的展示或竞价成功则不再等待
#
#


basedir=/home/hdfs/sz/runshell/reports/effective

batch=$1

inputDataPath=$2/${batch}/effective/*.parquet
waitInputPath=$3

outputresultbase=$4

fetchresultDir="fetcheffective/${batch}"
waitdataDir="fetchwaitqueue"

waittimeout=100
#fetchresultouptut=${outputresultbase}/${fetchresultDir}
#waitDataPath=${outputresultbase}/${waitdataDir}

#waitInputPath=""

pars=900
dm=4g
em=1g
ec=1
ne=40
ssmf=0.1

echo ">>>>>>>>>> `date '+%F %T'`  start fetch  : " ${inputDataPath}


hdfs dfs -mkdir -p ${outputresultbase} > /dev/null 2>&1
hdfs dfs -rm -r ${outputresultbase} > /dev/null 2>&1

#--conf spark.io.compression.codec=lz4
spark-submit --master yarn-cluster --driver-memory $dm --executor-memory $em --executor-cores $ec --num-executors $ne --conf spark.shuffle.manager=tungsten-sort --conf spark.storage.memoryFraction=$ssmf --class com.lomark.reports.data.OfflineEffectiveDataFilter --name offline-fetchdata-${batch////} /home/hdfs/sz/runshell/reports/data-analysis-1.0-SNAPSHOT.jar  "${inputDataPath}"  "${waitInputPath}" "${outputresultbase}" "${fetchresultDir}" "${waitdataDir}" "${waittimeout}"  "${pars}"

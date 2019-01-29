#! /bin/bash
# 提取数据目的是为了成本计算需要
#     成本计算 需要满足同时有竞价成功和展示的日志,所以为了避免竞价成功和展示跨小时问题. 现只把满足条件的广告请求日志提取出来计算,
#  不满足条件的放入等待队列,待下一个小时批次计算时再合并. 如果队列3小时还未有匹配的展示或竞价成功则不再等待
#
#


basedir=/home/hdfs/sz/runshell/reports/effective

batch=$1

inputDataPath=$2/${batch}/effective/*.parquet
outputPath=$3/${batch}

waitDataPath=$4
waitOutPutPath=${waitDataPath}


inputdatasize=`hdfs dfs -ls ${inputDataPath} | wc -l `
if [[ ${inputdatasize} -eq 0 ]];then
    exit
fi

#pars=900
pars=100
dm=4g
em=1g
ec=1
#ne=40
ne=30
ssmf=0.1

echo ">>>>>>>>>> `date '+%F %T'`  start fetch  : " ${inputDataPath}

hdfs dfs -mkdir ${outputPath} > /dev/null 2>&1
hdfs dfs -rm -r ${outputPath} > /dev/null 2>&1

waitqueue01=${waitDataPath}/queue01
waitqueue02=${waitDataPath}/queue02

hdfs dfs -mkdir -p ${waitqueue01} > /dev/null 2>&1
hdfs dfs -mkdir -p ${waitqueue02} > /dev/null 2>&1

waitDataPath=${waitqueue01}/*.parquet
waitOutPutPath=${waitqueue02}
#小时单位  默认3小时
waittimeout=8

hdfs dfs -rm -r ${waitOutPutPath} > /dev/null 2>&1

waitdatasize=`hdfs dfs -ls ${waitDataPath} | wc -l `
if [[ $waitdatasize -eq 0 ]];then
	waitDataPath=""
fi

#--conf spark.io.compression.codec=lz4
spark-submit --master yarn-cluster --driver-memory $dm --executor-memory $em --executor-cores $ec --num-executors $ne --conf spark.shuffle.manager=tungsten-sort --conf spark.storage.memoryFraction=$ssmf --class com.lomark.reports.data.OfflineEffectiveDataFilter --name offline-fetchdata-${batch////} /home/hdfs/sz/runshell/reports/data-analysis-1.0-SNAPSHOT.jar  "${inputDataPath}"  "${waitDataPath}" "${outputPath}" "${waitOutPutPath}" "${waittimeout}" "${pars}" >> ${basedir}/logs/fetchdata/$(date '+%F')_reports.log 2>&1


hdfs dfs -test -e ${waitOutPutPath}/_SUCCESS  > /dev/null 2>&1
if [ $? -eq 0 ] ; then
    hdfs dfs -rm -r ${waitqueue01} > /dev/null 2>&1
    hdfs dfs -mv ${waitqueue02} ${waitqueue01} > /dev/null 2>&1
fi











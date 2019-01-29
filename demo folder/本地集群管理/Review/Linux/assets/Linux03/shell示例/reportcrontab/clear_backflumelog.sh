#! /bin/bash

dataDir=/nfs/flumetextlog

bakdays=15

beforeDay=`date "+%Y%m%d" -d "-${bakdays} days "`

for clearItem in `ls ${dataDir}  | awk  '{ if($0 < lineDay ) print $0 }' lineDay="${beforeDay}"  `
do
      rm -rf ${dataDir}/${clearItem} > /dev/null 2>&1 
done

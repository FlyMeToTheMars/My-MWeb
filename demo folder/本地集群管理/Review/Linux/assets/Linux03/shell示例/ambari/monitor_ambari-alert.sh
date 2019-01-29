lasthour=`date -d "-1 hour" "+%Y-%m-%d %H:%M"`
#lasthour="2016-07-07 13"
lasthour=${lasthour:0:13}
echo $lasthour

line=`cat /var/log/ambari-server/ambari-alerts.log | grep "$lasthour" | grep "CRITICAL" |  grep -v "webui" | grep -v "AMBARI_METRICS" | grep -v "ATLAS"  | awk -F ' ' '{print $3$4$5}' | sort -u`
echo $line
if [ -n "$line" ];then

IFS_OLD=$IFS
IFS=$'\n'

for i in $line
do
echo "1111"
echo $i
python /root/script/monitor_ambari-alert.py $i
done

IFS=$IFS_OLD
fi

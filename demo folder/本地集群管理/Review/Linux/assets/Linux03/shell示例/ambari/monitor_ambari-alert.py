import urllib
import urllib2
import sys

url='http://api.xxxx.com/MessageService.asmx/SendSms'
phones='1860104xxxx'
str=sys.argv[1]
#str='2016-06-30 13:24:04,077 [WARNING] [HDFS] [datanode_storage_percent] (PercentDataNodesWithAvailableSpace)affected:[1],total:[8]'
#str='2016-07-07 16:44:15,086 [CRITICAL] [AMBARI_METRICS] [ams_metrics_collector_process] (Metrics Collector Process) Connection failed: [Errno 111] Connection refused to dsdc06:6188'
#str='asdasdasd'
print str
#strs=str.split(' ')
#print strs[2] + strs[3] + strs[4]
#msg=strs[2] + strs[3] + strs[4]
msg=str

values={"username":"","password":"","companycode":"","phonelist":phones,"msg":msg}
data=urllib.urlencode(values)
print data
request=urllib2.Request(url,data)
response=urllib2.urlopen(request)
print response.read()

#!/bin/sh

set -eux

#CITY=Shanghai
#LANGUAGE="zh-CN"
#UNIT=m
#UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36"

#curl \
#  -H "Accept-Language: $LANGUAGE" \
#  -H "User-Agent: $UA" \
#  -o result.html \
#  wttr.in/$CITY?format=4\&$UNIT

#########################################
##                  @Mail Y0ur Linux   ##
##                  @Code by Bin4xin   ##
#########################################

#ps aux --sort=-rss  >> ps-aux.data
#s-nail -M "text/html" -s "信息来自：【$(curl -sL ip.tool.lu |awk -F ":" '{print $2}'|awk 'NR==2')】|【$(date +%Y/%m/%d/%R) |
#$(ps aux --sort=-rss|wc -l)进程】" 1904829268@qq.com < google.html


serverIPaddr=$(curl -sL ip.tool.lu |awk -F ":" '{print $2}'|awk 'NR==1')
serverPlace=$(curl -sL ip.tool.lu |awk -F ":" '{print $2}'|awk 'NR==2')
serverDate=$(date +%Y/%m/%d/%R)
processCounts=$(ps aux --sort=-rss|wc -l)
process=$(ps aux --sort=-rss)
mailContent_Type="text/html"
mailTo="1904829268@qq.com"
mailHTMLFile="/home/bin4xin/shares/share-files/bash/s-nail-bash-ps/google.html"

echo -e "IP地址:$serverIPaddr\n 地址:$serverPlace\n 当地时间:$serverDate\n 共计:$processCounts进程\n <!DOCTYPE html><body><div style="padding-top:20px;font-size:12px;line-height:16px;color:#5f6368;letter-spacing:0.3px;text-align:center">今日讯息<br><code>$process</code></div></body></html>" >> result.html

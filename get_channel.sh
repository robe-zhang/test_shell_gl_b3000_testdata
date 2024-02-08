#!/bin/bash

SCAN_DATA=/datadisk/gl_b3000/get_channel_temp.log

SSID_LIST="HUAWEI-B3K_2G HUAWEI-B3K_5G 607-2 607-2_Wi-Fi5 401 HUAWEI-8YNq ChinaNet-608-5G ChinaNet-608 ZH HUAWEI-8YNq-5G ZH-5G "

iw dev wlp58s0 scan | grep -E "freq:|SSID:" > ${SCAN_DATA}
DATE_NOW=$(date "+%F %T")

for SSID_NAME in $SSID_LIST; do
	LOG_FILE=/datadisk/gl_b3000/get_channel_${SSID_NAME}.log
	
	# STRING_CHANNEL=$(grep -B 1 -w ${SSID_NAME} ${SCAN_DATA} | head -n 1)
	STRING_CHANNEL=$(grep -B 1 -E " ${SSID_NAME}$" ${SCAN_DATA})
	echo "${DATE_NOW} ========" >> ${LOG_FILE}
	echo "${STRING_CHANNEL}" >> ${LOG_FILE}
done

# /datadisk/gl_b3000/get_channel.sh
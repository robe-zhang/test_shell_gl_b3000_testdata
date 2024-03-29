#!/bin/bash

LOG_FILE=/datadisk/gl_b3000/get_openwrt_temp_load_memory.log
# PASSWORD_STRING="12345678"		for test only

DATE_NOW=$(date "+%F %T")
TEMPERATURE_CPU=$(/datadisk/gl_b3000/get_openwrt_data.sh 12345678 /sys/class/thermal/thermal_zone0/temp | tail -n 1)
TEMPERATURE_CPU1=$(/datadisk/gl_b3000/get_openwrt_data.sh 12345678 /sys/class/thermal/thermal_zone1/temp | tail -n 1)
TEMPERATURE_CPU2=$(/datadisk/gl_b3000/get_openwrt_data.sh 12345678 /sys/class/thermal/thermal_zone2/temp | tail -n 1)
IDLE_CPU=$(/datadisk/gl_b3000/get_openwrt_data1.sh 12345678 | grep "CPU:")
LOAD_CPU=$(/datadisk/gl_b3000/get_openwrt_data1.sh 12345678 | grep "Load average:")
MEM_DATA=$(/datadisk/gl_b3000/get_openwrt_data2.sh 12345678 | grep "Mem:")
UPTIME_DATE=$(/datadisk/gl_b3000/get_openwrt_data3.sh 12345678 | grep "load average:")

TEMPERATURE_CPU=$(echo "$TEMPERATURE_CPU" | sed 's/\r//g')
TEMPERATURE_CPU1=$(echo "$TEMPERATURE_CPU1" | sed 's/\r//g')
TEMPERATURE_CPU2=$(echo "$TEMPERATURE_CPU2" | sed 's/\r//g')
IDLE_CPU=$(echo "$IDLE_CPU" | sed 's/\r//g')
LOAD_CPU=$(echo "$LOAD_CPU" | sed 's/\r//g')
MEM_DATA=$(echo "$MEM_DATA" | sed 's/\r//g')
UPTIME_DATE=$(echo "$UPTIME_DATE" | sed 's/\r//g')

echo "[${DATE_NOW}]: [thermal(0,1,2); ${TEMPERATURE_CPU}, ${TEMPERATURE_CPU1}, ${TEMPERATURE_CPU2}]. [${IDLE_CPU}]. [${LOAD_CPU}]. memory order(total,used,free,shared,buff/cache,available) [${MEM_DATA}]. [${DATE_NOW}][${UPTIME_DATE}]" >> ${LOG_FILE} 


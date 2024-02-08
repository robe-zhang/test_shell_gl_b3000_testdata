#!/bin/bash

file_log=/datadisk/gl_b3000/ping_test_56_router.log
DIST_IP="192.168.51.1"
PACK_SIZE=56

string_date=$(date "+%F %T")
string_result=$(ping -c 60 -i 1 -W 1 -s ${PACK_SIZE} ${DIST_IP} | grep "packets transmitted")
echo "[${string_date}]: ${string_result}" >> ${file_log}




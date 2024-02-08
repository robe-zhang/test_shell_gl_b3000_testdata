#!/bin/bash

file_log=/datadisk/gl_b3000/ping_test.log

string_date=$(date "+%F %T")
string_result=$(ping -c 60 -i 1 -W 1 www.baidu.com | grep "packets transmitted")
echo "[${string_date}]: ${string_result}" >> ${file_log}

# /datadisk/gl_b3000/ping_test.sh



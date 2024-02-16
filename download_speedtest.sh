#!/bin/bash

LOG_FILE=/datadisk/gl_b3000/download_speedtest.log

rm -rf /tmp/imagefile.iso
rm -rf /tmp/imagefile.log
wget -o /tmp/imagefile.log -O /tmp/imagefile.iso https://mirrors.ustc.edu.cn/ubuntu-releases/22.04.3/ubuntu-22.04.3-desktop-amd64.iso
grep -r "saved" /tmp/imagefile.log >> ${LOG_FILE}
rm -rf /tmp/imagefile.iso
rm -rf /tmp/imagefile.log



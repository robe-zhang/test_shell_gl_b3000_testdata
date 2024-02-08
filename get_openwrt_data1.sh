#!/usr/bin/expect -f

set password [lindex $argv 0]

spawn ssh root@192.168.51.1 top -b -n 1
expect "*password:"
send "$password\n"
interact
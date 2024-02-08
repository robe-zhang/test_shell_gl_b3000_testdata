#!/usr/bin/expect -f

set password [lindex $argv 0]
set thermal_zone [lindex $argv 1]

spawn ssh root@192.168.51.1 cat $thermal_zone
expect "*password:"
send "$password\n"
interact
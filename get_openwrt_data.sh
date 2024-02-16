#!/usr/bin/expect -f

set password_string [lindex $argv 0]
set thermal_zone [lindex $argv 1]

spawn ssh root@192.168.51.1 cat $thermal_zone
expect {
	"*fingerprint*"  { send "yes\n" }
	"*password:" { send "$password_string\n" }
	}
expect eof
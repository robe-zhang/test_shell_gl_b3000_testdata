#!/usr/bin/expect -f

set password_string [lindex $argv 0]

spawn ssh root@192.168.51.1 free -h
expect {
	"*fingerprint*"  { send "yes\n" }
	"*password:" { send "$password_string\n" }
	}
expect eof
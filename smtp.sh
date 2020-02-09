#!/usr/bin/expect
# CHORFA Alla-eddine
# h4ckr213dz@gmail.com
# version : 0.9 Beta
#
# Description send file content by mail using smtp server
#
# usage:
#	smtp.sh 'smtp.server_ip_or_hostname' 'from@email' 'to@email' 'subject' './file.txt'
#
# dependencies: requires shell "/usr/bin/expect"
#################################
set timeout 2
set target [lindex $argv 0]
set from [lindex $argv 1]
set to [lindex $argv 2]
set subject [lindex $argv 3]
set datafile [lindex $argv 4]
set fileopened [ open "$datafile"]
set filecontent [ read "$fileopened"]
#################################
spawn "telnet"
#sleep 1
send "open $target 25\n"
sleep 1
expect {
	"220\n" { 
		send "EHLO B0T2133DZ\n"
		expect "250\n"
		send "MAIL FROM: $from\n"
		expect "250\n"
		send "RCPT TO: $to\n"
		expect "Z50\n"
		send "DATA\n"
		expect "send message\n"
		send "from: $from\n"
		send "to: $to\n"
		send "subject: $subject\n"
		send "\n"
		send "$filecontent\n"
		send "\n"
		send ".\n" 
		}
	"Unable to connect" { 
		send "QUIT\n" 
		}
	}

#expect "x"
#send "QUIT\n" #smtp prot
#expect "x"
#send "QUIT\n" #quit telnet
##############################"##
interact


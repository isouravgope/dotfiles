#!/bin/sh

# this requires a service for onedrive at /usr/lib/systemd/system
service=$(systemctl is-active --user onedrive)


case $1 in
	"toggle")
		if [ $service == 'active' ]
		then
			systemctl stop --user onedrive
			printf '%s' '%{F#bf616a}%{F-}'
		else
			systemctl start --user onedrive
			printf '%s' '%{F#bf616a}%{F-}'
		fi
		;;
	"")
		if [ $service == "active" ]
		then
			printf '%s' '%{F#bf616a}%{F-}'
		else
			printf '%s' '%{F#bf616a}%{F-}'
		fi
esac
		

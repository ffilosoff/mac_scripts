#! /bin/bash
echo `date +"%D %T"`>> /Users/pav/logs/ttl.log
while true; do
	sudo /usr/sbin/sysctl -w net.inet.ip.ttl=65
	ttl=`sudo /usr/sbin/sysctl net.inet.ip.ttl`
	echo $ttl
	len=${#ttl}-1
	last_char=${ttl:len:1}
	echo -n `date +"%D %T"`>> /Users/pav/logs/ttl.log
	if [ $last_char = "5" ]; then
		echo " TTL changed" >> /Users/pav/logs/ttl.log
		break
	else
		echo " TTL not changed" >> /Users/pav/logs/ttl.log
		sleep 2s
	fi
done 

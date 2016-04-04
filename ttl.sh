#! /bin/bash
logfile=/Users/pav/logs/ttl.log 
echo `date +"%D %T"`>> $logfile 
i=1
while true; do
	sudo /usr/sbin/sysctl -w net.inet.ip.ttl=65
	ttl=`sudo /usr/sbin/sysctl net.inet.ip.ttl`
	echo $ttl
	len=${#ttl}-1
	last_char=${ttl:len:1}
	echo `date +"%D %T"` "Trying to change TTL ($i)" >> $logfile
	echo -n `date +"%D %T"`>> $logfile
	if [ $last_char = "5" ]; then
		echo " Success. TTL changed" >> $logfile
		break
	else
		echo " TTL not changed" >> $logfile
		sleep 2s
	fi
	if [ $i -eq 3 ]; then
		echo " Falure. TTL not changed" >> $logfile
		break;
	fi
	let i+=1
done 

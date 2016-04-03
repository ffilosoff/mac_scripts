Steps for using this script with crontab in mac:

1) edit crontab: sudo crontab -e

2) add line: @reboot /path/to/script

3) open ttl.sh change path to logfile or make it null: 

	logfile=/path/to/logfile
	
	logfile=/dev/null 
	
4) ready, just restart your mac

If you need to change TTL=YOURNUMBER

1) change expression '/usr/sbin/sysctl -w net.inet.ip.ttl=65' to '/usr/sbin/sysctl -w net.inet.ip.ttl=YOURNUMBER'

2) change 'if [ $last_char = "5" ]; then' to 'if [ $last_char = "LAST_SYMBOL_OF_YOUR_NUMBER" ]; then'

!important: it won't work properly if last symbol of your number is '4'

(it is really seldom when it is 4)

Often TTLs to set:

Android: 65

Windows Phone: 129

iPhone (for most ones): 65 


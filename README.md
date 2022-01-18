# openwrt
Scripts for working with openwrt

#rshell.sh
OpenWrt relies on a simple session id for authorisation. If the session id can be intercepted (some devices may be HTTP-only), then this script can establish a reverse shell by clobbering root's crontab ("nc -lvp 444" to listen for incoming shell). Tested against __openwrt-21.02.0-x86-64-generic-ext4-combined.img__.

Beyond weak session management, this is not considered a serious vulnerability (knowledge of the session id allows full access to the web interface anyway).

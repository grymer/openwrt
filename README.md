# openwrt
Scripts for working with openwrt

**rshell.sh:**
OpenWrt relies on a simple session id for authorisation. If the session id can be intercepted (some devices may be HTTP-only), then this script can establish a reverse shell by clobbering root's crontab ("nc -lvp 444" to listen for incoming shell). Tested against __openwrt-21.02.0-x86-64-generic-ext4-combined.img__.

**rshell2.sh:**
Similar to __rshell.sh__, except this time we abuse path traversal in the init script management interface after uploading a shell script and marking it executable. This approach is slicker, as the reverse shell is returned immediately (with __rshell.sh__ you may have to wait up to a minute for the crontab to kick in). -- Now [patched](https://github.com/openwrt/luci/commit/8752701b0d01a81d0bd0a735be733f24ad11ab69) --

Beyond weak session management, this is not considered a serious vulnerability (knowledge of the session id allows full access to the web interface anyway).

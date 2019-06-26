set device to do shell script "networksetup -listallhardwareports | awk '$3==\"Wi-Fi\" {getline;print}' | awk '{print $2}'"
set power to do shell script "networksetup -getairportpower " & device & " | awk '{print $4}'"
if power is equal to "on" then
	set power to "off"
else
	set power to "on"
end if
do shell script ("networksetup -setairportpower " & device & " " & power)

tell application "System Events" to tell process "SystemUIServer"
	set bt to (first menu bar item whose description is "bluetooth") of menu bar 1
	tell menu of bt
		click bt
		if exists menu item "Turn Bluetooth On" then
			click menu item "Turn Bluetooth On"
		else if menu item "Turn Bluetooth Off" exists then
			click menu item "Turn Bluetooth Off"
		else
			key code 53 --escape
		end if
	end tell
end tell

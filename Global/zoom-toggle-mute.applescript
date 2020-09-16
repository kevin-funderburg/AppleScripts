--
--	Created by: Kevin Funderburg
--	Created on: 9/15/20
--
try
	if not (application "AnyBar" exists) then
		error "AnyBar not installed, either remove line 23 or download AnyBar from 'https://github.com/tonsky/AnyBar'"
	end if
	if notInMeeting() then error "not in a meeting"
	tell application "System Events"
		tell process "zoom.us"
			tell menu bar 1
				tell menu bar item 3
					tell menu "Meeting"
						if menu item "Mute Audio" exists then
							click menu item "Mute Audio"
							set diag to "Audio is muted"
							set c to "white"
						else if menu item "Unmute Audio" exists then
							click menu item "Unmute Audio"
							set c to "red"
							set diag to "Audio is Unmuted"
						end if
					end tell
				end tell
			end tell
		end tell
	end tell
	do shell script "/bin/echo -n " & c & " | nc -4u -w0 localhost ${2:-1738}"
	display notification (diag) with title ("Toggle zoom audio")
on error errMsg number errNum
	display dialog (errMsg & return & return & errNum) ¬
		buttons {"Cancel", "OK"} ¬
		default button ("OK") ¬
		with icon caution
end try

on notInMeeting()
	if application "zoom.us" is not running then return false
	tell application "System Events"
		tell process "zoom.us"
			tell menu bar 1
				tell menu bar item "zoom.us"
					tell menu 1
						return (enabled of menu item "Join Meeting...")
					end tell
				end tell
			end tell
		end tell
	end tell
end notInMeeting


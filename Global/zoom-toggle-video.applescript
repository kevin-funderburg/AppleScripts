--
--	Created by: Kevin Funderburg
--	Created on: 9/15/20
--
try
	if not inMeeting() then error "not in a meeting"
	tell application "System Events"
		tell process "zoom.us"
			tell menu bar 1
				tell menu bar item 3
					tell menu "Meeting"
						if menu item "Start Video" exists then
							click menu item "Start Video"
							set diag to "You're on camera"
						else if menu item "Stop Video" exists then
							click menu item "Stop Video"
							set diag to "You're off camera"
						end if
					end tell
				end tell
			end tell
		end tell
	end tell
	display notification (diag) with title ("Toggle zoom video")
on error errMsg number errNum
	display dialog (errMsg & return & return & errNum) ¬
		buttons {"Cancel", "OK"} ¬
		default button ("OK") ¬
		with icon caution
end try

on inMeeting()
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
end inMeeting


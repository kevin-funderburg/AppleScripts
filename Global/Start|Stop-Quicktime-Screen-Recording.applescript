tell application "QuickTime Player"
	set check to name of every window
	if check is {} then
		set resultDocument to new screen recording
		delay 1
		tell resultDocument
			start
		end tell
	else
		set resultDocument to first document whose name is "Screen Recording"
		tell resultDocument
			stop
		end tell
	end if
end tell

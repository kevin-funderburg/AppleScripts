try
	tell application "AirPort Utility" to activate
	tell application "System Events"
		tell process "AirPort Utility"
			set failsafe to 0
			repeat until (first image of group 1 of scroll area 1 of window 1 whose name contains "AirPort") exists
				delay 0.1
				set failsafe to failsafe + 1
				if failsafe = 100 then error "Script timeout, AirPort not found"
			end repeat
			set airport to first image of group 1 of scroll area 1 of window 1 whose name contains "AirPort"
			click airport
			delay 1
			click menu item "Restart…" of menu 1 of menu bar item "Base Station" of menu bar 1
			set failsafe to 0
			repeat until (button "Continue" of sheet 1 of window 1) exists
				delay 0.1
				set failsafe to failsafe + 1
				if failsafe = 100 then error "Script timeout, AirPort not found"
			end repeat
			click button "Continue" of sheet 1 of window 1
		end tell
	end tell
on error errMsg number errNum
	display dialog errMsg & return & return & errNum buttons {"Cancel", "OK"} default button "OK"
end try

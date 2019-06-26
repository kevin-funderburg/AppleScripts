-- I found there's big lag when toggling through Hazel's menu bar
-- so it's actually faster to do it through System Preferences.
try
	tell application "System Preferences"
		activate
		set current pane to pane "com.noodlesoft.Hazel"
		tell application "System Events"
			tell process "System Preferences"

				-- Pause until info button exists
				set failsafe to 0
				repeat until exists of radio button 3 of radio group 1 of window 1
					delay 0.1
					set failsafe to failsafe + 1
					if failsafe = 100 then error "info button" number 1000
				end repeat

				-- Make sure the "Info" button is clicked
				if value of radio button 3 of radio group 1 of window 1 = 0 then
					click radio button 3 of radio group 1 of window 1
				end if

				-- Pause until Start/Stop Hazel button exists
				set failsafe to 0
				repeat until exists of (first button of group 1 of group 1 of window 1 whose name contains "Hazel")
					delay 0.1
					set failsafe to failsafe + 1
					if failsafe = 100 then error "Start/Stop Hazel button" number 1000
				end repeat

				click (first button of group 1 of group 1 of window 1 whose name contains "Hazel")
			end tell
		end tell
		quit
	end tell
on error errMsg number errNum
	if errNum = 1000 then set errMsg to "Script timeout, " & errMsg & " not found"
	display dialog errMsg & return & return & errNum buttons {"Cancel", "OK"} default button "OK"
end try

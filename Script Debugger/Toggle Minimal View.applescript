tell application "Script Debugger"
	tell front document
		if toolbar visible then
			set event log visible to false
			set toolbar visible to false
			set tab display mode to none
		else
			set event log visible to true
			set toolbar visible to true
			set tab display mode to result and variables tab
		end if
	end tell
end tell

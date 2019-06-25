tell application "Keyboard Maestro"
	set sel to selection
	if class of item 1 of sel is macro then
		if (count of items of sel) > 1 then
			tell application "System Events"
				display alert "Run Current Macro" message "More than one macro selected" as critical buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel"
				return
			end tell
		end if
	end if
	set uid to id of first macro whose selected is true
end tell

tell application "Keyboard Maestro Engine" to do script uid

use scripting additionstell application "Keyboard Maestro"	set sel to selection	if class of item 1 of sel is macro and (count of items of sel) > 1 then		tell application "System Events"			display alert "Error" message "Multiple Macros Selected" as critical buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel"		end tell		return	else		set uid to id of first macro whose selected is true		set the clipboard to ¬			"-- ignoring application responses
tell application \"Keyboard Maestro Engine\"
	do script \"" & uid & "\"
	-- or: do script \"" & uid & "\" with parameter \"Whatever\"
end tell
-- end ignoring"	end ifend tell
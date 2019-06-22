tell application "System Events" to set frontapp to name of first process whose frontmost is true

tell application frontapp
	activate
	repeat with i from (count of documents) to 1 by -1
		set thisDocument to document i
		try
			if path of (get properties of thisDocument) = missing value or name of thisDocument contains "Untitled" then
				close thisDocument without saving
			end if
		on error errMsg number errNum
			display alert "Error" message errMsg as critical buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel"
		end try
	end repeat
end tell

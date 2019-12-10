use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions
use kl : script "Kevin's Library"


on run argv
	
	try
		if class of argv = script or class of argv = document then
			set duration to "90" as number
		else if class of argv = list then
			set duration to (item 1 of argv) as number
		end if
		
		tell application "OmniFocus"
			set selectedItems to my getSelection()
			repeat with t in selectedItems
				tell t
					set estimated minutes to duration
				end tell
			end repeat
		end tell
		
	on error errMsg number errNum
		display dialog errMsg & return & return & errNum buttons {"Cancel", "OK"} default button "OK"
	end try
	
end run

on getSelection()
	tell application "OmniFocus"
		tell content of first document window of front document
			set validSelectedItemsList to value of (selected trees where class of its value is not item and class of its value is not folder)
			if (count of validSelectedItemsList) = 0 then error "No task(s) are selected" number -1000
			return validSelectedItemsList
		end tell
	end tell
end getSelection


use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

on run argv
	set _clear to false
	try
		if class of argv = script or class of argv = document then
			set argv to {"1", "0", "30"}
		end if
		if class of argv = list then
			if item 1 of argv = "clear" then
				set _clear to true
			else
				set _d to item 1 of argv as number
				set _h to item 2 of argv as number
				set _m to item 3 of argv as number
			end if
		end if
		
		tell application "OmniFocus"
			set selectedItems to my getSelection()
			repeat with t in selectedItems
				tell t
					if _clear then
						set due date to missing value
					else
						if due date = missing value then
							set due date to ((current date) + (_d * days) + (_h * hours) + (_m * minutes))
						else
							set due date to (due date + (_d * days) + (_h * hours) + (_m * minutes))
						end if
					end if
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


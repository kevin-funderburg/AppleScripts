use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "System Events"
	display dialog "Enter the starting number or click clear to remove number prefix." default answer 0 with title "Renumber Macro Prefix Numbers" buttons {"Cancel", "Clear", "OK"} default button "OK"
end tell
tell result
	set buttonReturned to button returned
	set strt to text returned as number
end tell


tell application "Keyboard Maestro"
	set sel to selection
	if class of item 1 of sel ≠ macro then error "Invalid selection, please select macro(s)"
	set n to strt
	repeat with m in sel
		set nm to m's name
		
		if buttonReturned = "Clear" then
			set newname to characters 4 thru -1 of nm as text
			tell m
				set name to newname
			end tell
		else
			if n < 10 then set n to "0" & n
			tell m
				if character 3 of nm is ")" then
					set newname to n & (characters 3 thru -1 of nm) as text
				else
					set newname to (n & ")" & nm) as text
				end if
				set name to newname
			end tell
			set n to n + 1
		end if
	end repeat
end tell


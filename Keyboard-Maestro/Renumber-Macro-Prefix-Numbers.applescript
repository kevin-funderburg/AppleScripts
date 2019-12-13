use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

try
	tell application "Keyboard Maestro"
		
		set dialogResult to display dialog ¬
			"Enter the starting number or click clear to remove number prefix." default answer 0 ¬
			with title "Renumber Macro Prefix Numbers" buttons {"Cancel", "Clear", "OK"} ¬
			default button "OK" with icon ¬
			POSIX file "/System/Volumes/Data/Applications/Keyboard Maestro.app/Contents/Resources/kmicon.icns"
		set startNum to dialogResult's text returned as number
		
		set sel to selection
		if class of item 1 of sel ≠ macro then error "Invalid selection, please select macro(s)"
		set n to startNum
		repeat with m in sel
			set oldname to m's name
			
			if dialogResult's button returned = "Clear" then
				
				if character 3 of oldname = ")" then -- 2 digit number prefix
					set newname to characters 4 thru -1 of oldname as text
				else if character 2 of oldname = ")" then -- 1 digit number prefix
					set newname to characters 3 thru -1 of oldname as text
				else -- doesn't have a number prefix
					set newname to oldname
				end if
				
			else
				if n < 10 then set n to "0" & n
				
				if character 3 of oldname is ")" then
					set newname to n & (characters 3 thru -1 of oldname) as text
				else if character 2 of oldname is ")" then -- 1 digit number prefix
					set newname to n & (characters 2 thru -1 of oldname) as text
				else -- doesn't have a number prefix
					set newname to (n & ")" & oldname) as text
				end if
				set n to n + 1
				
			end if
			set m's name to newname
		end repeat
	end tell
	
on error errMsg number errNum
	if errNum ≠ -128 then
		display dialog errMsg & return & return & errNum buttons {"Cancel", "OK"} ¬
			default button "OK" with icon caution
	end if
end try


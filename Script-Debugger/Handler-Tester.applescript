use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions
use kl : script "Kevin's Library"

tell application "Keyboard Maestro Engine"
	if variable "SD__theChoice" exists then
		set handlerName to getvariable "SD__theChoice"
	else
		tell application "Script Debugger"
			tell front document
				set theselection to selection
				if theselection begins with "on" then
					set handlerName to kl's extractBetween(paragraph 1 of theselection, "on ", "(")
				end if
			end tell
		end tell
	end if
end tell


tell application "Script Debugger"
	tell front document
		set theName to name
		set theHandler to first script handler whose name is handlerName
		set theparams to every handler parameter of theHandler
		set handlerCall to missing value
		if (count of every handler parameter of theHandler) > 0 then
			repeat with n from 1 to (count of theparams)
				if n = 1 then
					set paramList to name of item n of theparams
					set variableSetter to "set " & name of item n of theparams & " to var" & n
				else
					set paramList to paramList & ", " & name of item n of theparams
					set variableSetter to variableSetter & return & "set " & name of item n of theparams & " to var" & n
				end if
			end repeat
		end if
		
		if handlerCall ≠ missing value then
			set handlerCall to handlerName & "(" & paramList & ")"
			set theTester to variableSetter & "

tell application \"Script Debugger\"
	tell document \"" & theName & "\"
		" & handlerCall & "
	end tell
kend tell"
		else
			set theTester to "tell application \"Script Debugger\"
	tell document \"" & theName & "\"
		" & handlerName & "()" & "
	end tell
end tell"
			
		end if
	end tell
	
	set d to make new document with properties {source text:theTester}
	tell d
		compile
	end tell
	
end tell

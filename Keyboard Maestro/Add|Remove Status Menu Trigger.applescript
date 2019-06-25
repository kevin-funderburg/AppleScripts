try
	tell application "Keyboard Maestro"
		set m to first macro whose selected is true
		tell m
			set thetrigs to description of every trigger
			if thetrigs does not contain "The Status Menu" then
				make new trigger with properties {xml:"<dict>
	<key>MacroTriggerType</key>
	<string>StatusMenu</string>
</dict>
			else
"}
				delete (first trigger whose description is "The Status Menu")
			end if
		end tell
	end tell
on error errMsg number errorNumber
	error display dialog errMsg & return & return & errNum buttons {"Cancel", "OK"} default button "OK"
end try

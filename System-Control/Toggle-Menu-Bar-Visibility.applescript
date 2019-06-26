use scripting additions
tell application "System Events"
	
	tell process "System Preferences" to activate
	
	tell application "System Preferences"
		set current pane to pane "com.apple.preference.general"
	end tell
	
	tell process "System Preferences"
		
		set failSafe to 0
		repeat until checkbox 5 of window 1 exists
			delay 0.1
			set failSafe to failSafe + 1
			if failSafe = 100 then error "Script timeout"
		end repeat
		
		set thecheckbox to checkbox 5 of window 1
		set theValue to value of thecheckbox
		set failSafe to 0
		
		repeat until theValue is not value of thecheckbox ¬
			or failSafe is 10
			click thecheckbox
			set failSafe to failSafe + 1
			delay 0.1
		end repeat
		
	end tell
	
	tell application "System Preferences" to quit
end tell

tell application "System Events" to set frontapp to name of first process whose frontmost is true

tell application frontapp
	tell front document
		close saving no
	end tell
end tell

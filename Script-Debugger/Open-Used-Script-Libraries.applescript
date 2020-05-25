tell application "Script Debugger"
	tell front document
		set libfiles to used script library files
	end tell
end tell

tell application "Finder"
	repeat with f in libfiles
		open f
	end repeat
end tell


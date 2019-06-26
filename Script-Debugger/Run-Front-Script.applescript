on waitUntilReady(d)
	repeat while execution state of d is not in {stopped, paused}
		delay 0.2
	end repeat
end waitUntilReady

tell application "Script Debugger"
	set d to front document
	tell d
		execute
		my waitUntilReady(d)
		if not compiled then return last error message
		return last result
	end tell
end tell

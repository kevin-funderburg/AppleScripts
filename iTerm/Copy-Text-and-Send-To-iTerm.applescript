tell application "System Events" to keystroke "c" using {command down}
delay 0.1
tell application "iTerm"
	set w to current window
	tell w's current session to write text (the clipboard)
	activate
end tell

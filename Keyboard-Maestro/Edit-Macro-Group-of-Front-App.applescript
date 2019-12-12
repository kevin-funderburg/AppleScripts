tell application "System Events"
	set theApp to name of first process whose frontmost is true
end tell

tell application "Keyboard Maestro"
	set uuid to id of first macro group whose name contains theApp
	activate
	editMacro uuid
end tell


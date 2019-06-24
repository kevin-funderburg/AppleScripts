use scripting additions
tell application "System Events"
	set appPath to POSIX path of application file of first process whose frontmost is true
	tell application "Alfred 4" to action appPath
	set the clipboard to "Recent"
	keystroke "v" using {command down}
	keystroke return
end tell

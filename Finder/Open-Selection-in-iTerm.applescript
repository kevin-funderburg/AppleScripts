tell application "Finder"
	set myWin to window 1
	set theWin to (quoted form of POSIX path of (target of myWin as alias))
end tell

tell application "iTerm"
	set w to create window with profile "Default"
	tell w's current session to write text "cd " & theWin & " && clear"
end tell


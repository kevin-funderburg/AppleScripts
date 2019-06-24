set thePath to choose file name with prompt "Enter the name and choose the path" default name "Untitled.applescript"
tell application "Script Debugger"
	tell front document
		save in thePath as text script line endings Unix endings
	end tell
end tell

use scripting additions

set theLibs to {}
tell application "Script Debugger"
	tell front document
		set ls to used script libraries
		repeat with n from 1 to (count of ls)
			-- Update this path to your script libraries folder (~/Library/Script Libraries/), I keep mine in Dropbox and use an alias for the system to refer to them.
			set end of theLibs to (((path to home folder) as string) & "Dropbox:Library:Script Libraries:" & item n of ls & ".scptd") as alias
		end repeat
	end tell
end tell

tell application "Finder" to open theLibs
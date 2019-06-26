use scripting additions
use kl : script "Kevin's Library"

on run
	
	set logpath to POSIX file "/Users/kevinfunderburg/Library/Logs/Keyboard Maestro/Engine.log"
	
	tell application "Keyboard Maestro"
		set p to ""
		set i to 0
		set theLog to kl's readFromFileAs(logpath, text)
		repeat until p contains "Execute macro"
			set i to i + 1
			set p to paragraph -i of theLog
		end repeat
		set mname to text 3 thru length of (item 2 of kl's split(p, "‚"))
		set m to first macro whose enabled is true and name is mname
		set uid to m's id
		editMacro uid
		activate
	end tell
	
end run
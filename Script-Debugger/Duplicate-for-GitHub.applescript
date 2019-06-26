use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions
use kl : script "Kevin's Library"

tell application "Script Debugger"
	tell front document
		set f to file spec
		tell application "Finder"
			set ext to file f's name extension
		end tell
		set thePath to kl's SearchandReplace(POSIX path of (file spec as alias), ext, "applescript")
		set sourceText to source text
	end tell
	set newFile to make new document with properties {source text:sourceText, script type:text script}
	save newFile in thePath line endings Unix endings
	repeat with d in documents
		if d's id = newFile's id then
			tell d to close saving no
			exit repeat
		end if
	end repeat
end tell

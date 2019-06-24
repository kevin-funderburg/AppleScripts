tell application "Script Debugger"
	tell front document
		set sourceText to source text
		set thename to name
	end tell
	set d to make new document with properties {source text:sourceText}
	tell d
		compile
	end tell
end tell

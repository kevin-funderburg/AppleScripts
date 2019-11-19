use scripting additions
use kl : script "Kevin's Library"
set apsfolder to alias "Macintosh HD:Users:kevinfunderburg:github:AppleScripts:"
tell application "Script Debugger"
	tell document 1
		set spec to file spec
		tell application "Finder"
			set n to kl's SearchandReplace(name of file spec, "." & name extension of file spec, "")
		end tell
		set fname to kl's SearchandReplace(n, " ", "-")
		set outpath to POSIX path of (choose folder default location apsfolder)
		set src to source text
		set src to kl's SearchandReplace(src, return, linefeed)
		do shell script "echo " & quoted form of src & " > \"" & outpath & "/" & fname & ".applescript\""
	end tell
end tell

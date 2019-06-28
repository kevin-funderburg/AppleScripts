use scripting additions
use kl : script "Kevin's Library"

-- You need to update wfFolder to: (path of your Alfred preferences folder) > workflows
property wfFolder : "~/Dropbox/Library/Application\\ Support/Alfred/Alfred.alfredpreferences/workflows"

try
	tell application "System Events"
		tell process "Alfred Preferences"
			try
				set wfName to value of static text 1 of window 1
			on error "Couldn't get the workflow name" number errNum
			end try
		end tell
	end tell

	set theFolders to do shell script "find " & wfFolder & " -name \"info.plist\""

	set wfPath to missing value
	repeat with z from 1 to (count of paragraphs of theFolders)
		set fRecord to (kl's readPlistAt:(paragraph z of theFolders))
		if (|name| of fRecord) is wfName then
			set wfPath to kl's SearchandReplace(paragraph z of theFolders, "info.plist", "")
			exit repeat
		end if
	end repeat

	if wfPath ≠ missing value then
		tell application "Alfred 4" to browse wfPath
	else
		error "Couldn't find the workflow folder"
	end if

on error errMsg number errNum
	display dialog errMsg & return & return & errNum buttons {"Cancel", "OK"} default button "OK"
end try

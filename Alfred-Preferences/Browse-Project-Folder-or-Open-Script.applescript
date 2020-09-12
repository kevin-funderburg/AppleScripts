use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use scripting additions
use kl : script "Kevin's Library"

property NSUTF8StringEncoding : a reference to 4
property wfFolder : "~/Dropbox/Library/Application\ Support/Alfred/Alfred.alfredpreferences/workflows"

on run argv
	
	if class of argv = script then
		set argv to choose from list {"clipboard", "browse"}
		if class of argv ≠ list then return
	end if
	set argv to item 1 of argv
	
	
	tell application "System Events"
		tell process "Alfred Preferences"
			try
				set wfName to value of static text 1 of window 1
			on error
				error "Couldn't get the workflow name" number errNum
			end try
		end tell
	end tell
	
	set plists to do shell script "find " & wfFolder & " -name \"info.plist\""
	
	set wfPath to missing value
	repeat with p in paragraphs of plists
		set fRecord to (kl's readPlistFromPath:p)
		if fRecord's |name| = wfName then
			set wfPath to characters 1 thru -11 of p as text
			exit repeat
		end if
	end repeat
	
	if wfPath = missing value then error "Couldn't find the workflow folder"
	
	if argv = "clipboard" then
		set scptName to getScriptFromClipboard()
		set theFile to (POSIX file (wfPath & scptName) as text) as alias
		tell application "Finder" to open theFile
	else
		tell application "Alfred 4" to browse wfPath
	end if
	
end run

on getScriptFromClipboard()
	local j
	set j to its convertJSONToAS:(the clipboard) isPath:false
	if j is not "" then
		set bashText to |script| of config of alfredworkflow of j
		try
			return do shell script "echo " & quoted form of bashText & " | grep -Eo '\w+\.[a-z]+'"
		on error errMsg number errNum
			display dialog ("'" & bashText & "' doesn't match the regular expression." & return & return & errNum) ¬
				buttons {"Cancel", "OK"} ¬
				default button "OK"
		end try
	else
		error "clipboard is not a json string"
	end if
end getScriptFromClipboard


-- pass either a POSIX path to the JSON file, or a JSON string; isPath is a boolean value to tell which
on convertJSONToAS:jsonStringOrPath isPath:isPath
	if isPath then -- read file as data
		set theData to current application's NSData's dataWithContentsOfFile:jsonStringOrPath
	else -- it's a string, convert to data
		set aString to current application's NSString's stringWithString:jsonStringOrPath
		set theData to aString's dataUsingEncoding:NSUTF8StringEncoding
	end if
	-- convert to Cocoa object
	set {theThing, theError} to current application's NSJSONSerialization's JSONObjectWithData:theData options:0 |error|:(reference)
	if theThing is missing value then error (theError's localizedDescription() as text) number -10000
	-- we don't know the class of theThing for coercion, so...
	set listOfThing to current application's NSArray's arrayWithObject:theThing
	return item 1 of (theThing as list)
end convertJSONToAS:isPath:


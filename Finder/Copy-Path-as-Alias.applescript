use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use scripting additions

-- classes, constants, and enums used
property NSString : a reference to current application's NSString

tell application "Finder" to set thePath to POSIX path of (selection as alias)
set the clipboard to "\"" & my encodePosixtoHFS(thePath) & "\" as alias"
display notification (the clipboard) with title "Clipboard Set"

on encodePosixtoHFS(theString)
	if theString contains "~" then set theString to my SearchandReplace(theString, "~", path to home folder as string)
	if theString starts with "/Users" then set theString to "Macintosh HD" & theString
	if theString contains "\\" then set theString to my SearchandReplace(theString, "\\", "")
	if theString contains "\"" then set theString to my SearchandReplace(theString, "\"", "")
	return my SearchandReplace(theString, "/", ":")
end encodePosixtoHFS

on SearchandReplace(sourceText, replaceThis, withThat)
	set theString to NSString's stringWithString:sourceText
	set theString to theString's stringByReplacingOccurrencesOfString:replaceThis withString:withThat
	return theString as text
end SearchandReplace

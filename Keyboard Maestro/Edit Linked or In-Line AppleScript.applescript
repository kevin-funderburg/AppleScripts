(*
===============================================================================
          		Edit Linked or In-Line AppleScript
===============================================================================

Version: 1.0												Updated: 02/17/2018 06:14 CST
By: Kevin Funderburg

PURPOSE:

When you trigger this script, it will determine if the action copied is an
in-line or linked AppleScript and open the result in your preferred AppleScript
editor (default is Script Debugger).
- If it is in-line, it will compile the text in your editor


- Shout out to Chris Stone for a lot of the plist set up


REQUIRED:
	1.	Mac OS X Yosemite 10.10.5+
	2.	Mac Applications
			• Script Debugger or Script Editor
				
	3.	EXTERNAL OSAX Additions/LIBRARIES/FUNCTIONS
			• None
					
	4.	INTERNAL FUNCTIONS:
			• SearchandReplace()


VERSION HISTORY:
1.0 - Initial version.
===============================================================================
*)
use AppleScript version "2.4"
use framework "Foundation"
use scripting additions
---------------------------------------------------------------------------------

set kmPlistStr to missing value
set scriptPath to missing value
tell application "Keyboard Maestro"
	set sel to selection
	set thexml to xml of item 1 of sel
end tell
try
	tell application "System Events"
		set actionPlistRecord to value of (make property list item with properties {text:thexml})
		--set UseText to |UseText| of actionPlistRecord
		tell actionPlistRecord
			if its UseText is true then
				set theText to its |Text|
				tell application "Script Debugger"
					set newScript to make new document with properties {source text:theText, debugger enabled:true}
					tell newScript
						compile
						activate
					end tell
				end tell
				
			else
				set scriptPath to its |path|
				if scriptPath starts with "~" then set scriptPath to my SearchandReplace(scriptPath, "~", (POSIX path of (path to home folder)) as text)
				set scriptPath to scriptPath as POSIX file
				if scriptPath ≠ "" then
					tell application "Finder" to open scriptPath
				else
					beep
				end if
			end if
		end tell
	end tell
	
on error
	beep
end try

---------------------------------------------------------------------------------
on SearchandReplace(sourceText, replaceThis, withThat)
	set theString to current application's NSString's stringWithString:sourceText
	set theString to theString's stringByReplacingOccurrencesOfString:replaceThis withString:withThat
	return theString as text
end SearchandReplace

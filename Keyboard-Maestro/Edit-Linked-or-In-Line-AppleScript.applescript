(*
===============================================================================
          		Edit Linked or In-Line AppleScript
===============================================================================

Version: 1.0												Updated: 02/17/2018 06:14 CST
By: Kevin Funderburg

PURPOSE:

When you trigger this script, it will determine if the action copied is an
in-line or linked AppleScript and open the result in Script Debugger.
- If it is in-line, it will compile the text in your editor


REQUIRED:
	1.	Mac OS X Yosemite 10.10.5+
	2.	Mac Applications
			• Script Debugger
				
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

try
	tell application "Keyboard Maestro"
		set sel to selection
		if class of item 1 of sel ≠ action then error "Action is not selected, please select a script action"
		if (count of items of sel) > 1 then error "Multiple actions selected, please select one"
		set a to item 1 of sel
		set _xml to a's xml
		tell application "System Events"
			set _xml to value of (make property list item with properties {text:_xml})
		end tell
		if _xml's UseText then
			tell application "Script Debugger"
				set newScript to make new document with properties {source text:(_xml's |Text|), debugger enabled:true}
				tell newScript
					compile
					activate
				end tell
			end tell
		else
			if _xml's |path| starts with "~" then
				set scriptPath to my SearchandReplace(_xml's |path|, "~", (POSIX path of (path to home folder)) as text)
			end if
			
			set scriptPath to scriptPath as POSIX file
			if scriptPath ≠ "" then
				tell application "Finder" to open scriptPath
			else
				beep
			end if
		end if
		
	end tell
on error errMsg number errNum
	display dialog errMsg & return & return & errNum buttons {"Cancel", "OK"} default button "OK"
end try

---------------------------------------------------------------------------------
on SearchandReplace(sourceText, replaceThis, withThat)
	set theString to current application's NSString's stringWithString:sourceText
	set theString to theString's stringByReplacingOccurrencesOfString:replaceThis withString:withThat
	return theString as text
end SearchandReplace

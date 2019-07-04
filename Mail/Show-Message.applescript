(*
===============================================================================
                             Rule: Show Message
===============================================================================

Version: 1.0                                 Updated: 07/03/19 22:53:45 CST
By: Kevin Funderburg

PURPOSE:

This script is used in conjunction with Mail rules to open and show an email 
message. Particularly useful for messages that are important that you don't
want to miss.

My main rule that uses this is:
'If sender is VIP` 
then
`Set color of text to red` 
and 
`Run Applescript: Show Message`

For a rule script to work it must be placed in:
~/Library/Application Scripts/com.apple.mail

REQUIRED:
	1.    Mac OS X Yosemite 10.10.5+
	2.    Mac Applications
                • Mail
				
        3.    EXTERNAL OSAX Additions/LIBRARIES/FUNCTIONS
                • None

VERSION HISTORY:
1.0 - Initial version.
===============================================================================
*)
using terms from application "Mail"
	on perform mail action with messages theMessages for rule theRule
		
		try
			repeat with m in theMessages
				tell application "Mail"
					tell m
						if read status is false then
							open
							tell application "System Events"
								tell process "Mail" to set frontmost to true
							end tell
						end if
					end tell
				end tell
			end repeat
		on error errMsg number errNum
			display dialog errMsg & return & return & "Error Number: " & errNum buttons {"Cancel", "OK"} default button "OK"
		end try
		
	end perform mail action with messages
end using terms from

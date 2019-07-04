(*
===============================================================================
                        Edit Last Typinator Rule
===============================================================================

Version: 1.0                                 Updated: 07/03/19 18:25:45 CST
By: Kevin Funderburg

PURPOSE:

Use to quickly edit the last snippet expanded in Typinator.

REQUIRED:
	1.    Mac OS X Yosemite 10.10.5+
	2.    Mac Applications
                • Typinator
				
        3.    EXTERNAL OSAX Additions/LIBRARIES/FUNCTIONS
                • Dialog Toolkit Plus

VERSION HISTORY:
1.0 - Initial version.
===============================================================================
*)
use scripting additions
use framework "Foundation"
use framework "AppKit"
use script "Dialog Toolkit Plus" --version "1.1.0"


tell application "Typinator"
	set lastexp to value of variable "Typinator_abbreviation"
	set theSet to value of variable "Typinator_set"
	set lastrule to first rule of rule set theSet whose abbreviation is lastexp
	tell lastrule
		set snip to plain expansion
		set abbreve to abbreviation
		set descrip to description
		set uid to unique id
		set containerid to unique id of containing set
	end tell
end tell

set theLabelStrings to {"Abbreviation", "Snippet:", "Description:"}
set maxLabelWidth to max width for labels theLabelStrings
set controlLeft to maxLabelWidth + 8
set theTop to 0
set {theRule, theTop} to create rule (theTop + 12) rule width 400
set {descripField, descripLabel, theTop, fieldLeft} to create side labeled field (descrip) placeholder text descrip left inset 0 bottom (theTop + 8) total width 400 label text (item 3 of theLabelStrings) field left controlLeft
set {snipField, snipLabel, theTop, fieldLeft} to create side labeled field (snip) placeholder text snip left inset 0 bottom (theTop + 8) total width 400 label text (item 2 of theLabelStrings) field left controlLeft
set {abbreveField, abbreveLabel, theTop, fieldLeft} to create side labeled field (abbreve) placeholder text abbreve left inset 0 bottom (theTop + 8) total width 400 label text (item 1 of theLabelStrings) field left controlLeft
-- make list of controls and pass to display command
set allControls to {theRule, descripField, descripLabel, snipField, snipLabel, abbreveField, abbreveLabel}
-- controlResults will in the same order as allControls
set {buttonName, suppressedState, controlResults} to display enhanced alert "Edit Last Typinator Rule" message "Use this window to edit directly, or click Show to see the snippet in Typinator" as informational alert buttons {"Cancel", "Show", "OK"} giving up after 120 acc view width 400 acc view height theTop acc view controls allControls without suppression
set {unused, descrip, unused, snip, unused, abbreve} to controlResults

if buttonName = "OK" then
	tell application "Typinator"
		try
			set c to first rule set whose unique id is containerid
			tell c
				set r to first rule whose unique id is uid
				
				tell r
					set abbreviation to abbreve
					set description to descrip
					set plain expansion to snip
				end tell
			end tell
			
		on error errMsg number errNum
			if errNum = -1719 then
				display notification "No unique id found" with title "Edit Snippet" subtitle "Error:" sound name "Basso"
			end if
		end try
	end tell
else if buttonName = "Show" then
	tell application "Typinator" to quick search "last"
	delay 0.3
	tell application "System Events" to keystroke return using {command down}
end if
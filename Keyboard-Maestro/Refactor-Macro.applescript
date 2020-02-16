use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use scripting additions
use kl : script "Kevin's Library"
use script "Dialog Toolkit Plus" version "1.1.0"


try
	set accViewWidth to 400
	set {theButtons, minWidth} to create buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel" with equal widths
	if minWidth > accViewWidth then set accViewWidth to minWidth -- make sure buttons fit
	-- to make it look better, we can get the length of the longest label we will use, and use that to align the controls
	set theLabelStrings to {"Replace This:", "With That:"}
	set maxLabelWidth to max width for labels theLabelStrings
	set controlLeft to maxLabelWidth + 8
	
	set {replaceField, replaceLabel, theTop, fieldLeft} to create side labeled field "" placeholder text "replace string" left inset 0 bottom (0) total width accViewWidth - 50 label text (item 2 of theLabelStrings) field left controlLeft
	set {searchField, searchLabel, theTop, fieldLeft} to create side labeled field "" placeholder text "find string" left inset 0 bottom (theTop + 8) total width accViewWidth - 50 label text (item 1 of theLabelStrings) field left controlLeft
	set {messageLabel, theTop} to create label "This will refactor the search string for every action in this macro." bottom theTop + 12 max width accViewWidth control size small size
	-- then a bold message
	set {boldLabel, theTop} to create label "Refactor Current Macro" bottom theTop + 8 max width accViewWidth control size regular size with bold type
	-- make list of cotronls and pass to display command
	set allControls to {replaceField, replaceLabel, searchField, searchLabel, boldLabel, messageLabel}
	
	-- controlResults will in the same order as allControls
	set {buttonName, controlsResults} to display enhanced window "Refactor Keyboard Maestro" acc view width accViewWidth acc view height theTop acc view controls allControls buttons theButtons initial position {100, 30} giving up after 50 with align cancel button
	
	set {replace, unused, srch, unused, unused, unused} to controlsResults
	
	if buttonName = "Cancel" then return
	if srch = "" or srch = missing value then return
	
	tell application "Keyboard Maestro"
		set m to first macro whose selected is true
		repeat with a in actions of m
			set a's xml to kl's SearchandReplace(a's xml, srch, replace)
		end repeat
	end tell
	
on error errMsg number errNum
	display dialog errMsg & return & return & errNum buttons {"Cancel", "OK"} ¬
		default button "OK" with icon caution
end try


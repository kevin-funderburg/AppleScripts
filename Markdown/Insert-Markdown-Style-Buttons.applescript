use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use scripting additions
use script "Dialog Toolkit Plus" version "1.1.0"

try
	
	set accViewWidth to 250
	set {theButtons, minWidth} to create buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel" with equal widths
	if minWidth > accViewWidth then set accViewWidth to minWidth -- make sure buttons fit
	-- to make it look better, we can get the length of the longest label we will use, and use that to align the controls
	set theLabelStrings to {"Key:"}
	set maxLabelWidth to max width for labels theLabelStrings
	set controlLeft to maxLabelWidth + 8
	-- then a labeled field
	set {keyField, keyLabel, theTop, fieldLeft} to create side labeled field "A" placeholder text "keyboard key" left inset 0 bottom (0) total width 150 label text (item 1 of theLabelStrings) field left controlLeft
	-- start from the bottom with a checkbox
	set {hyperkey, theTop, newWidth} to create checkbox "Hyperkey" left inset controlLeft bottom (theTop + 12) max width accViewWidth without initial state
	set {shft, theTop, newWidth} to create checkbox "⇧" left inset controlLeft bottom (theTop + 12) max width accViewWidth without initial state
	set {ctrl, theTop, newWidth} to create checkbox "⌃" left inset controlLeft bottom (theTop + 12) max width accViewWidth without initial state
	set {opt, theTop, newWidth} to create checkbox "⌥" left inset controlLeft bottom (theTop + 12) max width accViewWidth with initial state
	set {cmd, theTop, newWidth} to create checkbox "⌘" left inset controlLeft bottom (theTop + 12) max width accViewWidth with initial state
	-- then a small explanatory label
	set {messageLabel, theTop} to create label "Check the modifier keys and type the key you want to insert." bottom theTop + 12 max width accViewWidth control size small size
	-- then a bold message
	set {boldLabel, theTop} to create label "Insert Markdown style buttons" bottom theTop + 8 max width accViewWidth control size regular size with bold type
	-- make list of cotronls and pass to display command
	set allControls to {keyField, keyLabel, hyperkey, shft, ctrl, opt, cmd, boldLabel, messageLabel}

	--set {buttonName, suppressedState, controlsResults} to display enhanced alert "Send for output" message "More text goes in here" as informational alert buttons {"Cancel", "OK"} giving up after 120 acc view width 250 acc view height theTop acc view controls allControls without suppression

	-- controlResults will in the same order as allControls
	set {buttonName, controlsResults} to display enhanced window "Markdown Style Buttons" acc view width accViewWidth acc view height theTop acc view controls allControls buttons theButtons initial position {100, 30} giving up after 50 with align cancel button

	set {_key, unused, hyperkey, shft, ctrl, opt, cmd, unused, unused} to controlsResults

	if buttonName = "Cancel" then return

	set str to ""
	if cmd then set str to str & "<kbd>⌘</kbd>"
	if opt then set str to str & "<kbd>⌥</kbd>"
	if ctrl then set str to str & "<kbd>⌃</kbd>"
	if shft then set str to str & "<kbd>⇧</kbd>"
	if hyperkey then set str to str & "<kbd>hyperkey</kbd>"
	set str to str & "<kbd>" & _key & "</kbd>"

	set the clipboard to str

	tell application "System Events"
		--set frontapp to bundle identifier of (first application whose frontmost is true)
		--activate application id frontapp
		delay 1
		keystroke "v" using {command down}
	end tell
on error errMsg number errNum
	if errNum ≠ -128 then
		display dialog errMsg & return & return & errNum buttons {"Cancel", "OK"} ¬
			default button "OK" with icon caution
	end if
end try

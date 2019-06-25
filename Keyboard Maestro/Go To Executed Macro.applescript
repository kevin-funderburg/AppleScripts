tell application "Keyboard Maestro"
	set sel to selection
	set a to first item of sel
	set _xml to a's xml
	tell application "System Events"
		set rec to value of (make property list item with properties {text:_xml})
	end tell
	editMacro rec's MacroUID
end tell
-- @ description
-- 1 shortcut to create from selection of keyboard
--
-- @params none
-- @return none
tell application "System Events"
	tell (first process whose frontmost is true)
		if (menu item "Copy" of menu 1 of menu bar item "Edit" of menu bar 1) is enabled then
			tell application "Typinator" to create from selection
		else
			tell application "Typinator" to create from clipboard
		end if
	end tell
	return false
end tell

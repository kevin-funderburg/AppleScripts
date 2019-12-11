tell application "Keyboard Maestro"
	set m to first macro whose selected is true
	set acts to m's actions
	repeat with a in acts
		if name of a contains "Pause for" or name of a contains "Type the" or name of a contains "Execute Macro" then
			if disclosed of a is true then set disclosed of a to false
		end if
	end repeat
end tell


use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

global allActions

set allActions to {}

tell application "Keyboard Maestro"
	set m to first macro whose selected is true
	set acts to a reference to m's actions
	my getAllActions(m's actions)
	repeat with a in allActions
		if a's name contains "Pause for" or ¬
			a's name contains "Type the" or ¬
			a's name contains "Notification" or ¬
			a's name contains "Cancel" or ¬
			a's name contains "Execute Macro" or ¬
			a's name contains "Paste from Named" or ¬
			a's name contains "Delete Past Clipboard" or ¬
			a's name contains "in the Menu" or ¬
			a's name contains "Set Variable" then
			
			if disclosed of a is true then set disclosed of a to false
			
		end if
	end repeat
end tell

# recursively get every action within macro
on getAllActions(actionList)
	local actionList
	tell application "Keyboard Maestro"
		
		if (class of actionList = list or ¬
			class of actionList = action list) ¬
			and (count of items of actionList) > 0 then
			
			repeat with act in actionList
				my getAllActions(act)
			end repeat
			
		else if class of actionList = case entry then
			
			if (count of actionList's actions) > 0 then
				my getAllActions(actionList's actions)
			end if
			
		else if class of actionList = action then
			
			set end of allActions to actionList
			
			-- groups
			try
				if (count of actionList's actions) > 0 then
					my getAllActions(actionList's actions)
				end if
			end try
			-- switch statements
			try
				if (count of actionList's case entries) > 0 then
					my getAllActions(actionList's case entries)
				end if
			end try
			--if then actions
			try
				if actionList's thenactions ≠ missing value then
					my getAllActions(actionList's thenactions's actions)
				end if
			end try
			-- if else actions
			try
				if actionList's elseactions ≠ missing value then
					my getAllActions(actionList's elseactions's actions)
				end if
			end try
			
		end if
		
	end tell
end getAllActions


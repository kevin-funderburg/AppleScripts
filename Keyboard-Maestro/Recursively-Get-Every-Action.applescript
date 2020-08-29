-- this subroutine will get every action of the front macro, even those nested
-- within control statements and groups

global allActions
set allActions to {}
tell application "Keyboard Maestro"
	set m to first macro whose selected is true
	my getAllActions(m's actions)
end tell

on getAllActions(actionList)
	local actionList
	tell application "Keyboard Maestro"
		get class of actionList
		if (class of actionList = list or ¬
			class of actionList = action list) and ¬
			(count of items of actionList) > 0 then
			
			repeat with act in actionList
				my getAllActions(act)
			end repeat
			
		else if class of actionList = case entry then
			
			if (count of actionList's actions) > 0 then
				my getAllActions(actionList's actions)
			end if
			
		else if class of actionList = action then
			
			--set end of allActions to actionList
			set end of allActions to a reference to contents of actionList
			
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


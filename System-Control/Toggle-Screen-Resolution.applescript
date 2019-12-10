tell application "Finder" to set theRes to bounds of window of desktop

tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.displays"
end tell

delay 1

tell application "System Events"
	tell process "System Preferences"
		set scaledButton to radio button 2 of radio group 1 of tab group 1 of window 1
		if value of scaledButton ≠ 1 then
			click scaledButton
			delay 0.5
		end if
		if item 3 of theRes = 1680 then
			set resButton to radio button 5 of radio group 1 of group 2 of tab group 1 of window 1
		else
			set resButton to radio button 4 of radio group 1 of group 2 of tab group 1 of window 1
		end if
		
		click resButton
	end tell
end tell

tell application "System Preferences" to quit


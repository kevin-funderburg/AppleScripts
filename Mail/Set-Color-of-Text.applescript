use kevinsLib : script "Kevin's Library"
-- If you don't have Keyboard Maestro, just duplicate this script for each color and
-- erase the next 2 lines and replace it with `set thecolor to [<color>]`
-- then put each script into ~/Library/Scripts/Applications/Mail and execute via
-- the Script Menu
tell application "Keyboard Maestro Engine" to set thecolor to getvariable "km__thecolor"
set thecolor to kevinsLib's transformText(thecolor, "capitalize")

using terms from application "Mail"

	tell application "Mail"
		try
			activate
			tell application "System Events"
				tell process "Mail"
					set applyRules to menu item "Apply Rules" of menu 1 of menu bar item "Message" of menu bar 1
				end tell
			end tell

			set sel to selection
			set theRule to first rule whose name is "Act-On Rule: Messages Text to " & thecolor
			set enabled of theRule to true

			repeat with m in sel
				set s to extract address from sender of m
				set background color of m to none
				tell theRule's rule condition 1 to set expression to s
				delay 0.05
				tell application "System Events"
					tell process "Mail" to click applyRules
				end tell
				delay 0.05
			end repeat

			tell application "System Events" to key code 125
			delay 0.5
			set enabled of theRule to false
		on error errMsg number errNum
			error errMsg number errNum
		end try
	end tell

end using terms from

tell application "Mail"
	tell inbox
		set ms to every message whose read status is false
		repeat with m in ms
			tell m
				set read status to true
			end tell
		end repeat
	end tell
end tell
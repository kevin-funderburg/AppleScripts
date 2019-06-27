try
	tell application "Safari"
		tell window 1
			close tab ((index of current tab) - 1)
		end tell
	end tell
on error
	beep
end try

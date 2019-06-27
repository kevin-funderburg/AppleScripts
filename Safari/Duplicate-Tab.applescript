tell application "Safari"
	tell front window
		set theURL to URL of current tab
		set current tab to make new tab with properties {URL:theURL}
	end tell
end tell

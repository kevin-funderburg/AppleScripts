-- @description
-- Used to see if a tab with the desired url is already open
-- if not it will open a new tab
set theURL to "https://play.hbonow.com/series"

--
tell application "Safari"
	set winList to every window
	set urlFound to false
	repeat with i from 1 to (count of winList)
		tell window i
			set URLs to URL of every tab
			if URLs contains theURL then
				repeat with n from 1 to (count of URLs)
					if item n of URLs is theURL then exit repeat
				end repeat
				set current tab to tab n
				set urlFound to true
				exit repeat
			end if
		end tell
	end repeat
	
	if urlFound is false then
		tell front window
			set current tab to make new tab at end of tabs with properties {URL:theURL}
		end tell
	else
		set index of window i to 1
	end if
	
end tell
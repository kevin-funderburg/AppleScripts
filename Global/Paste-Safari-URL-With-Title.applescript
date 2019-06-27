on run
	set strLinkHTML to ""
	
	tell application "Safari"
		tell front window
			tell current tab
				set strNameTabUrl to URL
				set lstNameTab to name
			end tell
		end tell
	end tell
	
	-- NAME AND URL AS HTML LINK
	if length of lstNameTab > 1 then
		set strLinkHTML to "<a href=\"" & strNameTabUrl & "\">" & lstNameTab & "</a>"
	end if
	
	-- REWRITTEN AS RTF AND COPIED TO THE CLIPBOARD
	set strCMD to "echo " & quoted form of strLinkHTML & " | textutil -format html -convert rtf -stdin -stdout | pbcopy -Prefer rtf"
	do shell script strCMD
end run

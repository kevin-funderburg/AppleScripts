use scripting additions
tell application "Mail"
	set selectedMessages to selection
	set theMessage to item 1 of selectedMessages
	set messageid to message id of theMessage
	set urlText to "message://" & "%3c" & messageid & "%3e"
end tell
set the clipboard to urlText

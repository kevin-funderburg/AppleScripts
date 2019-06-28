-- Set t to any folder you like, this script is set to `~/Library/Application Support/` but I the same script set up for:
--
-- ~/Dropbox, ~/Dropbox/School, ~/Dropbox/Library, ~/Dropbox/Library/Scripts, and many others
--
set t to ((path to application support from user domain) as string)

tell application "Finder"
	if (count of windows) = 0 then
		open thePath
	else
		tell front window to set target to thePath
	end if
end tell

use scripting additions
use bl : script "BetterTouchTool Library"
use kl : script "Kevin's Library"


property lastpath : missing value
property branch : missing value
property shellPath : "~/github/AppleScripts/BetterTouchTool/getGitBranch.sh"
property pythonpath : "~/Dropbox/Code/python/getGitStatus/getGitStatus.py"
property charlimit : 20

property symbolsTrig : missing value
property cdTrig : missing value
property cdUID : "3C0D3908-1947-422D-9830-E8A9EE77EF6E"
property gitSymbolsUID : "1BCA7AB3-5297-4414-B335-E6A71CCCD4EE"
property gitBranchUID : "37B03D28-3964-4451-B149-CD0D0F20DD46"

if symbolsTrig = missing value or cdTrig = missing value then setTrigs()

tell application "Finder"
	tell front window
		set currentPath to POSIX path of (target as alias)
	end tell
end tell

--set newname to makeNewName(currentPath)
set newname to do shell script "python3 " & pythonpath & " -n \"" & currentPath & "\""

log "INFO:		lastpath: " & lastpath
log "INFO:		currentpath: " & currentPath

if cdTrig's newJSON ≠ missing value then
	if cdTrig's newJSON's BTTTouchBarButtonName ≠ newname then
		renameCDtrig(newname)
	end if
else
	renameCDtrig(newname)
end if


if symbolsTrig's newJSON ≠ missing value then
	log "INFO:		symbols: " & symbolsTrig's newJSON's BTTTouchBarButtonName
	if currentPath = lastpath then
		return branch
	end if
end if

set lastpath to currentPath

if currentPath contains "Users/kevinfunderburg/Library" or ¬
	currentPath starts with "/Volumes" then
	hideSymbolsTrig()
	return branch
end if

set gitStatus to do shell script "sh " & shellPath & space & quoted form of currentPath

if gitStatus ≠ "false" then
	--set statSymbols to getStatusSymbols(gitStatus)
	set branch to do shell script "cd " & quoted form of currentPath & "; git rev-parse --abbrev-ref HEAD"
	set statSymbols to do shell script "python3 " & pythonpath & " -p \"" & currentPath & "\""
	
	tell symbolsTrig
		rename(statSymbols)
		_font()'s setColor("red")
		button()'s setColor("black")
		button()'s setVisible(true)
		update()
	end tell
	
else
	hideSymbolsTrig()
end if

return branch


on getStatusSymbols(gitStatus)
	
	set branch to paragraph 1 of gitStatus
	set stream to paragraph 2 of gitStatus
	
	set statSymbols to ""
	
	if stream = "ahead" then
		set statSymbols to "⇡"
	else if stream = "behind" then
		set statSymbols to "⇣"
	end if
	
	if (count of paragraphs of gitStatus) > 2 then
		set hash to {m:0, R:0, d:0, u:0}
		repeat with p in (paragraphs 3 thru -1 of gitStatus)
			if p contains "M" then set hash's m to (hash's m) + 1
			if p contains "R" then set hash's R to (hash's R) + 1
			if p contains "D" then set hash's d to (hash's d) + 1
			if p contains "?" then set hash's u to (hash's u) + 1
		end repeat
		if hash's m ≠ 0 then set statSymbols to statSymbols & "+"
		if hash's d ≠ 0 then set statSymbols to statSymbols & "x"
		if hash's R ≠ 0 then set statSymbols to statSymbols & "»"
		if hash's u ≠ 0 then set statSymbols to statSymbols & "?"
	end if
	
	if statSymbols ≠ "" then set statSymbols to "[" & statSymbols & "]"
	
	set lastStatSymbols to statSymbols
	
	return statSymbols
	
end getStatusSymbols

on makeNewName(_path)
	set itms to kl's split(_path, "/")
	if (count of itms) = 4 then return "~/"
	set abbreve to {"~"}
	repeat with n from 4 to (count of itms) - 2
		set i to item n of itms
		if (count of itms) > 5 then
			set end of abbreve to character 1 of i
		else
			set end of abbreve to i
		end if
	end repeat
	set abbreve to kl's join(abbreve, "/")
	if ((count of characters of abbreve) + (count of characters of (item -2 of itms))) > charlimit then
		set abbreve to abbreve & "/" & character 1 of item -2 of itms
	else
		set abbreve to abbreve & "/" & item -2 of itms
	end if
	return abbreve
end makeNewName

on renameCDtrig(newname)
	tell cdTrig
		rename(newname)
		update()
	end tell
end renameCDtrig

on setTrigs()
	set cdTrig to bl's trigger(cdUID)
	set symbolsTrig to bl's trigger(gitSymbolsUID)
end setTrigs

on hideSymbolsTrig()
	tell symbolsTrig
		button()'s setVisible(false)
		rename("")
		update()
	end tell
	set branch to ""
end hideSymbolsTrig


-- @Description
-- Performs basic JavaScript actions in Safari
-- @param - theAction: get, set, click, submit
-- @param - theType: id, class, etc
-- @param - id: the string associated with the object
-- @param - num: the index of the object
-- @param - theValue: value an object is to be set to (set to missing value by default)
-- @param - theTab: the tab the action is to be performed in
--
on doJava:theAction onType:theType withIdentifier:theID withElementNum:num withSetValue:theValue inTab:thetab
	if theType = "id" then
		set getBy to "getElementById"
		set theJavaEnd to ""
	else
		if theType = "class" then
			set theType to "ClassName"
		else if theType = "name" then
			set theType to "Name"
		else if theType = "tag" then
			set theType to "TagName"
		end if
		set getBy to "getElementsBy" & theType
		set theJavaEnd to "[" & num & "]"
	end if
	
	if theAction = "click" then
		set theJavaEnd to theJavaEnd & ".click();"
	else if theAction = "get" then
		set theJavaEnd to theJavaEnd & ".innerHTML;"
	else if theAction = "set" then
		set theJavaEnd to theJavaEnd & ".value ='" & theValue & "';"
	else if theAction = "submit" then
	else if theAction = "force" then
	end if
	
	set theJava to "document." & getBy & "('" & theID & "')" & theJavaEnd
	
	tell application "Safari"
		if thetab is missing value then set thetab to front document
		tell thetab
			if theAction = "get" then
				set input to do JavaScript theJava
				return input
			else
				do JavaScript theJava
			end if
		end tell
	end tell
	
end doJava:onType:withIdentifier:withElementNum:withSetValue:inTab:

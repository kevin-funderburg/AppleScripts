-- @description
-- Handlers for creating new Workflow script objects (mimics classes and constructors from OOP) to be used for developing Alfred 3 workflows
--
-- Authors: Ursan Razvan (original developer for Alfred 2, did most of the heavy lifting)
--          Kevin Funderburg - expanded for Alfred 4, added item object and JSON export
--
-- Revised: 02/22/20 
--
--
use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use scripting additions

property name : "Workflow"
property id : "com.kfunderburg.workflow"
property version : "1.1.0"

property NSString : a reference to current application's NSString

property ICON_PATH_BASE : "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/"

property ICON_ACCOUNTS : {|type|:"filepath", |path|:ICON_PATH_BASE & "Accounts.icns"}
property ICON_CAUTION : {|type|:"filepath", |path|:ICON_PATH_BASE & "AlertCautionIcon.icns"}
property ICON_ERROR : {|type|:"filepath", |path|:ICON_PATH_BASE & "AlertStopIcon.icns"}
property ICON_GENERIC_APP : {|type|:"filepath", |path|:ICON_PATH_BASE & "GenericApplicationIcon.icns"}
property ICON_INFO : {|type|:"filepath", |path|:ICON_PATH_BASE & "ToolbarInfo.icns"}

on newWorkflow()
	return my newWorkFlowWithBundle(missing value)
end newWorkflow


on newWorkFlowWithBundle(bundleid)
	script Workflow
		# the class name for AppleScript's internal use
		property class : "workflow"
		
		# class properties
		property _bundle : missing value
		property _cache : missing value
		property _data : missing value
		property _home : missing value
		property _localHash : missing value
		property _name : missing value
		property _path : missing value
		property _preferences : missing value
		property _results : missing value
		property |items| : missing value
		property _uuid : missing value
		
		on run
			set _bundle to (system attribute "alfred_workflow_bundleid")
			set _cache to (system attribute "alfred_workflow_cache")
			set _data to (system attribute "alfred_workflow_data")
			set _localHash to (system attribute "alfred_preferences_localhash")
			set _preferences to (system attribute "alfred_preferences")
			set _name to (system attribute "alfred_workflow_name")
			set _uuid to (system attribute "alfred_workflow_uid")
			set _version to (system attribute "alfred_version")
			set _versionBuild to (system attribute "alfred_version_build")
			
			# initialize the working folder
			set my _path to do shell script "pwd"
			if my _path does not end with "/" then set my _path to my _path & "/"
			
			# initialize the home folder
			set my _home to POSIX path of ((path to home folder) as alias)
			
			# create the path to the current Applescript's 'info.plist' file
			set _infoPlist to _path & "info.plist"
			
			# initialize the results list
			set my _results to {|items|:{}}
			
			# return this new script object
			return me
		end run
		
		on getPath()
			if my isEmpty(my _path) then return missing value
			
			return my _path
		end getPath
		
		on getHome()
			if my isEmpty(my _home) then return missing value
			
			return my _home
		end getHome
		on getResults()
			if my isEmpty(my _results) then return missing value
			
			return my _results
		end getResults
		on getUID()
			if my isEmpty(my _uuid) then return missing value
			
			return my _uuid
		end getUID
		on getName()
			if my isEmpty(my _name) then return missing value
			
			return my _name
		end getName
		on getPreferences()
			if my isEmpty(my _preferences) then return missing value
			
			return my _preferences
		end getPreferences
		on getBundleID()
			if my isEmpty(my _bundle) then return missing value
			
			return my _bundle
		end getBundleID
		on getData()
			if my isEmpty(my _data) then return missing value
			
			return _data
		end getData
		on getCache()
			if my isEmpty(my _cache) then return missing value
			
			return _cache
		end getCache
		on getVar(varName)
			if my isEmpty((system attribute varName)) then return missing value
			
			return (system attribute varName) as text
		end getVar
		
		on newItemWithUID:theuid arg:theArg title:theTitle subtitle:theSub icon:theIcon autocomplete:theAuto |type|:theType valid:isValid quicklookurl:theQuick |text|:theText
			
			script |item|
				property _uid : theuid
				property _arg : theArg
				property _title : theTitle
				property _subtitle : theSub
				property _icon : theIcon
				property _autocomplete : theAuto
				property _type : theType
				property _valid : isValid
				property _quicklookurl : theQuick
				property _text : theText
				property _variables : missing value
				property _mods : missing value
				property |record| : missing value
				
				on run
					if isEmpty(_type) then set _type to "default"
					set |record| to {}
					set _variables to {}
					set _mods to {}
					return me
				end run
				
				on addMod:|name| valid:_valid arg:_arg subtitle:_subtitle
					set rec to {valid:_valid, arg:_arg, subtitle:_subtitle}
					if |name| = "cmd" then
						set _mods to _mods & {cmd:rec}
					else if |name| = "alt" then
						set _mods to _mods & {alt:rec}
					else if |name| = "ctrl" then
						set _mods to _mods & {ctrl:rec}
					else if |name| = "shift" then
						set _mods to _mods & {shift:rec}
					else if |name| = "fn" then
						set _mods to _mods & {fn:rec}
					else
						error |name| & " is not a valid mod key"
					end if
				end addMod:valid:arg:subtitle:
				
				on addVar:_name varValue:_value
					set varRecord to makeVarRecord(_name, _value)
					set _variables to _variables & varRecord
				end addVar:varValue:
				
				on makeVarRecord(varName, varVal)
					set varJSONstring to "[{\"" & varName & "\" : \"" & varVal & "\",}]"
					return my convertJSONToAS:(varJSONstring) isPath:false
				end makeVarRecord
				
				on setIcon:_type thePath:_path
					set _icon to {|type|:_type, |path|:_path}
				end setIcon:thePath:
				
				on addItem()
					set |record| to {arg:_arg, title:_title, subtitle:_subtitle, icon:_icon, |type|:_type, valid:_valid}
					if not isEmpty(_uid) then catRecord({uid:_uid})
					if not isEmpty(_mods) then catRecord({mods:_mods})
					if not isEmpty(_variables) then catRecord({variables:_variables})
					if not isEmpty(_text) then catRecord({|text|:_text})
					if not isEmpty(_quicklookurl) then catRecord({quicklookurl:_quicklookurl})
					if not isEmpty(_autocomplete) then catRecord({autocomplete:_autocomplete})
					set end of (my _results's |items|) to |record|
				end addItem
				
				on catRecord(rec)
					set |record| to |record| & rec
				end catRecord
				
			end script
			
			run |item|
		end newItemWithUID:arg:title:subtitle:icon:autocomplete:|type|:valid:quicklookurl:|text|:
		
		
		on wftoJSON()
			return my toJSON(_results)
		end wftoJSON
		
	end script
	
	# run the 'constructor' and return the new Workflow script object
	tell Workflow to run
	
end newWorkFlowWithBundle

on toJSON(str)
	--convert to JSON data
	set {theData, theError} to current application's NSJSONSerialization's dataWithJSONObject:str options:0 |error|:(reference)
	if theData is missing value then error (theError's localizedDescription() as text) number -10000
	-- convert data to a UTF8 string
	set someString to current application's NSString's alloc()'s initWithData:theData encoding:(current application's NSUTF8StringEncoding)
	return someString as text
end toJSON

-- pass either a POSIX path to the JSON file, or a JSON string; isPath is a boolean value to tell which
on convertJSONToAS:jsonStringOrPath isPath:isPath
	if isPath then -- read file as data
		set theData to current application's NSData's dataWithContentsOfFile:jsonStringOrPath
	else -- it's a string, convert to data
		set aString to current application's NSString's stringWithString:jsonStringOrPath
		set theData to aString's dataUsingEncoding:(current application's NSUTF8StringEncoding)
	end if
	-- convert to Cocoa object
	set {theThing, theError} to current application's NSJSONSerialization's JSONObjectWithData:theData options:0 |error|:(reference)
	if theThing is missing value then error (theError's localizedDescription() as text) number -10000
	-- we don't know the class of theThing for coercion, so...
	set listOfThing to current application's NSArray's arrayWithObject:theThing
	return item 1 of (theThing as list)
end convertJSONToAS:isPath:


on isEmpty(str)
	if str is missing value then return true
	return length of (my q_trim(str)) is 0
end isEmpty

on q_join(l, delim)
	if class of l is not list or l is missing value then return ""
	repeat with i from 1 to length of l
		if item i of l is missing value then
			set item i of l to ""
		end if
	end repeat
	set oldDelims to AppleScript's text item delimiters
	set AppleScript's text item delimiters to delim
	set output to l as text
	set AppleScript's text item delimiters to oldDelims
	return output
end q_join
on q_split(s, delim)
	set oldDelims to AppleScript's text item delimiters
	set AppleScript's text item delimiters to delim
	set output to text items of s
	set AppleScript's text item delimiters to oldDelims
	return output
end q_split
on q_file_exists(theFile)
	if my q_path_exists(theFile) then
		tell application "System Events"
			return (class of (disk item theFile) is file)
		end tell
	end if
	return false
end q_file_exists
on q_folder_exists(theFolder)
	if my q_path_exists(theFolder) then
		tell application "System Events"
			return (class of (disk item theFolder) is folder)
		end tell
	end if
	return false
end q_folder_exists
on q_path_exists(thePath)
	if thePath is missing value or my q_is_empty(thePath) then return false
	try
		if class of thePath is alias then return true
		if thePath contains ":" then
			alias thePath
			return true
		else if thePath contains "/" then
			POSIX file thePath as alias
			return true
		else
			return false
		end if
	on error msg
		return false
	end try
end q_path_exists
on q_is_empty(str)
	if str is missing value then return true
	return length of (my q_trim(str)) is 0
end q_is_empty
on q_trim(str)
	if class of str is not text or class of str is not string or str is missing value then return str
	if str is "" then return str
	repeat while str begins with " "
		try
			set str to items 2 thru -1 of str as text
		on error msg
			return ""
		end try
	end repeat
	repeat while str ends with " "
		try
			set str to items 1 thru -2 of str as text
		on error
			return ""
		end try
	end repeat
	return str
end q_trim
on q_clean_list(lst)
	if lst is missing value or class of lst is not list then return lst
	set l to {}
	repeat with lRef in lst
		set i to contents of lRef
		if i is not missing value then
			if class of i is not list then
				set end of l to i
			else if class of i is list then
				set end of l to my q_clean_list(i)
			end if
		end if
	end repeat
	return l
end q_clean_list
on q_encode(str)
	if class of str is not text or my q_is_empty(str) then return str
	set s to ""
	repeat with sRef in str
		set c to contents of sRef
		if c is in {"&", "'", "\"", "<", ">", tab} then
			if c is "&" then
				set s to s & "&amp;"
			else if c is "'" then
				set s to s & "&apos;"
			else if c is "\"" then
				set s to s & "&quot;"
			else if c is "<" then
				set s to s & "&lt;"
			else if c is ">" then
				set s to s & "&gt;"
			else if c is tab then
				set s to s & "&#009;"
			end if
		else
			set s to s & c
		end if
	end repeat
	return s
end q_encode
on q_date_to_unixdate(theDate)
	set {day:d, year:y, time:t} to theDate
	copy theDate to b
	set b's month to January
	set m to (b - 2500000 - theDate) div -2500000
	tell (y * 10000 + m * 100 + d) as text
		set UnixDate to text 5 thru 6 & "/" & text 7 thru 8 & "/" & text 1 thru 4
	end tell
	set h24 to t div hours
	set h12 to (h24 + 11) mod 12 + 1
	if (h12 = h24) then
		set ampm to " AM"
	else
		set ampm to " PM"
	end if
	set min to t mod hours div minutes
	set s to t mod minutes
	tell (1000000 + h12 * 10000 + min * 100 + s) as text
		set UnixTime to text 2 thru 3 & ":" & text 4 thru 5 & ":" & text 6 thru 7 & ampm
	end tell
	return UnixDate & " " & UnixTime
end q_date_to_unixdate
on q_unixdate_to_date(theUnixDate)
	return date theUnixDate
end q_unixdate_to_date
on q_timestamp_to_date(timestamp)
	if length of timestamp = 13 then
		set timestamp to characters 1 thru -4 of timestamp as text
	end if
	set h to do shell script "date -r " & timestamp & " \"+%Y %m %d %H %M %S\""
	set mydate to current date
	set year of mydate to (word 1 of h as integer)
	set month of mydate to (word 2 of h as integer)
	set day of mydate to (word 3 of h as integer)
	set hours of mydate to (word 4 of h as integer)
	set minutes of mydate to (word 5 of h as integer)
	set seconds of mydate to (word 6 of h as integer)
	return mydate
end q_timestamp_to_date
on q_date_to_timestamp(theDate)
	return ((current date) - (date ("1/1/1970")) - (time to GMT)) as miles as text
end q_date_to_timestamp
on q_send_notification(theMessage, theDetails, theExtra)
	set _path to do shell script "pwd"
	if _path does not end with "/" then set _path to _path & "/"
	if theMessage is missing value then set theMessage to ""
	if theDetails is missing value then set theDetails to ""
	if theExtra is missing value then set theExtra to ""
	if my q_trim(theMessage) is "" and my q_trim(theExtra) is "" then set theMessage to "notification"
	try
		do shell script (quoted form of _path & "bin/q_notifier.helper com.runningwithcrayons.Alfred-2 " & quoted form of theMessage & " " & quoted form of theDetails & " " & quoted form of theExtra)
	end try
end q_send_notification
on q_notify()
	my q_send_notification("", "", "")
end q_notify
on q_encode_url(str)
	local str
	try
		return (do shell script "/bin/echo " & quoted form of str & ¬
			" | perl -MURI::Escape -lne 'print uri_escape($_)'")
	on error
		return missing value
	end try
end q_encode_url
on q_decode_url(str)
	local str
	try
		return (do shell script "/bin/echo " & quoted form of str & ¬
			" | perl -MURI::Escape -lne 'print uri_unescape($_)'")
	on error
		return missing value
	end try
end q_decode_url

on SearchandReplace(sourceText, replaceThis, withThat)
	set theString to NSString's stringWithString:sourceText
	set theString to theString's stringByReplacingOccurrencesOfString:replaceThis withString:withThat
	return theString as text
end SearchandReplace

on SearchWithRegEx(thePattern, theString, n)
	set theNSString to NSString's stringWithString:theString
	set theOptions to ((current application's NSRegularExpressionDotMatchesLineSeparators) as integer) + ((current application's NSRegularExpressionAnchorsMatchLines) as integer)
	set theRegEx to current application's NSRegularExpression's regularExpressionWithPattern:thePattern options:theOptions |error|:(missing value)
	set theFinds to theRegEx's matchesInString:theNSString options:0 range:{location:0, |length|:theNSString's |length|()}
	set theResult to {} -- we will add to this
	repeat with i from 1 to count of items of theFinds
		set oneFind to (item i of theFinds)
		if (oneFind's numberOfRanges()) as integer < (n + 1) then
			set end of theResult to missing value
		else
			set theRange to (oneFind's rangeAtIndex:n)
			set end of theResult to (theNSString's substringWithRange:theRange) as string
		end if
	end repeat
	return theResult
end SearchWithRegEx

on readPlistFromString(xmlstring)
	tell application "System Events"
		return value of (make property list item with properties {text:xmlstring})
	end tell
end readPlistFromString

on readPlistFromPath:thePath
	set thePath to current application's NSString's stringWithString:thePath
	set thePath to thePath's stringByExpandingTildeInPath()
	set theDict to current application's NSDictionary's dictionaryWithContentsOfFile:thePath
	return theDict as record
end readPlistFromPath:


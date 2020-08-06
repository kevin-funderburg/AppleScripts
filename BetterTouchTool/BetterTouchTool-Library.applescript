(*
===============================================================================
                           BetterTouchTool Library
===============================================================================

Version: 1.0                                 Updated: 5/27/20, 5:23:56 AM
By: Kevin Funderburg

PURPOSE:

This library provides several useful editor functions for BetterTouchTool.
• View the GitHub page for explanations and examples
	- https://github.com/kevin-funderburg/AppleScripts/tree/master/BetterTouchTool

REQUIRED:
	1.    Mac OS X Yosemite 10.10.5+
	2.    Mac Applications
				• BetterTouchTool - https://folivora.ai/

	3.    EXTERNAL OSAX Additions/LIBRARIES/FUNCTIONS
                • None

VERSION HISTORY:
1.0.0 - Initial version.
1.0.1 - Added newJSON property and update() to allow 1 update_trigger
        command to BTT instead of 1 per function, much faster.
1.0.2 - Changed parameters to be key-value pairs rather than AppleScript
        records to allow for more mutability for trigger objects.
===============================================================================
*)
use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions
use framework "Foundation"

property name : "BetterTouchTool Library"
property id : "com.kfunderburg.library.betterTouchToolLibrary"
property version : "1.0.1"

-- classes, constants, and enums used
property NSJSONSerialization : a reference to current application's NSJSONSerialization
property NSString : a reference to current application's NSString
property ca : a reference to current application

-- modifier key values
property mods : {¬
	{name:"cmd", symbol:"⌘", value:1048576}, ¬
	{name:"opt", symbol:"⌥", value:524288}, ¬
	{name:"ctrl", symbol:"⌃", value:262144}, ¬
	{name:"shft", symbol:"⇧", value:131072}, ¬
	{name:"fn", symbol:"Fn", value:8388608} ¬
		}

-- hex values of colors commonly used
property _colors : {¬
	{name:"black", value:"0.000000, 0.000000, 0.000000, 255.000000"}, ¬
	{name:"blue", value:"10.000000, 132.000000, 255.000000, 255.000000"}, ¬
	{name:"def_background", value:"75.323769, 75.323769, 75.323769, 255.000000"}, ¬
	{name:"red", value:"255.000000, 38.028511, 0.000000, 255.000000"}, ¬
	{name:"red_transparent", value:"255.000000, 96.000002, 94.000002, 102.000000"}, ¬
	{name:"spring", value:"0.000000, 249.085161, 0.000000, 255.000000"}, ¬
	{name:"white", value:"255.000000, 255.000000, 255.000000, 255.000000"}, ¬
	{name:"lemon", value:"254.853130, 251.316189, 0.000000, 255.000000"} ¬
		}

-- value of common BTT actions
property _actions : {¬
	{name:"AppleScript (async)", value:195}, ¬
	{name:"AppleScript (blocking)", value:172}, ¬
	{name:"Close currently open Touch Bar group", value:191}, ¬
	{name:"Select Menu Item", value:124}, ¬
	{name:"Toggle BetterTouchTool Touch Bar", value:188} ¬
		}

-- @description
-- constructor for trigger
--
on trigger(_uid)
	script trigger
		property class : "trigger"
		property parent : script "BetterTouchTool Library"
		property uid : _uid
		property json : missing value
		property newJSON : missing value
		
		on run
			if isEmpty(_uid) then
				set json to getTrigger(copyUUID())
				set uid to json's BTTUUID
			end if
			return me
		end run
		
		-- @description
		-- get JSON of currently selected trigger
		--
		on copyUUID()
			try
				set the clipboard to ""
				delay 0.1
				tell application "System Events"
					tell process "BetterTouchTool"
						keystroke "c" using {command down, shift down}
					end tell
				end tell
				delay 0.1
				if (the clipboard) = "" then error number -1000
				return the clipboard
			on error errMsg number errNum
				if errNum = -1000 then
					display notification ("Select a trigger and try again") ¬
						with title ("Error: Invalid selection") ¬
						subtitle ("A trigger must be selected") ¬
						sound name "Basso"
				else
					display dialog (errMsg & return & return & errNum) ¬
						buttons {"Cancel", "OK"} ¬
						default button ("OK") ¬
						with icon caution
				end if
			end try
		end copyUUID
		
		-- @return modifier key value of JSON
		--
		on getModKeys()
			try
				return json's BTTRequiredModifierKeys
			on error
				log "no BTTRequiredModifierKeys"
				return 0
			end try
		end getModKeys
		
		-- @description
		-- set the modifier keys required for a trigger
		--
		-- @param _mod - modifier key to add: cmd, opt, ctrl, shft, fn, or clear
		--
		on setModKey(_mod)
			set modSum to getModKeys()
			
			log "modSum before: " & modSum
			if _mod = "clear" then
				set modSum to 0
			else
				repeat with m in mods
					if m's name = _mod then
						set modSum to modSum + (m's value)
						exit repeat
					end if
				end repeat
			end if
			setNewJSON({"BTTRequiredModifierKeys", modSum})
		end setModKey
		
		on radius()
			script radius
				property radius : missing value
				property parent : my trigger
				
				on run
					try
						set radius to json's BTTTriggerConfig's BTTTouchBarButtonCornerRadius
					on error
						set radius to 6 -- default radius
					end try
					return me
				end run
				
				-- @description
				-- decrement radius by 1
				--
				on decrement()
					setTo(radius - 1)
				end decrement
				
				-- @description
				-- increment radius by 1
				--
				on increment()
					setTo(radius + 1)
				end increment
				
				-- @description
				-- set radius to value
				--
				-- @param n - value to set radius to
				--
				on setTo(n)
					updateConfig({"BTTTouchBarButtonCornerRadius", n})
					display notification "new corner radius: " & n with title "Set Radius"
				end setTo
				
				-- @description
				-- apply radius to left, all or right edges of button
				--
				-- @param side - left, right or all
				--
				on apply(side)
					if side = "left" then
						set n to 1
					else if side = "right" then
						set n to 2
					else if side = "all" then
						set n to 0
					else
						error "invalid side choice: " & side
					end if
					updateConfig({"BTTTouchBarApplyCornerRadiusTo", n})
				end apply
				
			end script
			run radius
		end radius
		
		on freeSpace()
			script freeSpace
				property freeSpace : missing value
				property parent : my trigger
				
				on run
					try
						set freeSpace to json's BTTTriggerConfig's BTTTouchBarFreeSpaceAfterButton
					on error
						log "No freespace variable in JSON"
						set freeSpace to 5 -- default free space
					end try
					return me
				end run
				
				-- @description
				-- decrement free space after trigger by 1
				--
				on increment()
					setTo(freeSpace + 1)
				end increment
				
				-- @description
				-- increment free space after trigger by 1
				--
				on decrement()
					setTo(freeSpace - 1)
				end decrement
				
				-- @description
				-- set free space of trigger to desired value
				--
				-- @param n - free space value
				--
				on setTo(n)
					updateConfig({"BTTTouchBarFreeSpaceAfterButton", n})
					display notification "new freespace: " & n with title "Set Freespace"
				end setTo
				
			end script
			run freeSpace
		end freeSpace
		
		on padding()
			script padding
				property padding : missing value
				property parent : my trigger
				
				on run
					try
						set padding to json's BTTTriggerConfig's BTTTouchBarItemPadding
					on error
						set padding to 0 -- default padding
					end try
					return me
				end run
				
				-- @description
				-- increment trigger's padding by 1
				--
				on increment()
					setTo(padding + 1)
				end increment
				
				-- @description
				-- decrement trigger's padding by 1
				--
				on decrement()
					setTo(padding - 1)
				end decrement
				
				-- @description
				-- set trigger's padding to desired value
				--
				-- @param n - padding value
				--
				on setTo(n)
					updateConfig({"BTTTouchBarItemPadding", n})
					display notification "new padding: " & n with title "Set Padding"
				end setTo
			end script
			run padding
		end padding
		
		on button()
			script button
				property parent : my trigger
				
				-- @description
				-- set color of button's background
				--
				-- @param _color - name of color
				--
				on setColor(clr)
					updateConfig({"BTTTouchBarButtonColor", (getColor(clr))})
				end setColor
				
				-- @description
				-- set size of button's icon
				-- NOTE: heigth and width are set to same value
				--
				-- @param _size - size of icon
				--
				on setIconSize(_size)
					updateConfig({"BTTTouchBarItemIconWidth", _size}, {"BTTTouchBarItemIconHeight", _size})
					display notification "new icon size: " & _size with title "Set Icon Size"
				end setIconSize
				
				-- @description
				-- set placement of trigger in touch bar
				--
				-- @param placement - center, left or right
				--
				on placement(placement)
					if placement = "center" then
						set p to 0
					else if placement = "left" then
						set p to 1
					else if placement = "right" then
						set p to 2
					else
						error "invalid placement option: " & placement
					end if
					updateConfig({"BTTTouchBarItemPlacement", p})
				end placement
				
				-- @description
				-- sets a trigger's visibility
				--
				-- @param visibility - true, false, or toggle
				-- 
				on setVisible(visibility)
					if visibility = true then
						set n to 1
					else if visibility = false then
						set n to 0
					else if visibility = "toggle" then
						set json to getTrigger(_uid)
						if json's BTTEnabled2 = 0 then
							set n to 1
						else
							set n to 0
						end if
					end if
					setNewJSON({"BTTEnabled2", n})
				end setVisible
				
				on toggleIconOnly()
					try
						if json's BTTTriggerConfig's BTTTouchBarOnlyShowIcon then
							set n to false
						else
							set n to true
						end if
					on error
						set n to true
					end try
					
					updateConfig({"BTTTouchBarOnlyShowIcon", n})
				end toggleIconOnly
				
			end script
		end button
		
		on _font()
			script _font
				property parent : my trigger
				
				-- @description
				-- set size of trigger's font
				--
				-- @param _size - size of font
				--
				on setSize(_size)
					updateConfig({"BTTTouchBarButtonFontSize", _size})
				end setSize
				
				-- @description
				-- set color of trigger's font
				--
				-- @param _color - name of color
				--
				on setColor(clr)
					updateConfig({"BTTTouchBarFontColor", (getColor(clr))})
				end setColor
			end script
		end _font
		
		-- @description
		-- Set the script of a trigger's AppleScript action
		--
		-- @param _script - AppleScript text to insert
		--
		on setInlineAppleScript(_script)
			setNewJSON({"BTTInlineAppleScript", _script})
		end setInlineAppleScript
		
		-- @description
		-- add an action to a trigger
		-- NOTE: not all actions are included, I've only included ones
		-- that I use frequently
		--
		-- @param act - action to insert
		--
		on addAction(act)
			setNewJSON(getAction(act))
		end addAction
		
		-- @description
		-- Rename a trigger
		--
		-- @param _name - new name
		--
		on rename(_name)
			setNewJSON({"BTTTouchBarButtonName", _name})
		end rename
		
		on setNewJSON(update)
			set newJSON to its setValue:(item 2 of update) forKey:(item 1 of update) inRecord:newJSON
		end setNewJSON
		
		-- @description
		-- update a trigger's JSON configuration
		--
		-- @param update - List of key-value pairs, can be a list of lists of key-value pairs too
		--
		on updateConfig(update)
			if class of item 1 of update = list then
				repeat with u in update
					updateConfig(u)
				end repeat
			else
				try
					set newJSON's BTTTriggerConfig to its setValue:(item 2 of update) forKey:(item 1 of update) inRecord:(newJSON's BTTTriggerConfig)
				on error errMsg number errNum
					set update to its recordFromLabels:{(item 1 of update)} andValues:{(item 2 of update)}
					setNewJSON({"BTTTriggerConfig", update})
				end try
			end if
		end updateConfig
		
		-- @description
		-- update trigger's JSON
		--
		on update()
			tell application "BetterTouchTool" to update_trigger uid json my toJSON(newJSON)
		end update
		
	end script
	run trigger
end trigger

-- @param act - name of action
-- @return value of action
--
on getAction(act)
	repeat with a in _actions
		if a's name = act then return {"BTTPredefinedActionType", a's value}
	end repeat
	error "Invalid action: " & act
end getAction

-- @param clr - name of color
-- @return hex value of color
--
on getColor(clr)
	repeat with c in _colors
		if c's name = clr then return c's value
	end repeat
	error "Invalid color: " & clr
end getColor

on updateTBwidget:uid withText:_text iconPath:icPath iconData:icData backgroundColor:bgcolor
	tell application "BetterTouchTool" to update_touch_bar_widget uid ¬
		text _text icon_path icPath icon_data icData background_color getColor(bgcolor)
end updateTBwidget:withText:iconPath:iconData:backgroundColor:

on refreshWidget(uid)
	tell application "BetterTouchTool" to refresh_widget uid
end refreshWidget

on getActiveTBgroup()
	tell application "BetterTouchTool" to return get_active_touch_bar_group
end getActiveTBgroup

on triggerAction(act)
	if isEmpty(act) then error "Invalid action: " & act
	tell application "BetterTouchTool" to trigger_action my toJSON(my getAction(act))
end triggerAction

on getVar(var, _class)
	if not isEmpty(var) then
		tell application "BetterTouchTool"
			if _class = string or _class = text or _class = boolean then
				set var to get_string_variable var
				if var = "true" then return true
				if var = "false" then return false
				return var
			else if _class = number or _class = integer or _class = real then
				return get_number_variable var
			else
				error "_class is not a valid class"
			end if
		end tell
	end if
	error "invalid var: var is empty"
end getVar

on setVar:var toVal:_val persist:_persist
	if not isEmpty(var) then
		tell application "BetterTouchTool"
			if class of _val = string or class of _val = boolean then
				if _persist then
					set _result to set_persistent_string_variable var to _val
				else
					set _result to set_string_variable var to _val
				end if
			else if class of _val = number or class of _val = integer or class of _val = real then
				if _persist then
					set _result to set_persistent_number_variable var to _val
				else
					set _result to set_number_variable var to _val
				end if
			else
				error "_class is not a valid class"
			end if
		end tell
		if _result ≠ "success" then error "error: variable " & var & " was not set"
	end if
end setVar:toVal:persist:

on executeTrigger(uid)
	set uid to checkUUID(uid)
	tell application "BetterTouchTool" to execute_assigned_actions_for_trigger uid
end executeTrigger

on toggleVar(var)
	set v to getVar(var, text)
	if v = "true" then
		my setVar:var toVal:false persist:true
	else
		my setVar:var toVal:true persist:true
	end if
end toggleVar

on getTrigger(uid)
	-- this is a useful function of BTT to get the JSON of a particular trigger,
	-- but it will slow down performance dramatically if called multiple times.
	-- Use sparingly.
	tell application "BetterTouchTool" to set json to get_trigger uid
	return my convertJSONToAS:json isPath:false
end getTrigger

--==========================================================
--» Helper Functions
--==========================================================

-- checks if a value is empty
on isEmpty(str)
	if str is missing value then return true
	return length of str is 0
end isEmpty

-- replace text of string
on SearchandReplace(sourceText, replaceThis, withThat)
	set theString to NSString's stringWithString:sourceText
	set theString to theString's stringByReplacingOccurrencesOfString:replaceThis withString:withThat
	return theString as text
end SearchandReplace

-- pass either a POSIX path to the JSON file, or a JSON string; isPath is a boolean value to tell which
on convertJSONToAS:jsonStringOrPath isPath:isPath
	if isPath then -- read file as data
		set theData to ca's NSData's dataWithContentsOfFile:jsonStringOrPath
	else -- it's a string, convert to data
		set aString to NSString's stringWithString:jsonStringOrPath
		set theData to aString's dataUsingEncoding:(ca's NSUTF8StringEncoding)
	end if
	-- convert to Cocoa object
	set {theThing, theError} to NSJSONSerialization's JSONObjectWithData:theData options:0 |error|:(reference)
	if theThing is missing value then error (theError's localizedDescription() as text) number -10000
	-- we don't know the class of theThing for coercion, so...
	set listOfThing to ca's NSArray's arrayWithObject:theThing
	return item 1 of (theThing as list)
end convertJSONToAS:isPath:

on toJSON(str)
	--convert to JSON data
	set {theData, theError} to NSJSONSerialization's dataWithJSONObject:str options:0 |error|:(reference)
	if theData is missing value then error (theError's localizedDescription() as text) number -10000
	-- convert data to a UTF8 string
	set someString to NSString's alloc()'s initWithData:theData encoding:(ca's NSUTF8StringEncoding)
	return someString as text
end toJSON

on recordFromLabels:labels andValues:values
	set theResult to ca's NSDictionary's dictionaryWithObjects:values forKeys:labels
	return theResult as record
end recordFromLabels:andValues:

on setValue:val forKey:_key inRecord:rec
	set theDict to ca's NSMutableDictionary's dictionaryWithDictionary:rec
	theDict's setValue:val forKey:_key
	return theDict as record
end setValue:forKey:inRecord:

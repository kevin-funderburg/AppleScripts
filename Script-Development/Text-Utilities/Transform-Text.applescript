-- @description
-- transform case of text
--
-- @param $inString - text to be transformed
-- @param $caseIndicator - upper, lower or capitalized
-- @return - transformed text
--
on transformText(inString, caseIndicator)
	-- create a Cocoa string from the passed text, by calling the NSString class method stringWithString:
	set the sourceString to current application's NSString's stringWithString:inString
	-- apply the indicated transformation to the Cocoa string
	if the caseIndicator is "upper" then
		set the adjustedString to sourceString's uppercaseString()
	else if the caseIndicator is "lower" then
		set the adjustedString to sourceString's lowercaseString()
	else
		set the adjustedString to sourceString's capitalizedString()
	end if
	-- convert from Cocoa string to AppleScript text
	return (adjustedString as text)
end transformText

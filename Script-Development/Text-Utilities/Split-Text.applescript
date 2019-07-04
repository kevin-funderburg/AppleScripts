-- @description
-- split a string by a character
--
-- @param $theString - string to split
-- @param $theSeparator - character defining the split
-- @return - text between separator as list of items
--
on split(theString, theSeparator)
	set saveTID to AppleScript's text item delimiters
	set AppleScript's text item delimiters to theSeparator
	set theResult to text items of theString
	set AppleScript's text item delimiters to saveTID
	return theResult
end split

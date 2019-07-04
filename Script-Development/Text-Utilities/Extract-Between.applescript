-- @description
-- extract text between 2 strings
--
-- @param $SearchText - whole search string
-- @param $startText - string before desired string
-- @param $endText - string after desired string
-- @return - string between startText & endText
--
on extractBetween(SearchText, startText, endText)
	set tid to AppleScript's text item delimiters
	set AppleScript's text item delimiters to startText
	set endItems to text of text item -1 of SearchText
	set AppleScript's text item delimiters to endText
	set beginningToEnd to text of text item 1 of endItems
	return beginningToEnd
	set AppleScript's text item delimiters to tid
end extractBetween

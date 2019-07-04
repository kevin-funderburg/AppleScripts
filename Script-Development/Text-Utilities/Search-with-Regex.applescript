-- @description
-- search text using regular expression
--
-- @param $thePattern - regex pattern
-- @param $theString - string to be searcched
-- @param $n - capturing group
-- @return - search result
--
on SearchWithRegEx(thePattern, theString, n)
	set theNSString to current application's NSString's stringWithString:theString
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

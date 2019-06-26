(*
===============================================================================
                    Insert Dynamic Handler Description
===============================================================================

Version: 1.0                                     Updated: 05/16/19 19:31:26 CST
By: Kevin Funderburg

PURPOSE:

To insert a handler description at the beginning of the handler currently
selected. The description will inserted by creating a Script Debugger clipping
dynamically with the handler's name and parameters. 

NOTE:

• You will probably need to update the clipPath variable to the default path
for the User's clipping folder in Script Debugger (comments explain)

VERSION HISTORY:
1.0 - Initial version.
===============================================================================
*)
use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

on run
	
	-- I keep my clippings in Dropbox and use an alias in the default folder so you will probably want to change this line to 
	-- set clipPath to "~/Library/Application\\ Support/Script\\ Debugger\\ 7/Clippings/Comments/handler\\ description.txt"
	set clipPath to "~/Dropbox/Library/Application\\ Support/Script\\ Debugger\\ 7/Clippings/Comments/handler\\ description.txt"
	
	do shell script "touch " & clipPath
	
	tell application "Script Debugger"
		tell document 1
			set {theLocation, theRange} to (get character range of selection)
			set sourceText to source text
			set endOfSelection to theLocation + theRange
			
			set ps to count of paragraphs of sourceText
			set currentLine to 1
			set currentHandler to missing value
			
			set lineCount to 0
			set charCount to 0
			repeat with x from 1 to count of paragraphs of sourceText
				considering white space
					set charCount to charCount + (count of characters of paragraph x of sourceText) + 1
					if charCount < theLocation then
						if paragraph x of sourceText begins with "on " then
							set currentHandler to paragraph x of sourceText as text
							
							set insertion to charCount - (count of characters of paragraph x of sourceText)
							set newSelection to {insertion, count of characters of paragraph x of sourceText}
						end if
					else
						exit repeat
					end if
				end considering
			end repeat
			
			# Move cursor to beginning of handler
			set selection to {insertion, 0}
			
			if currentHandler is missing value then set currentHandler to "run"
			
			# get the name of handler
			set tid to AppleScript's text item delimiters
			set AppleScript's text item delimiters to "on "
			set endItems to text of text item -1 of currentHandler
			set AppleScript's text item delimiters to "("
			set beginningToEnd to text of text item 1 of endItems
			set AppleScript's text item delimiters to tid
			set currentHandler to beginningToEnd
			
			# make the handler description template
			set handlerDescrip to "-- @description" & return & "-- [[template:description]]" & return & "--" & return
			set theHandler to first script handler whose name is currentHandler
			tell theHandler
				repeat with i in handler parameters
					set handlerDescrip to handlerDescrip & "-- @param $" & name of i & " - [[template:description]]" & return
				end repeat
			end tell
			set handlerDescrip to handlerDescrip & "--" & return
			
			# Write new handler description template to the clipping
			do shell script "echo " & quoted form of handlerDescrip & " > " & clipPath
			
			# Click the clipping in the menu bar to insert it
			tell application "System Events"
				tell process "Script Debugger"
					click (first menu item of menu 1 of menu item 2 of menu 1 of menu bar item 10 of menu bar 1 whose name is "handler description")
				end tell
			end tell
			
		end tell
	end tell
end run


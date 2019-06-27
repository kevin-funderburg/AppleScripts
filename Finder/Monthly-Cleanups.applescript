(*
===============================================================================
                                Monthly Cleanup
===============================================================================

Version: 1.10                                    Updated: 05/15/19 21:48:10 CST
By: Kevin Funderburg

PURPOSE:

- Clean up old files in ~/Downloads or ~/Desktop by consolodating files
> 2 weeks old into a folder with the current month and year, then consolodate 
that folder into a "Cleanups" folder.
- I've used this method for years to keep these folders tidy and I love it.

Example: ~/Downloads/Cleanups/05.19 - Monthly Cleanup/[old files] 
         ~/Desktop/Cleanups/05.19 - Monthly Cleanup/[old files] 

TO EXECUTE:
Can be called by a shell script with the folder that needs to be cleaned like
so: 
osascript 'Monthly Cleanups.scpt' "Desktop"

VERSION HISTORY:
1.0 - Initial version.
===============================================================================
*)
use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

on run argv
	
	if item 1 of argv = "Desktop" then
		set rootFolder to (path to desktop folder)
	else if item 1 of argv = "Downloads" then
		set rootFolder to (path to downloads folder)
	end if
	set t to POSIX path of rootFolder
	
	set oldFiles to {}
	
	set mydate to current date
	set twoweeksago to mydate - (14 * days)
	set thisMonth to (month of mydate) as integer
	if thisMonth < 10 then set thisMonth to "0" & thisMonth
	set thisYear to characters 3 thru -1 of ((year of mydate) as string) as string
	set shortdate to thisMonth & "." & thisYear as text
	
	try
		set MonthlyCleanupFolder to POSIX path of rootFolder & "Cleanups/" & year of mydate & "/" & (shortdate & " - Monthly Cleanup")
		try
			do shell script "mkdir -p " & quoted form of MonthlyCleanupFolder
		end try
		
		tell application "Finder"
			
			-- Get every file that is not the cleanups folder
			if item 1 of argv = "Downloads" then
				set oldFiles to every item of rootFolder whose (name does not contain "Cleanup") and creation date < twoweeksago
			else if item 1 of argv = "Desktop" then
				-- I have a "Screen Shots" folder on my Desktop that i dont want to be touched
				set oldFiles to every item of rootFolder whose (name does not contain "Cleanup" and name does not contain "Screen") and creation date < twoweeksago
			end if
			
			if (count of oldFiles) > 0 then
				move oldFiles to POSIX file MonthlyCleanupFolder as alias
				display notification ((count of oldFiles) & " files archived to clean up folder") as text with title "Archive Old " & item 1 of argv & " Files" subtitle "Success" sound name "Blow"
			else
				display notification "No files cleaned up" with title "Archive Old " & item 1 of argv sound name "Frog"
			end if
			
		end tell
		
	on error errMsg number errorNumber
		display notification errMsg with title "Monthly Cleanup" subtitle "Error number: " & errorNumber sound name "Basso"
	end try
end run

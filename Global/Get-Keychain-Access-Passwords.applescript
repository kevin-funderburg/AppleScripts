-- @description
-- Handler to return keychain access items
-- Feel free to reuse this with whatever passwords you'd like
--
on getKeychain(keychainItemName)
	do shell script "security 2>&1 >/dev/null find-generic-password -gl " & quoted form of keychainItemName & " | awk '{print $2}'"
	if result is not "SecKeychainSearchCopyNext:" then
		return (text 2 thru -2 of result)
	else
		display alert ("No " & keychainItemName & " keychain found!") ¬
			message ("Press OK to set up a " & keychainItemName & " keychain, this is a one time step.") as critical ¬
			buttons {"Cancel", "OK"} ¬
			default button ("OK") ¬
			cancel button "Cancel"
		
		tell application "Keychain Access" to activate
		delay 2
		tell application "System Events"
			tell process "Keychain Access"
				set accountName to short user name of (system info)
				keystroke "n" using {command down}
				delay 1.5
				set the clipboard to keychainItemName
				keystroke "v" using {command down}
				delay 1
				keystroke tab
				delay 1
				set the clipboard to accountName
				keystroke "v" using {command down}
				delay 1
				keystroke tab
				
				display alert ("Almost Done") ¬
					message ("Type in your " & keychainItemName & " password into the password field and click Add. Once it's saved run the script again.") as critical ¬
					buttons {"Cancel", "OK"} ¬
					default button ("OK") ¬
					cancel button "Cancel"
				
			end tell
		end tell
		return missing value
	end if
end getKeychain


tell application "System Events" to set frontapp to name of first process whose frontmost is true

tell application frontapp to close every document with saving
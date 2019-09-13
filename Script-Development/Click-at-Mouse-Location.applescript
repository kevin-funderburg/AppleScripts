use framework "Foundation"

property NSEvent : a reference to current application's NSEvent
property NSScreen : a reference to current application's NSScreen

-- Get display size
set display to NSDeviceSize ¬
	of deviceDescription() ¬
	of item 1 ¬
	of NSScreen's screens() as record

-- Get mouse location (relative to the bottom-left of the screen)
set mouseLocation to {x, y} of (NSEvent's mouseLocation as record)

-- Calculate mouse y-coordinate so it's relative to the top of the screen
set mouseLocation's item 2 to (display's height) - (mouseLocation's item 2)

tell application "System Events" to click at the mouseLocation

# Global Scripts

Various scripts for Global use.

> Although not needed, the shortcut keys I use to execute these via [Keyboard Maestro][kmapp] or [Alfred][alfredapp] are included in case you're interested

## Contents

- [Click Script Menu][a34585b1]&emsp;<kbd>⌃</kbd><kbd>⇧</kbd><kbd>S</kbd>
  - Simple script that makes viewing to the Script Menu a snap, best when mapped to a shortcut key.

- [Get Keychain Access Passwords][eb8aab1d]
  - Useful subroutine to securely access your keychain passwords.

- [Paste Safari URL With Title][da26184d]&emsp;<kbd>hotkey</kbd><kbd>U</kbd>
  - This is great when you want to paste the URL of the front tab, but also want it to display as the name of the site, rather than just the URL. So rather than https://en.wikipedia.org/wiki/AppleScript it would look like [AppleScript - Wikipedia][e8811402].

- [Play|Pause Apple TV][4eb9064d]
  - This takes advantage of the Home app that is included with Mojave, so if you have the app and have your Apple TV connected to it, this is a great little tool.
  - _NOTE_: This script looks for the name of your Apple TV, mine is "Living Room Apple TV" so if yours is different then change the name in the script.

- [Start|Stop Quicktime Screen Recording][c0ca3f5d]
  - If you make screen recordings with QuickTime, this makes starting and stopping screen recordings much easier, especially when mapped to a shortcut key.
  
- [Zoom - Toggle Mute][hdjkasdf]
  - super useful for globally muting yourself, this also uses the app [AnyBar][anybar] to indicate in the menu bar if you are muted or not.

- [Zoom - Toggle Video][ndhjskas]
  - same thing as mute but for video, nifty and quick.

[a34585b1]: ./Click-Script-Menu.applescript
[da26184d]: ./Paste-Safari-URL-With-Title.applescript
[e8811402]: https://en.wikipedia.org/wiki/AppleScript
[4eb9064d]: ./Play|Pause-Apple-TV.applescript
[c0ca3f5d]: ./Start|Stop-Quicktime-Screen-Recording.applescript
[kmapp]: https://www.keyboardmaestro.com/
[alfredapp]: https://www.alfredapp.com/
[anybar]: https://github.com/tonsky/AnyBar
[eb8aab1d]: ./Get-Keychain-Access-Passwords.applescript
[hdjkasdf]: ./zoom-toggle-mute.applescript
[ndhjskas]: ./zoom-toggle-video.applescript

<p align="center">
<img src="https://latenightsw.com/wordpress/wp-content/uploads/2018/03/cropped-icon_512x512.png" width="256" height="256">
</p>

# Script Debugger Scripts

Scripts and clippings for use when working in [Script Debugger](https://latenightsw.com/).

> Although not needed, the shortcut keys I use to execute these via [Keyboard Maestro][kmapp] or [Alfred][alfredapp] are included in case you're interested

## Contents

- [Duplicate Tab](./Duplicate-Tab.applescript)&emsp;<kbd>F7</kbd>
    - Duplicates the front tab, useful for making edits without breaking what is already written.

- [Duplicate for GitHub](./Duplicate-for-GitHub.applescript)
    - This duplicates the front script in its current file location as a `.applescript` file with unix style line endings so it is readable on GitHub.

- [Handler Tester][9b6bdfdc]&emsp;<kbd>F6</kbd>
    - This creates a second script for unit testing handlers within a script.
    - Result looks something like this:
    ```AppleScript
    tell application "Script Debugger"
	   tell document "Kevin's Library"
		     waitForSafariToLoad()
	    end tell
    end tell
    ```

- [Insert Dynamic Handler Description](./Insert-Dynamic-Handler-Description.applescript)
    - Insert a handler description at the beginning of the handler currently selected. The description will inserted by creating a Script Debugger clipping _dynamically_ with the handler's name and parameters.
    - Check out the demo below.

    <p><img src="../imgs/sdb-dynamicdescription.gif" width="500"</p>

- [Open Used Script Libraries](./Open-Used-Script-Libraries.applescript)&emsp;<kbd>⌃</kbd><kbd>⌥</kbd><kbd>O</kbd>
    - Open the script libraries that are currently in use in the front script.

- [Run Front Script](./Run-Front-Script.applescript)&emsp;<kbd>hyperkey</kbd><kbd>R</kbd>&emsp; :earth_americas:
    - Execute the frontmost script globally, I use this constantly for testing scripts in other applications.

- [Save As Text Script](./Save-As-Text-Script.applescript)&emsp;<kbd>⌃</kbd><kbd>S</kbd>
    - Prompts for a location to save a file as a text script with unix line endings for readability on GitHub.

- [Toggle Minimal View](./Toggle-Minimal-View.applescript)&emsp;<kbd>⌘</kbd><kbd>⌥</kbd><kbd>⇧</kbd><kbd>M</kbd>
    - Hides/Shows the toolbar, sidebar, and logging panel.

- [My Clippings](./My-Clippings)
    - Custom clippings I've made over the years. To use them save the `.txt` files into `~/Library/Application Support/Script Debugger 7/Clippings`


[kmapp]: https://www.keyboardmaestro.com/
[alfredapp]: https://www.alfredapp.com/
[9b6bdfdc]: ./Handler-Tester.applescript

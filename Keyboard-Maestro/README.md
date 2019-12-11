<p align="center">
<img src="https://www.stairways.com/img/keyboardmaestro-256.png">
</p>

# Keyboard Maestro Scripts

Scripts for use while working in [Keyboard Maestro][kmapp].
> Although not needed, the shortcut keys I use to execute these via [Keyboard Maestro][kmapp] or [Alfred][alfredapp] are included in case you're interested

## Contents

- [Edit Linked or In-Line AppleScript][c02bcb30]&emsp;<kbd>⌥</kbd><kbd>⇧</kbd><kbd>E</kbd>
  - When you trigger this script, it will determine if the action copied is an
    in-line or linked AppleScript and open the result in your preferred AppleScript
    editor (default is Script Debugger).
  - If it is in-line, it will compile the text in your editor
  - Check out the demo below.<br>
    ![demo](../imgs/km-editscript.gif)

- [Add|Remove Status Menu Trigger][c2d0b8f9]&emsp;<kbd>⌥</kbd><kbd>S</kbd>
    - Quickly add or remove a status menu trigger, best when mapped to a shortcut key.

- [Collapse all Pause|Type|Execute Macro Actions][a0794034]&emsp;<kbd>⌥</kbd><kbd>⌃</kbd><kbd>[</kbd>
    - I like to keep `Type Text`, `Pause for`, and `Execute Macro` actions collapsed for neatness so this is a nice script to collapse all of them in the front macro

- [Copy Front Macros AppleScript Trigger][d4cdec98]&emsp;<kbd>⌘</kbd><kbd>⌃</kbd><kbd>C</kbd>
    - Copies the AppleScript trigger for the front macro without having to show the script snippet, best when mapped to a shortcut key.
    - Result looks like:
    ```AppleScript
    # ignoring application responses
    tell application "Keyboard Maestro Engine"
            do script "97A494D2-4988-4B66-853F-D72C028197D8"
            # or: do script "97A494D2-4988-4B66-853F-D72C028197D8" with parameter "Whatever"
    end tell
    # end ignoring
    ```

- [Edit Last Executed Macro][2f47df90]&emsp;<kbd>⌃</kbd><kbd>⇧</kbd><kbd>E</kbd>&emsp; :earth_americas:
    - Global script that shows the last executed macro, great when an edit needs to be made after execution.

- [Go To Executed Macro][8f04478c]&emsp;<kbd>⌘</kbd><kbd>⌥</kbd><kbd>G</kbd>
    - Jump to the macro being called within a macro by the `Execute Macro` action.

- [Run Current Macro](./Run-Current-Macro.applescript)&emsp;<kbd>⌘</kbd><kbd>⌃</kbd><kbd>R</kbd>&emsp; :earth_americas:
    - Crucial action, I use it all the time to test out the macro I'm working on but haven't set a trigger for it yet.


[kmapp]: https://www.keyboardmaestro.com/
[alfredapp]: https://www.alfredapp.com/
[c2d0b8f9]: ./Add|Remove-Status-Menu-Trigger
[d4cdec98]: ./Copy-Front-Macros-AppleScript-Trigger.applescript
[c02bcb30]: ./Edit-Linked-or-In-Line-AppleScript.applescript
[2f47df90]: ./Edit-Last-Executed-Macro.applescript
[8f04478c]: ./Go-To-Executed-Macro.applescript
[a0794034]: ./Collapse-All-[Pause|Type|Execute-Macro]-Actions.applescript

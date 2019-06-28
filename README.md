<p align="center"> <img src="./imgs/script.png"> </p>

# My AppleScripts

Collection of AppleScripts I've developed or acquired over the years for many purposes. Some are great as standalone scripts while others are great for incorporation with others.

> This repo is in continuous development and will be updated as scripts are developed (and as I have time).

<!-- TOC depthFrom:2 -->

- [About](#about)
- [Contents](#contents)
    - [Application Scripts](#application-scripts)
    - [Global Scripts](#global-scripts)
    - [Scripts for Script Development](#scripts-for-script-development)
- [Tools](#tools)
- [Tips](#tips)
    - [Keep Scripts In Sync Using Aliases](#keep-scripts-in-sync-using-aliases)
    - [Make a Hyperkey](#make-a-hyperkey)
- [Resources](#resources)
    - [My Favorite Tutorials](#my-favorite-tutorials)
- [Licensing & thanks](#licensing--thanks)
- [Changelog](#changelog)
- [To-Do](#to-do)

<!-- /TOC -->

<a id="about"></a>

## About

This repo was created for two main reasons.
1. Provide others with useful scripts for automating their workflow on macOS.
2. As a tool for AppleScript education by providing example scripts, tools, tips and AppleScript resources.

With some exceptions, almost all these scripts are executable by themselves via the {==Script Menu==}{>>make into link<<}. However, I generally turn to third party automation apps to execute them, including [Keyboard Maestro][kmapp], [Alfred][alfredapp], [BetterTouchTool][bttapp] and [Hazel][hazelapp].

- **Notes on formatting**
For those who are unaware, the standard file format for AppleScripts is `.scpt` or `.scptd`, but these file types are not readable on GitHub, so for readability's sake, all these scripts have been exported as a `.applescript` file (which is just a text file). So if you were wondering about the file type, this is the reason.

- Many of these scripts depend on this [script library][kevinslib] I developed, so if you see the following line at the top of the script, make sure you get that library and place it into `~/Library/Script Libraries` otherwise the script is non-functional.

```AppleScript
use kl : script "Kevin's Library"
```

## Contents

I've divided the scripts into 3 sections:
1. **Application Scripts** - Scripts designed for use in a specific application.
2. **Global Scripts** - Scripts that are meant to be executed in any application.
    - _NOTE_: There are scripts here that are specific to an application but are meant to executed globally, so the scripts in the Application Scripts section with the globe icon ( :earth_americas: ) next to them imply global scope for that specific application.
3. **Scripts for Script Development** - These scripts are useful handlers that can be copied into scripts or into a script library that makes scripting much simpler.

Clicking the name of the script will show you the script directly, but **make sure to view the README for each section** by clicking the title of the section to see instructions/explanations/demos.

The shortcut keys I use to execute these via [Keyboard Maestro][kmapp] or [Alfred][alfredapp] are included in case your're interested
<a id="Application Scripts"></a>

### Application Scripts

Application                 |  Scripts                                                      |  Shortcut Key
----------------------------|---------------------------------------------------------------|-----------------------------------------------------------
**[Alfred](./Alfred)**      |  [Show Recent Files for Front App][a345fg38] :earth_americas: | <kbd>hyperkey</kbd> <kbd>O</kbd>
<i></i>                     |  [Browse Current Workflow in Alfred][6274c240]                | <kbd>⌘</kbd> <kbd>R</kbd>
<i></i>                     |  <i></i>                                                      | <i></i>
**[Calendar](./Calendar)**  |  [WFO to Calendar][d2c1694b] :earth_americas:                 | <i></i>
<i></i>                     |  <i></i>                                                      | <i></i>
**[Finder][finder]**        |  [Monthly Cleanups][2f34cbb7]                                 | <i></i>
<i></i>                     |  [Open Selection in iTerm][8fea9aa4]                          | <kbd>⌥</kbd> <kbd>⇧</kbd> <kbd>T</kbd>
<i></i>                     |  <i></i>                                                      | <i></i>
**[Keyboard Maestro][km]**  |  [Edit Linked or In-Line AppleScript][3034f6a6]               | <kbd>⌥</kbd> <kbd>⇧</kbd> <kbd>E</kbd>
<i></i>                     |  [Add\|Remove Status Menu Trigger][8111e7c4]                  | <kbd>⌥</kbd> <kbd>S</kbd>
<i></i>                     |  [Copy Front Macro's AppleScript Trigger][4945c497]           | <kbd>⌘</kbd> <kbd>⌃</kbd> <kbd>C</kbd>
<i></i>                     |  [Edit Last Executed Macro][8265051f] :earth_americas:        | <kbd>⌃</kbd> <kbd>⇧</kbd> <kbd>E</kbd>
<i></i>                     |  [Go To Executed Macro][4355277b]                             | <kbd>⌘</kbd> <kbd>⌥</kbd> <kbd>G</kbd>
<i></i>                     |  [Run Current Macro][8cbb891d] :earth_americas:               | <kbd>⌘</kbd> <kbd>⌃</kbd> <kbd>R</kbd>
<i></i>                     |  <i></i>                                                      | <i></i>
**[Mail][mail]**            |  [Set Color of Text][d1529523]                                | <i></i>
<i></i>                     |  [Make Mail URL][63ba2f90]                                    | <kbd>⌃</kbd> <kbd>U</kbd>
<i></i>                     |  [Mark All Inbox Messages as Read][48cdab2f]                  | <i></i>
<i></i>                     |  <i></i>                                                      | <i></i>
**[Safari](./Safari)**      |  [Close Left Tab][6de3c825]                                   | <kbd>⌥</kbd> <kbd>[</kbd>
<i></i>                     |  [Close Right Tab][2f774cb3]                                  | <kbd>⌥</kbd> <kbd>]</kbd>
<i></i>                     |  [Duplicate Tab][74151e54]                                    | <kbd>⌃</kbd> <kbd>D</kbd>
<i></i>                     |  [Do Javascript Handler][3d850154]                            | <i></i>
<i></i>                     |  [Show\|Create Tab][225bf283]                                 | <i></i>
<i></i>                     |  <i></i>                                                      | <i></i>
**[Script Debugger][sdb]**  |  [Duplicate Tab][ff203baf]                                    | <kbd>F7</kbd>
<i></i>                     |  [Duplicate for GitHub][ea9fb946]                             | <i></i>
<i></i>                     |  [Insert Dynamic Handler Description][h78j5f3s]               | <i></i>
<i></i>                     |  [Open Used Script Libraries][3c961777]                       | <kbd>⌃</kbd> <kbd>⌥</kbd> <kbd>O</kbd>
<i></i>                     |  [Run Front Script][u76g4ds3] :earth_americas:                | <kbd>hyperkey</kbd> <kbd>R</kbd>
<i></i>                     |  [Save As Text Script][98e99d57]                              | <kbd>⌃</kbd> <kbd>S</kbd>
<i></i>                     |  [Toggle Minimal View][3a899b61]                              | <kbd>⌘</kbd> <kbd>⌥</kbd> <kbd>⇧</kbd> <kbd>M</kbd>


[a345fg38]: ./Alfred/Show-Recent-Files-for-Front-App.applescript
[6274c240]: ./Alfred/Browse-Current-Workflow-in-Alfred.applescript
[d2c1694b]: ./Calendar/WFO-to-Calendar.applescript
[2f34cbb7]: ./Finder/Monthly-Cleanups.applescript
[8fea9aa4]: ./Finder/Open-Selection-in-iTerm.applescript
[km]: ./Keyboard-Maestro
[3034f6a6]: ./Keyboard-Maestro/Edit-Linked-or-In-Line-AppleScript.applescript
[8111e7c4]: ./Keyboard-Maestro/Add|Remove-Status-Menu-Trigger.applescript
[4945c497]: ./Keyboard-Maestro/Copy-Front-Macros-AppleScript-Trigger.applescript
[8265051f]: ./Keyboard-Maestro/Edit-Last-Executed-Macro.applescript
[4355277b]: ./Keyboard-Maestro/Go-To-Executed-Macro.applescript
[8cbb891d]: ./Keyboard-Maestro/Run-Current-Macro.applescript
[d1529523]: ./Mail/Set-Color-of-Text.applescript
[63ba2f90]: ./Mail/Make-Mail-URL.applescript
[48cdab2f]: ./Mail/Mark-All-Inbox-Messages-as-Read.applescript
[6de3c825]: ./Safari/Close-Left-Tab.applescript
[2f774cb3]: ./Safari/Close-Right-Tab.applescript
[74151e54]: ./Safari/Duplicate-Tab.applescript
[3d850154]: ./Safari/Do-Javascript-Handler.applescript
[225bf283]: ./Safari/Show|Create-Tab.applescript
[sdb]: ./Script-Debugger
[ff203baf]: ./Script-Debugger/Duplicate-Tab.applescript
[ea9fb946]: ./Script-Debugger/Duplicate-for-GitHub.applescript
[h78j5f3s]: ./Script-Debugger/Insert-Dynamic-Handler-Description.applescript
[3c961777]: ./Script-Debugger/Open-Used-Script-Libraries.applescript
[u76g4ds3]: ./Script-Debugger/Run-Front-Script.applescript
[98e99d57]: ./Script-Debugger/Save-As-Text-Script.applescript
[3a899b61]: ./Script-Debugger/Toggle-Minimal-View.applescript

<a id="Global"></a>

### Global Scripts

Context                             |  Scripts                                              |  Shortcut Key
------------------------------------|-------------------------------------------------------|---------------------------------------------------------
**[Document Closers][c98jhawe]**    |  [Close All Un-Saved Documents][9a704632]             | <kbd>⌘</kbd> <kbd>⌥</kbd> <kbd>⇧</kbd> <kbd>W</kbd>
<i></i>                             |  [Close All With Saving][3b80a0d2]                    | <kbd>⌘</kbd> <kbd>⌥</kbd> <kbd>⇧</kbd> <kbd>W</kbd>
<i></i>                             |  [Close All Without Saving][a5d8c9ea]                 | <kbd>⌘</kbd> <kbd>⌥</kbd> <kbd>⇧</kbd> <kbd>W</kbd>
<i></i>                             |  [Close With Saving][d370f17e]                        | <kbd>⌥</kbd> <kbd>W</kbd>
<i></i>                             |  [Close Without Saving][dec030b7]                     | <kbd>⌃</kbd> <kbd>W</kbd>
<i></i>                             |  <i></i>                                              | <i></i>
**[System Control][sc]**            |  [Restart AirPort Extreme][456bc1d1]                  | <i></i>
<i></i>                             |  [Toggle Bluetooth][25e6a902]                         | <i></i>
<i></i>                             |  [Toggle Hazel][d2434bdc]                             | <i></i>
<i></i>                             |  [Toggle Menu Bar Visibility][a517cb4f]               | <i></i>
<i></i>                             |  [Toggle WiFi][aa8be569]                              | <i></i>
<i></i>                             |  <i></i>                                              | <i></i>
**[Various][global]**               |  [Click Script Menu][d1c0746f]                        | <kbd>⌃</kbd> <kbd>⇧</kbd> <kbd>S</kbd>
<i></i>                             |  [Paste Safari URL With Title][1d8d603d]              | <kbd>hyperkey</kbd> <kbd>U</kbd>
<i></i>                             |  [Start\|Stop Quicktime Screen Recording][a921fa5d]   | <kbd>⌃</kbd><kbd>⌥</kbd><kbd>Q</kbd>
<i></i>                             |  [Play\|Pause Apple TV][nh8765gf]                     | <i></i>
<i></i>                             |  {++keychain access++}                                | <i></i>

[c98jhawe]: ./Document-Closers
[9a704632]: ./Document-Closers/Close-All-Un-Saved-Documents.applescript
[3b80a0d2]: ./Document-Closers/Close-All-With-Saving.applescript
[a5d8c9ea]: ./Document-Closers/Close-All-Without-Saving.applescript
[d370f17e]: ./Document-Closers/Close-With-Saving.applescript
[dec030b7]: ./Document-Closers/Close-Without-Saving.applescript
[456bc1d1]: ./System-Control/Restart-AirPort-Extreme.applescript
[25e6a902]: ./System-Control/Toggle-Bluetooth.applescript
[a517cb4f]: ./System-Control/Toggle-Menu-Bar-Visibility.applescript
[d2434bdc]: ./System-Control/Toggle-Hazel.applescript
[aa8be569]: ./System-Control/Toggle-WiFi.applescript
[d1c0746f]: ./Global/Click-Script-Menu.applescript
[1d8d603d]: ./Global/Paste-Safari-URL-With-Title.applescript
[a921fa5d]: ./Global/Start|Stop-Quicktime-Screen-Recording.applescript
[nh8765gf]: ./Global/Play|Pause-Apple-TV.applescript

### Scripts for Script Development

Context                         |  Scripts
--                              |--
**[Text Utilities][jh7839dm]**  |  [Extract Between][f3fd3ca9]
<i></i>                         |  [Split Text][561dd09a]
<i></i>                         |  [Transform Text][5748a92f]



[jh7839dm]: ./Script-Development/Text-Utilities
[f3fd3ca9]: ./Script-Development/Text-Utilities/Extract-Between.applescript
[561dd09a]: ./Script-Development/Text-Utilities/Split-Text.applescript
[5748a92f]: ./Script-Development/Text-Utilities/Transform-Text.applescript


_Shortcut key symbols_

Symbol              | Key
--------------------|------------------
<kbd>⌘</kbd>        | <kbd>command</kbd>
<kbd>⌥</kbd>        | <kbd>option</kbd>
<kbd>⌃</kbd>        | <kbd>control</kbd>
<kbd>⇧</kbd>        | <kbd>shift</kbd>
<kbd>hyperkey</kbd> | <kbd>command</kbd> <kbd>option</kbd> <kbd>control</kbd> <kbd>shift</kbd>


* * *

## Tools

- **[Script Debugger](https://latenightsw.com/)** - By far the most valuable scripting tool. When I first started learning scripting with Script Editor, the process was slow and frustrating. With Script Debugger I learned 100 times faster and understood everything much easier.
- **[UI Browser](https://pfiddlesoft.com/uibrowser/)** - Invaluable tool for UI scripting. UI scripting is brutal on its own, and slightly less brutal with the Accessibility Inspector, but UI Browser makes it so much simpler, I tried it once and knew I had to get it.
- **[JSON Helper](https://apps.apple.com/us/app/json-helper-for-applescript/id453114608?mt=12)** - Makes working with JSON so much simpler, incredibly useful and **free**!
- **[Location Helper](https://apps.apple.com/us/app/location-helper/id488536386?mt=12)** - Find your geo code location in a snap, and for **free**!
- **[Dash](https://kapeli.com/dash)** - Fantastic tool for API browsing, after installation go to `Preferences` > `Downloads` and install the AppleScript docset to have blazing fast access to AppleScript documentation, plus its **free**!
- **[Atom Packages](https://atom.io/packages)** (I do all my script writing in Script Debugger but most of my Markdown stuff in [Atom](https://atom.io/) so these are very useful.)
    - [atom-applescript](https://github.com/franzheidl/atom-applescript) - adds language support to Atom so you can view AppleScript syntax
    - [build-osa](https://github.com/idleberg/atom-build-osa) - Lets you build and execute AppleScripts from Atom.
- **[Alfred Workflows][alfredapp]**
    - [AppScripts](https://github.com/deanishe/alfred-appscripts) - List, search and run/open AppleScripts for the active application
    - [KeyCodes](http://www.packal.org/workflow/keycodes) - Great for UI scripting where you need to type a non-character key. Lets you find AppleScript key codes in an instant by typing `kc [<key name>]`.
        - If you don't have Alfred then bookmark [Complete list of AppleScript key codes](https://eastmanreference.com/complete-list-of-applescript-key-codes)

* * *

## Tips

### Keep Scripts In Sync Using Aliases

In order for scripts to be accessible via the Script Menu, scripts must be stored in `~/Library/Scripts`, but if you like to keep your scripts synced between devices, this location is a pain. I used to have a [Hazel][hazelapp] rule set up to sync `~/Library/Scripts` to Dropbox that worked fine for years, but I didn't like all the extra processing needed to sync and worse yet I had 2 copies of every script which was messy and got confusing.


I realized later that moving all my scripts to `~/Dropbox/Library/Scripts` then creating an alias to that location and moving it `~/Library` allows for my scripts to be stored in Dropbox, and still be accessible in the Script Menu!
> This method works exactly as well with the `~/Library/Script Libraries` folder.

Here's a screenshot of what it looks like in Finder.

![aliasDemo](./imgs/aliasPath.png)

**How to do it:**

1.  **Make a backup** of the folder your moving to your Desktop just in case you mess up.
2.  I recommend having the same folder structure in Dropbox so make the folder `~/Dropbox/Library/`
3.  Copy the folder you want to sync (`~/Library/Scripts/` or `~/Library/Script Libraries/`) and paste into the `~/Dropbox/Library/` folder you made.
4.  Delete the original folder you copied from `~/Library/`
5.  Select the folder you pasted into `~/Dropbox/Library/` then click `File` > `Make Alias`
6.  Move the resulting alias back to `~/Library/`. The result will be like `~/Library/Scripts alias` so rename the alias by removing the " alias" part so it looks like `~/Library/Scripts` and you're good to go!

- **NOTE**: Symlinks don't work for this method, I originally tried the following command which did make an alias, but then the scripts weren't accessible via the Script Menu.

    ```shell
    ln -s ~/Library/Scripts ~/Dropbox/Library/Scripts/
    ```

### Make a Hyperkey
{++karabiner description++}
* * *

## Resources
- [AppleScript Language Guide](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html) - Necessary for efficient script development, explains everything about how to script with AppleScript. (I highly recommend the [Dash](https://kapeli.com/dash) version though, much faster and easier to use)
- [Macscripter.net](https://macscripter.net/) - Forum for AppleScripters to post examples and ask questions. Definitely create a free account.

### My Favorite Tutorials
This are tutorials I've bookmarked over the years that have been particularly helpful for me.
- Safari Stuff
    - [How to Fill Out Forms on Websites with AppleScript](http://www.cubemg.com/how-to-fill-out-forms-on-websites-with-applescript/)
    - [How to click a button on a Web Page with AppleScript](http://www.cubemg.com/how-to-click-a-button-on-a-web-page-with-applescript/)
    - [How to Extract Information From a Website Using AppleScript](http://www.cubemg.com/how-to-extract-information-from-a-website-using-applescript/)
    - [How to Select a Drop Down Menu With Applescript](http://www.cubemg.com/how-to-select-a-drop-down-menu-with-applescript/)
    - [AppleScript Screen Scraping to Excel Example](http://www.cubemg.com/applescript-screen-scraping-to-excel-example/)
- Keyboard Maestro Stuff
    - [Using AppleScript to Get and Set Keyboard Maestro Variables](https://wiki.keyboardmaestro.com/AppleScript)
    - [Scripting the Keyboard Maestro editor](https://wiki.keyboardmaestro.com/Scripting_the_Keyboard_Maestro_editor)
- Various
    - [Date/Time Calculations using AppleScript](https://erikslab.com/2007/11/26/date-time-calculations-using-applescript/)
    - [Storing and Accessing Data with AppleScript](http://preserve.mactech.com/articles/mactech/Vol.22/22.03/StoringandAccessingData/index.html)
    - [AppleScript Power Handlers](https://www.apeth.net/matt/unm/asph.html)
    - [Giving your AppleScripts a Face Lift with AppleScriptObjC](https://www.youtube.com/watch?v=HE5jFCfkD0w&app=desktop) :tv:

## Licensing & thanks

These scripts are released under the [MIT License][mit].

<a id="changelog"></a>

## Changelog

- v1.0.0

## To-Do

- [ ] Add more app categories
- [ ] Refine readme
- [ ] Add icons to favorite scripts
- [ ] Add tips section

<!-- External links -->

[alfredapp]: https://www.alfredapp.com/
[bttapp]: https://folivora.ai/
[kmapp]: https://www.keyboardmaestro.com/
[hazelapp]: https://www.noodlesoft.com/

<!-- My GitHub links -->

[kevinslib]: https://github.com/kevin-funderburg/AppleScript-libraries/blob/master/Kevin's%20Library.applescript

<!-- Sub directories -->

[blob]: https://github.com/kevin-funderburg/AppleScripts/blob/master/
[finder]: https://github.com/kevin-funderburg/AppleScripts/tree/master/Finder
[global]: https://github.com/kevin-funderburg/AppleScripts/tree/master/Global

[mail]: ./Mail
[mit]: https://github.com/kevin-funderburg/AppleScripts/blob/master/LICENSE.txt

[sc]: https://github.com/kevin-funderburg/AppleScripts/blob/master/System-Control

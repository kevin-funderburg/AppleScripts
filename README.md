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
- [Resources](#resources)
- [Licensing & thanks](#licensing--thanks)
- [Changelog](#changelog)
- [To-Do](#to-do)

<!-- /TOC -->

<a id="about"></a>

## About

This repo was created for two main reasons.
1. Provide others with useful scripts for automating their workflow on macOS.
2. As a tool for AppleScript education by providing example scripts, tools, tips and AppleScript resources.

With some exceptions, almost all these scripts are executable by themselves via the Script Menu. However, I generally turn to third party automation apps to execute them, including [Keyboard Maestro][kmapp], [Alfred][alfredapp], [BetterTouchTool][bttapp] and [Hazel][hazelapp].

- **Notes on formatting**
For those who are unaware, the standard file format for AppleScripts is `.scpt` or `.scptd`, but these file types are not readable on GitHub, so for readability's sake, all these scripts have been exported as a .applescript file (which is just a text file). So if you were wondering about the file type, this is the reason.

- Many of these scripts depend on this [script library][kevinslib] I developed, so if you see the following line at the top of the script, make sure you get that library and place it into `~/Library/Script Libraries` otherwise the script is non-functional.

```AppleScript
use kl : script "Kevin's Library"
```

## Contents

I've divided the scripts into 3 sections:
1. **Application Scripts** - Scripts designed for use in a specific application.
2. **Global Scripts** - Scripts that are meant to be executed in any application.
    - _NOTE_: There are scripts here that are specific to an application but are meant to executed globally, so the scripts in the Application Scripts section with the globe icon [ 🌎 ] next to them imply global scope for that specific application.
3. **Scripts for Script Development** - These scripts are useful handlers that can be copied into scripts or into a script library that makes scripting much simpler.

Clicking the name of the script will show you the script directly, but **make sure to view the README for each section** by clicking the title of the section to see instructions/explanations/demos.

<a id="Applications"></a>

### Application Scripts
Application                 |  Scripts
---                         |---
 **[Alfred](./Alfred)**     |  [Show Recent Files for Front App][a345fg38] 🌎
 <i></i>                    |  <i></i>
 **[Calendar](./Calendar)** |  [WFO to Calendar][d2c1694b] 🌎
 <i></i>                    |  <i></i>
 **[Finder][finder]**       |  [Monthly Cleanups][2f34cbb7]
<i></i>                     |  [Open Selection in iTerm][8fea9aa4]
<i></i>                     |  <i></i>
**[Keyboard Maestro][km]**  |  [Edit Linked or In-Line AppleScript][3034f6a6]
<i></i>                     |  [Add\|Remove Status Menu Trigger][8111e7c4]
<i></i>                     |  [Copy Front Macro's AppleScript Trigger][4945c497]
<i></i>                     |  [Edit Last Executed Macro][8265051f] 🌎
<i></i>                     |  [Go To Executed Macro][4355277b]
<i></i>                     |  [Run Current Macro][8cbb891d] 🌎
<i></i>                     |  <i></i>
**[Mail][mail]**            |  [Set Color of Text][d1529523]
<i></i>                     |  [Make Mail URL][63ba2f90]
<i></i>                     |  [Mark All Inbox Messages as Read][48cdab2f]
<i></i>                     |  <i></i>
 **[Safari](./Safari)**     |  [Close Left Tab][6de3c825]
<i></i>                     |  [Close Right Tab][2f774cb3]
<i></i>                     |  [Duplicate Tab][74151e54]
<i></i>                     |  [Do Javascript Handler][3d850154]
<i></i>                     |  <i></i>  
 **[Script Debugger][sdb]** |  [Duplicate Tab][ff203baf]
<i></i>                     |  [Duplicate for GitHub][ea9fb946]
<i></i>                     |  [Insert Dynamic Handler Description][h78j5f3s]
<i></i>                     |  [Open Used Script Libraries][3c961777]
<i></i>                     |  [Run Front Script][u76g4ds3] 🌎
<i></i>                     |  [Save As Text Script][98e99d57]
<i></i>                     |  [Toggle Minimal View][3a899b61]


[a345fg38]: ./Alfred/Show%20Recent%20Files%20for%20Front%20App.applescript
[d2c1694b]: ./Calendar/WFO%20to%20Calendar.applescript
[2f34cbb7]: ./Finder/Monthly%20Cleanups.applescript
[8fea9aa4]: ./Finder/Open%20Selection%20in%20iTerm.applescript
[3034f6a6]: ./Keyboard%20Maestro/Edit%20Linked%20or%20In-Line%20AppleScript.applescript
[8111e7c4]: ./Keyboard%20Maestro/Add|Remove%20Status%20Menu%20Trigger.applescript
[4945c497]: ./Keyboard%20Maestro/Copy%20Front%20Macros%20AppleScript%20Trigger.applescript
[8265051f]: ./Keyboard%20Maestro/Edit%20Last%20Executed%20Macro.applescript
[4355277b]: ./Keyboard%20Maestro/Go%20To%20Executed%20Macro.applescript
[8cbb891d]: ./Keyboard%20Maestro/Run%20Current%20Macro.applescript
[d1529523]: ./Mail/Set%20Color%20of%20Text.applescript
[63ba2f90]: ./Mail/Make%20Mail%20URL.applescript
[48cdab2f]: ./Mail/Mark%20All%20Inbox%20Messages%20as%20Read.applescript
[6de3c825]: ./Safari/Close%20Left%20Tab.applescript
[2f774cb3]: ./Safari/Close%20Right%20Tab.applescript
[74151e54]: ./Safari/Duplicate%20Tab.applescript
[3d850154]: ./Safari/Do%20Javascript%20Handler.applescript
[ff203baf]: ./Script%20Debugger/Duplicate%20Tab.applescript
[ea9fb946]: ./Script%20Debugger/Duplicate%20for%20GitHub.applescript
[h78j5f3s]: ./Script%20Debugger/Insert%20Dynamic%20Handler%20Description.applescript
[3c961777]: ./Script%20Debugger/Open%20Used%20Script%20Libraries.applescript
[u76g4ds3]: ./Script%20Debugger/Run%20Front%20Script.applescript
[98e99d57]: ./Script%20Debugger/Save%20As%20Text%20Script.applescript
[3a899b61]: ./Script%20Debugger/Toggle%20Minimal%20View.applescript

<a id="Global"></a>

### Global Scripts

Context                             |  Scripts
--                                  |--
**[Document Closers][docclosers]**  |  [Close All Un-Saved Documents][9a704632]
<i></i>                             |  [Close All With Saving][3b80a0d2]
<i></i>                             |  [Close All Without Saving][a5d8c9ea]
<i></i>                             |  [Close With Saving][d370f17e]
<i></i>                             |  [Close Without Saving][dec030b7]  
<i></i>                             |  <i></i>
**[System Control][sc]**            |  [Restart AirPort Extreme][456bc1d1]
<i></i>                             |  [Toggle Bluetooth][25e6a902]
<i></i>                             |  [Toggle Hazel][d2434bdc]
<i></i>                             |  [Toggle Menu Bar Visibility][a517cb4f]
<i></i>                             |  [Toggle WiFi][aa8be569]
<i></i>                             |  <i></i>
**[Various][global]**               |  [Click Script Menu][d1c0746f]
<i></i>                             |  [Paste Safari URL With Title][1d8d603d]
<i></i>                             |  [Start\|Stop Quicktime Screen Recording][a921fa5d]
<i></i>                             |  [Play\|Pause Apple TV][nh8765gf]

[9a704632]: ./Document%20Closers/Close%20All%20Un-Saved%20Documents.applescript
[3b80a0d2]: ./Document%20Closers/Close%20All%20With%20Saving.applescript
[a5d8c9ea]: ./Document%20Closers/Close%20All%20Without%20Saving.applescript
[d370f17e]: ./Document%20Closers/Close%20With%20Saving.applescript
[dec030b7]: ./Document%20Closers/Close%20Without%20Saving.applescript
[456bc1d1]: ./System%20Control/Restart%20AirPort%20Extreme.applescript
[25e6a902]: ./System%20Control/Toggle%20Bluetooth.applescript
[a517cb4f]: ./System%20Control/Toggle%20Menu%20Bar%20Visibility.applescript
[d2434bdc]: ./System%20Control/Toggle%20Hazel.applescript
[aa8be569]: ./System%20Control/Toggle%20WiFi.applescript
[d1c0746f]: ./Global/Click%20Script%20Menu.applescript
[1d8d603d]: ./Global/Paste%20Safari%20URL%20With%20Title.applescript
[a921fa5d]: ./Global/Start|Stop%20Quicktime%20Screen%20Recording.applescript
[nh8765gf]: ./Global/Play|Pause%20Apple%20TV.applescript

### Scripts for Script Development
- [coming soon]

* * *

## Tools

- **[Script Debugger](https://latenightsw.com/)** - By far the most valuable scripting tool. When I first started learning scripting with Script Editor, the process was slow and frustrating. With Script Debugger I learned 100 times faster and understood everything much easier.
- **[UI Browser](https://pfiddlesoft.com/uibrowser/)** - Invaluable tool for UI scripting. UI scripting is brutal on its own, and slightly less brutal with the Accessibility Inspector, but UI Browser makes it so much simpler, I tried it once and knew I had to get it.
- **[JSON Helper](https://apps.apple.com/us/app/json-helper-for-applescript/id453114608?mt=12)** - Makes working with JSON so much simpler, incredibly useful and **free**!
- **[Location Helper](https://apps.apple.com/us/app/location-helper/id488536386?mt=12)** - Find your geo code location in a snap, and for **free**!
- **[Dash](https://kapeli.com/dash)** - Fantastic tool for API browsing, after installation go to `Preferences > Downloads` and install the AppleScript docset to have blazing fast access to AppleScript documentation, plus its **free**!
- **[Atom Packages](https://atom.io/packages)** (I do all my script writing in Script Debugger but most of my Markdown stuff in [Atom](https://atom.io/) so these are very useful.)
  - [atom-applescript](https://github.com/franzheidl/atom-applescript) - adds language support to Atom so you can view AppleScript syntax
  - [build-osa](https://github.com/idleberg/atom-build-osa) - Lets you build and execute AppleScripts from Atom.

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
5.  Select the folder you pasted into `~/Dropbox/Library/` then click `File > Make Alias`
6.  Move the resulting alias back to `~/Library/`. The result will be like `~/Library/Scripts alias` so rename the alias by removing the " alias" part so it looks like `~/Library/Scripts` and you're good to go!

- **NOTE**: Symlinks don't work for this method, I originally tried the following command which did make an alias, but then the scripts weren't accessible via the Script Menu.

    ```shell
    ln -s ~/Library/Scripts ~/Dropbox/Library/Scripts/
    ```

* * *

## Resources
- [AppleScript Language Guide](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html) - Necessary for efficient script development, explains everything about how to script with AppleScript. (I highly recommend the [Dash](https://kapeli.com/dash) version though, much faster and easier to use)
- [Macscripter.net](https://macscripter.net/) - Forum for AppleScripters to post examples and ask questions. Definitely create a free account.


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
[docclosers]: https://github.com/kevin-funderburg/AppleScripts/tree/master/Document%20Closers
[finder]: https://github.com/kevin-funderburg/AppleScripts/tree/master/Finder
[global]: https://github.com/kevin-funderburg/AppleScripts/tree/master/Global
[km]: ./Keyboard%20Maestro
[mail]: https://github.com/kevin-funderburg/AppleScripts/tree/master/mail
[mit]: https://github.com/kevin-funderburg/AppleScripts/blob/master/LICENSE.txt
[sdb]: ./Script%20Debugger
[sc]: https://github.com/kevin-funderburg/AppleScripts/blob/master/System%20Control

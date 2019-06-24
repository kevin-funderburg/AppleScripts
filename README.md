<p align="center"> <img src="./imgs/script.png"> </p>

# My AppleScripts

Collection of AppleScripts I've developed over the years for many purposes. Some are great as standalone scripts while others are great for incorporation with others.

> This repo is in continuous development and will be updated as scripts are developed (and as I have time).


<!-- TOC depthFrom:2 -->

- [About](#about)
- [Contents](#contents)
    - [Application Scripts](#application-scripts)
    - [Global Scripts](#global-scripts)
- [Licensing & thanks](#licensing--thanks)
- [Changelog](#changelog)
- [To-Do](#to-do)

<!-- /TOC -->

<a id="about"></a>
## About

These apps are mostly launched via [Keyboard Maestro][kmapp], [Alfred][alfredapp], [BetterTouchTool][bttapp], [Hazel][hazelapp].

Many of these apps depend on this [script library][kevinsLib] I developed, so if you see this at the top of the script, make sure you get that library.
```AppleScript
use kl : script "Kevin's Library"
```

## Contents
I've divided the scripts into an applications section (scripts specific to an app) and a Global section where they can be used anywhere. Clicking the name of the script will show you the script directly, but **make sure to view the README for each section** by clicking the title of the section.

<a id="Applications"></a>
### Application Scripts

- [Finder][finder]
    - [Monthly Cleanups][2f34cbb7]
- [Keyboard Maestro][km]
    - [Edit Linked or In-Line AppleScript][3034f6a6]
    - [Add|Remove Status Menu Trigger][8111e7c4]
    - [Copy Front Macros AppleScript Trigger](./Keyboard%20Maestro/Copy%20Front%20Macros%20AppleScript%20Trigger.applescript)
    - [Edit Last Executed Macro](./Keyboard%20Maestro/Edit%20Last%20Executed%20Macro.applescript)
- [Mail][mail]
    - [Set Color of Text][d1529523]
    - [Make Mail URL][63ba2f90]
- [Safari](./Safari)
    - [Close Left Tab](./Safari/Close%20Left%20Tab.applescript)
    - [Close Right Tab](./Safari/Close%20Right%20Tab.applescript)
    - [Duplicate Tab](./Safari/Duplicate%20Tab.applescript)
- [Script Debugger][sdb]
    - [Duplicate Tab][ff203baf]
    - [Duplicate for GitHub][ea9fb946]
    - [Open Used Script Libraries][3c961777]
    - [Save As Text Script][98e99d57]
    - [Toggle Minimal View][3a899b61]

[2f34cbb7]: ./Finder/Monthly%20Cleanups.applescript
[3034f6a6]: ./Keyboard%20Maestro/Edit%20Linked%20or%20In-Line%20AppleScript.applescript
[8111e7c4]: ./Keyboard%20Maestro/Add|Remove%20Status%20Menu%20Trigger
[d1529523]: ./Mail/Set%20Color%20of%20Text.applescript
[63ba2f90]: ./Mail/Make%20Mail%20URL.applescript
[ff203baf]: ./Script%20Debugger/Duplicate%20Tab.applescript
[ea9fb946]: ./Script%20Debugger/Duplicate%20for%20GitHub.applescript
[3c961777]: ./Script%20Debugger/Open%20Used%20Script%20Libraries.applescript
[98e99d57]: ./Script%20Debugger/Save%20As%20Text%20Script.applescript
[3a899b61]: ./Script%20Debugger/Toggle%20Minimal%20View.applescript


<a id="Various"></a>
### Global Scripts

- [Document Closers][docclosers]
    - [Close All Un-Saved Documents][9a704632]
    - [Close All With Saving][3b80a0d2]
    - [Close All Without Saving](./Document%20Closers/Close%20All%20Without%20Saving.applescript)
    - [Close With Saving](./Document%20Closers/Close%20With%20Saving.applescript)
    - [Close Without Saving](./Document%20Closers/Close%20Without%20Saving.applescript)
- [System Control][sc]
    - [Toggle Bluetooth][25e6a902]
    - [Toggle Hazel][d2434bdc]
    - [Toggle Menu Bar Visibility][a517cb4f]
    - [Toggle WiFi](./System%20Control/Toggle%20WiFi.applescript)
- [Various][global]
    - [Click Script Menu][d1c0746f]
    - [Paste Safari URL With Title][1d8d603d]
    - [Start|Stop Quicktime Screen Recording][a921fa5d]]

[9a704632]: ./Document%20Closers/Close%20All%20Un-Saved%20Documents.applescript
[3b80a0d2]: ./Document%20Closers/Close%20All%20With%20Saving.applescript
[25e6a902]: ./System%20Control/Toggle%20Bluetooth.applescript
[a517cb4f]: ./System%20Control/Toggle%20Menu%20Bar%20Visibility.applescript
[d2434bdc]: ./System%20Control/Toggle%20Hazel.applescript
[d1c0746f]: ./Global/Click%20Script%20Menu.applescript
[1d8d603d]: ./Global/Paste%20Safari%20URL%20With%20Title.applescript
[a921fa5d]: ./Global/Start|Stop%20Quicktime%20Screen%20Recording.applescript


---

<a id="licensing--thanks"></a>
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
[kevinsLib]: https://github.com/kevin-funderburg/AppleScript-libraries/blob/master/Kevin's%20Library.applescript

<!-- Sub directories -->
[blob]: https://github.com/kevin-funderburg/AppleScripts/blob/master/
[docclosers]: https://github.com/kevin-funderburg/AppleScripts/tree/master/Document%20Closers
[finder]:https://github.com/kevin-funderburg/AppleScripts/tree/master/Finder
[global]: https://github.com/kevin-funderburg/AppleScripts/tree/master/Global
[km]: ./Keyboard%20Maestro
[mail]: https://github.com/kevin-funderburg/AppleScripts/tree/master/mail
[mit]: https://github.com/kevin-funderburg/AppleScripts/blob/master/LICENSE.txt
[sdb]: ./Script%20Debugger
[sc]: https://github.com/kevin-funderburg/AppleScripts/blob/master/System%20Control

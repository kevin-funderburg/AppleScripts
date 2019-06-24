<p align="center"> <img src="./imgs/script.png"> </p>

# My AppleScripts

Collection of AppleScripts I've developed over the years for many purposes. Some are great as standalone scripts while others are great for incorporation with others.

This is will be continually updated as scripts are developed.


<!-- MarkdownTOC autolink="true" bracket="round" depth="3" autoanchor="true" -->

- [About](#about)
- [Contents](#contents)
    - [Applications](#Applications)
    - [Various](#Various)
- [Licensing & thanks](#licensing--thanks)
- [Changelog](#changelog)

<!-- /MarkdownTOC -->

<a id="about"></a>
## About

These apps are mostly launched via [Keyboard Maestro][kmapp], [Alfred][alfredapp], [BetterTouchTool][bttapp], [Hazel][hazelapp].

Many of these apps depend on this [script library][kevinsLib] I developed, so if you see this at the top of the script, make sure you get that library.
```AppleScript
use kl : script "Kevin's Library"
```

## Contents

<a id="Applications"></a>
### Applications
- [Finder][finder]
    - [Monthly Cleanups](./Finder/Monthly%20Cleanups.applescript)
- [Global][global]
    - [Click Script Menu](./Global/Click%20Script%20Menu.applescript)
    - [Paste Safari URL With Title](./Global/Paste%20Safari%20URL%20With%20Title.applescript)
    - [Start|Stop Quicktime Screen Recording](./Global/Start|Stop%20Quicktime%20Screen%20Recording.applescript)
- [Keyboard Maestro][km]
    - [Edit Linked or In-Line AppleScript](./Keyboard%20Maestro/Edit%20Linked%20or%20In-Line%20AppleScript.applescript)
    - - [Add|Remove Status Menu Trigger](./Keyboard%20Maestro/Add|Remove%20Status%20Menu%20Trigger)
- [Mail][mail]
    - [Set Color of Text](./Mail/Set%20Color%20of%20Text.applescript)
    - [Make Mail URL](./Mail/Make%20Mail%20URL.applescript)
- [Script Debugger][sdb]
    - [Duplicate Tab](./Script%20Debugger/Duplicate%20Tab.applescript)
    - [Duplicate for GitHub](./Script%20Debugger/Duplicate%20for%20GitHub.applescript)
    - [Open Used Script Libraries](./Script%20Debugger/Open%20Used%20Script%20Libraries.applescript)
    - [Save As Text Script](./Script%20Debugger/Save%20As%20Text%20Script.applescript)
    - [Toggle Minimal View](./Script%20Debugger/Toggle%20Minimal%20View.applescript)


<a id="Various"></a>
### Various
- [Document Closers][docclosers]
    - [Close All Un-Saved Documents](./Document%20Closers/Close%20All%20Un-Saved%20Documents.applescript)
    - [Close All With Saving](./Document%20Closers/Close%20All%20With%20Saving.applescript)
- [System Control][sc]
    - [Toggle Bluetooth](./System%20Control/Toggle%20Bluetooth.applescript)
    - [Toggle Hazel](./System%20Control/Toggle%20Hazel.applescript)
    - [Toggle Menu Bar Visibility](./System%20Control/Toggle%20Menu%20Bar%20Visibility.applescript)

---

<a id="licensing--thanks"></a>
## Licensing & thanks
These scripts are released under the [MIT License][mit].


<a id="changelog"></a>
## Changelog

- v1.0.0

### To-Do ###
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

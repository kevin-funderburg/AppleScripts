<p align="center">
<img src="https://folivora.ai/folivora/static/media/btticon.cc0bf8bc.png" width="256" height="256">
</p>

# BetterTouchTool Scripts

Various scripts for use with [BetterTouchTool](https://folivora.ai/).

## Contents

- [BetterTouchTool Library][ej8172hf]
    - This is a AppleScript Library to make scripting BetterTouchTool simpler. The main focus of the library is to simplify the updating/adjusting of triggers.
    - The library itself is a `.scptd` bundle which are not readable on GitHub, so the link above is strictly for readability, if you'd like to download the actual file click [this link](./BetterTouchTool-Library.zip).

    - **Updating triggers**
      - This is done in one of two ways.
        1. Passing a desired `UUID` of a trigger
            - By passing a specified `UUID`, this tells the script to perform an action on a specific trigger.
            - Recall you can get a `UUID` of a trigger with <kbd>⌘</kbd><kbd>⇧</kbd><kbd>C</kbd> while the trigger is selected.
            - The following example will show 3 triggers and hide another

        ```AppleScript
        use bl : script "BetterTouchTool Library"

        set battery to bl's trigger("7950799E-D748-4C77-A1D7-21C8D0EBB0A2")
        set collapse to bl's trigger("B35B0447-8C24-4671-AF81-40C3B0F34DD4")
        set expand to bl's trigger("95C07F03-B99A-4495-BFA5-016A61656C53")
        set _clock to bl's trigger("74FA7B26-C7C9-48D2-BEF6-FEB3C41C3A3F")

        tell battery to button()'s setVisible(true)
        tell _clock to button()'s setVisible(true)
        tell collapse to button()'s setVisible(true)
        tell expand to button()'s setVisible(false)
        ```
        2. Passing `missing value`
            - Passing `missing value` implies that the trigger you want to adjust is the trigger _currently selected within BTT_. The library will then copy the JSON of the selected trigger and create a script object that allows for easy updating.
            - Very useful when making visual changes to the touchbar (especially when mapped to a shortcut key or button) as you can see the result in real time.
            - The following example will set the placement of the currently selected button to the left side of the touchbar:

        ```AppleScript
        tell script "BetterTouchTool Library"
            set trig to trigger(missing value)
            trig's button()'s placement("left")
        end tell
        ```

[ej8172hf]: ./BetterTouchTool-Library.applescript

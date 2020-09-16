<p align="center">
<img src="https://folivora.ai/folivora/static/media/btticon.cc0bf8bc.png" width="256" height="256">
</p>

# BetterTouchTool Scripts

Various scripts for use with [BetterTouchTool](https://folivora.ai/).

## Contents

### [BetterTouchTool Library][ej8172hf]

- This is a AppleScript Library to make scripting BetterTouchTool simpler. The main focus of the library is to simplify the updating/adjusting of triggers.
- The library itself is a `.scptd` bundle which are not readable on GitHub, so the link above is strictly for readability, if you'd like to download the actual file click [this link][jan23nl1].
- For those who are unaware, in order to for the library to function, you must place the `BetterTouchTool.scptd` file in `~/Library/Script Libraries/`

#### Updating triggers

  - This is done in one of two ways.
    1. Passing a desired `UUID` of a trigger
        - By passing a specified `UUID`, this tells the script to perform an action on a specific trigger.
        - Recall you can get a `UUID` of a trigger with <kbd>⌘</kbd><kbd>⇧</kbd><kbd>C</kbd> while the trigger is selected.
        - **Example** - The following example will show the battery, clock, and a right facing arrow, and hide a left facing arrow. I use this to make those widgets appear when I'm in fullscreen

    ```AppleScript
    use bl : script "BetterTouchTool Library"

    tell bl
        set battery to trigger("7950799E-D748-4C77-A1D7-21C8D0EBB0A2")
        set collapse to trigger("B35B0447-8C24-4671-AF81-40C3B0F34DD4")
        set expand to trigger("95C07F03-B99A-4495-BFA5-016A61656C53")
        set _clock to trigger("74FA7B26-C7C9-48D2-BEF6-FEB3C41C3A3F")
    end tell

    tell battery to button()'s setVisible(true)
    tell _clock to button()'s setVisible(true)
    tell collapse to button()'s setVisible(true)
    tell expand to button()'s setVisible(false)
    ```

    2. Passing `missing value`
        - Passing `missing value` implies that the trigger you want to adjust is the trigger _currently selected within BTT_. The library will then copy the JSON of the selected trigger and create a script object that allows for easy updating.
        - Very useful when making visual changes to the touchbar (especially when mapped to a shortcut key or button) as you can see the result in real time.
        - **Examples** - The following are all actual scripts I have mapped to keyboard shortcuts and buttons.
            - Each action is executed individually, not in a row like this, this is just for demonstration:

    ```AppleScript
    tell script "BetterTouchTool Library"
        set trig to trigger(missing value) -- get the currently selected trigger
        ---------------------------
        -- button placement
        ---------------------------
        trig's button()'s placement("left") -- set to left
        trig's button()'s placement("center") -- set to center
        trig's button()'s placement("right") -- set to right
        ---------------------------
        -- button freespace
        ---------------------------
        trig's freeSpace()'s increment() -- increase by 1
        trig's freeSpace()'s decrement() -- decrease by 1
        -- set to custom size
        set n to text returned of (display dialog "Enter free space" default answer "5" buttons {"Cancel", "OK"} default button "OK") as number
        trig's freeSpace()'s setTo(n)
        ---------------------------
        -- button padding
        ---------------------------
        trig's padding()'s increment() -- increase by 1
        trig's padding()'s decrement() -- decrease by 1
        -- set custom padding
        set n to text returned of (display dialog "Enter font size" default answer "15" buttons {"Cancel", "OK"} default button "OK") as number
        trig's padding()'s setTo(n)
        ---------------------------
        -- button radius
        ---------------------------
        trig's radius()'s decrement() -- increase by 1
	    trig's radius()'s increment() -- decrease by 1
        trig's radius()'s apply("left") -- apply radius left
        trig's radius()'s apply("all") -- apply radius all
        trig's radius()'s apply("right")  -- apply radius right
        ---------------------------
        -- change modifier keys
        ---------------------------
        trig's setModKey("cmd")
        ---------------------------
        -- icon adjustments
        ---------------------------
        trig's button()'s toggleIconOnly() -- toggle icon only
        trig's button()'s setIconSize(18) -- set icon size to fixed size
        -- set to custom size with prompt
        set n to text returned of (display dialog "Enter icon size" default answer "22" buttons {"Cancel", "OK"} default button "OK") as number
        trig's button()'s setIconSize(n)
        ---------------------------
        -- button adjustments
        ---------------------------
        trig's button()'s setColor("red") -- set color button color
        trig's font()'s setColor("blue") -- set font color
        -- set custom font size with prompt
        set n to text returned of (display dialog "Enter font size" default answer "15" buttons {"Cancel", "OK"} default button "OK") as number
        trig's font()'s setSize(n)
        ---------------------------
        -- add actions to trigger
        ---------------------------
        trig's addAction("AppleScript (async)")
        trig's addAction("AppleScript (blocking)")
        trig's addAction("Select Menu Item")
        ---------------------------
        -- set value of a trigger's AppleScript action without having to view it
        ---------------------------
        set _script to the clipboard
        trig's setInlineAppleScript(_script)

    end tell
    ```

    - Heres a screen shot of my touchbar in BTT using these kind of examples
    ![bttbuttons](../imgs/bttButtons.png)

#### Performing BTT Actions

- If you want to perform a spcific BTT via AppleScript normally, you need to know the predefined action type (example below)

```AppleScript
tell application "BetterTouchTool" to trigger_action "{\"BTTPredefinedActionType\" : 188}"
```

- This works great but I don't like trying to keep track of the numbers so this library has several actions that I commonly used stored so you can execute it by the actions name instead.

```AppleScript
tell script "BetterTouchTool Library" to triggerAction("Toggle BetterTouchTool Touch Bar")
```

[ej8172hf]: ./BetterTouchTool-Library.applescript
[jan23nl1]: ./BetterTouchTool-Library.zip

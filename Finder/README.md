# Finder scripts

Various scripts for use in Finder.

> Although not needed, the shortcut keys I use to execute these via [Keyboard Maestro][kmapp] or [Alfred][alfredapp] are included in case you're interested

## Contents

- [Go to Custom Folder][fb40138e] <kbd>too many to list</kbd>
    - Script that lets you jump to any folder you like in an instant, works exactly like the `Finder` > `Go` menu, but you add your favorite folders.
    - **How to** - Duplicate the script for each folder you want, and update the `t` variable to the HFS path of the folder you want.
> I use this script for about 8 different folders that I'm constantly in and out of.

- [Monthly Cleanups](./Monthly%20Cleanups.applescript)

  - Clean up old files in `~/Downloads` or `~/Desktop` by consolidating files > 2 weeks old into a folder with the current month and year, then consolidate that folder into a "Cleanups" folder.
  - I generally use [Hazel](https://www.noodlesoft.com/) to execute this script, but it can be run via the Script Menu, or through the command line using

    ```shell
    osascript 'Monthly Cleanups.scpt' "desktop"
    ```

  - I've used this method for years to keep these folders tidy and I love it, here's an example of what the result looks like.

    ![](../imgs/folderCleaner.png)

- [Open Selection in iTerm](./Open%20Selection%20in%20iTerm.applescript) <kbd>⌥</kbd><kbd>⇧</kbd><kbd>T</kbd>
    - Open [iTerm](https://www.iterm2.com/) and change directory to the current location in Finder. Super useful if you are on the command-line a lot.

[fb40138e]: ./Go-to-Custom-Folder.applescript
[kmapp]: https://www.keyboardmaestro.com/
[alfredapp]: https://www.alfredapp.com/

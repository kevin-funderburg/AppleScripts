# System Control

Various scripts for System Control use.

## Contents

- [Restart AirPort Extreme](./Restart%20AirPort%20Extreme.applescript)

- [Toggle Bluetooth](./Toggle%20Bluetooth.applescript)

- [Toggle Hazel](./Toggle%20Hazel.applescript)

- [Toggle Menu Bar Visibility](./Toggle%20Menu%20Bar%20Visibility.applescript) → [open script in your script editor][22cc6e8e]

- [Toggle WiFi](./Toggle%20WiFi.applescript)



[22cc6e8e]: applescript://com.apple.scripteditor?action=new&script=use%20scripting%20additions%0Atell%20application%20%22System%20Events%22%0A%09%0A%09tell%20process%20%22System%20Preferences%22%20to%20activate%0A%09%0A%09tell%20application%20%22System%20Preferences%22%0A%09%09set%20current%20pane%20to%20pane%20%22com.apple.preference.general%22%0A%09end%20tell%0A%09%0A%09tell%20process%20%22System%20Preferences%22%0A%09%09%0A%09%09set%20failSafe%20to%200%0A%09%09repeat%20until%20checkbox%205%20of%20window%201%20exists%0A%09%09%09delay%200.1%0A%09%09%09set%20failSafe%20to%20failSafe%20+%201%0A%09%09%09if%20failSafe%20=%20100%20then%20error%20%22Script%20timeout%22%0A%09%09end%20repeat%0A%09%09%0A%09%09set%20thecheckbox%20to%20checkbox%205%20of%20window%201%0A%09%09set%20theValue%20to%20value%20of%20thecheckbox%0A%09%09set%20failSafe%20to%200%0A%09%09%0A%09%09repeat%20until%20theValue%20is%20not%20value%20of%20thecheckbox%20%C2%AC%0A%09%09%09or%20failSafe%20is%2010%0A%09%09%09click%20thecheckbox%0A%09%09%09set%20failSafe%20to%20failSafe%20+%201%0A%09%09%09delay%200.1%0A%09%09end%20repeat%0A%09%09%0A%09end%20tell%0A%09%0A%09tell%20application%20%22System%20Preferences%22%20to%20quit%0Aend%20tell%0A

#Requires AutoHotkey v2.0
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 2

; Get the path to the BetterDiscord installer from the command-line arguments
installerPath := A_Args[1]

; Run the BetterDiscord installer
Run(installerPath)
WinWaitActive("BetterDiscord")
Sleep(3000)
    
; Automate the installer prompts
Send "{Tab 3}{Enter}"
Sleep 300
Send "{Tab 4}{Enter}"
Sleep 300
Send "{Enter}"
Sleep 300
Send "{Tab}{Enter}{Tab 10}{Enter}"
Sleep 5000
Send "{Tab 8}{Enter}"


; If we reach this point, assume success
ExitApp(0)

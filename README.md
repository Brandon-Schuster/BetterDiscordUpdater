# BetterDiscord Auto Installer

This repository contains a script to automatically download, install, and set up BetterDiscord on a Windows machine. The script also ensures Discord is running after the installation completes.

## How It Works

The script performs the following steps:
1. Downloads the latest BetterDiscord installer.
2. Uses an AutoHotkey script to automate the installation process.
3. Monitors the BetterDiscord installer to ensure it completes.
4. Checks if Discord is running and starts it if it's not.

## Files in the Repository

- `BetterDiscordUpdater.ps1`: The main PowerShell script that coordinates the download and installation of BetterDiscord.
- `BetterDiscordAutoKey.ahk`: The AutoHotkey script that automates the BetterDiscord installation process.

## How to Use

1. **Ensure Prerequisites**:
   - PowerShell 5.1 or later.
   - AutoHotkey v2.0.

2. **Clone the Repository**:
   ```sh
   git clone https://github.com/yourusername/BetterDiscordAutoInstaller.git
   cd BetterDiscordAutoInstaller

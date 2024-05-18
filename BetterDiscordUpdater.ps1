# Define the current directory
$currentDir = (Get-Location).Path
Write-Output "Current Dir: $currentDir"

# Define the URL for the latest BetterDiscord installer
$downloadUrl = "https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Windows.exe"

# Define the path to save the installer
$installerPath = "$currentDir\BetterDiscord-Windows.exe"
Write-Output "Installer Path: $installerPath"
# Function to download the file using WebClient
function Download-File {
    param (
        [string]$url,
        [string]$outputPath
    )

    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($url, $outputPath)
}

# Function to check if the download was successful
function Test-Download {
    param (
        [string]$path
    )
    if (Test-Path -Path $path) {
        Write-Output "Download was successful..."
    } else {
        Write-Output "Download failed..."
        exit 1
    }
}

# Download the installer using WebClient
try {
    Write-Output "Downloading BetterDiscord Installer..."
    Download-File -url $downloadUrl -outputPath $installerPath
    Test-Download -path $installerPath
    Start-Sleep -Seconds 1
} catch {
    Write-Output "Error downloading BetterDiscord Installer: $_"
    Start-Sleep -Seconds 5
    exit 1
}

# Start the AutoHotkey script which will run the installer and handle all the prompts
try {
    Write-Output "Starting AutoHotkey script to automate BetterDiscord installation..."
    Start-Process -FilePath "$currentDir\BetterDiscordAutoKey.ahk" -ArgumentList "$installerPath" -PassThru
    Write-Output "AutoHotkey script has started."
} catch {
    Write-Output "Error starting AutoHotkey script: $_"
    exit 1
}

# Monitor the BetterDiscord process
try {
    Write-Output "Waiting for BetterDiscord installer to complete..."
    do {
        Start-Sleep -Seconds 2
        $betterDiscordProcess = Get-Process | Where-Object { $_.Path -eq "$installerPath" } -ErrorAction SilentlyContinue
    } while ($betterDiscordProcess)

    Write-Output "BetterDiscord installation completed..."
    Write-Output "Removing BetterDiscord Installer..."
    Remove-Item -Path "$installerPath" -Force
} catch {
    Write-Output "Error monitoring BetterDiscord installer: $_"
    Start-Sleep -Seconds 5
    exit 1
}

# Start Discord
try {
    Write-Output "Starting Discord..."
    Start-Process -FilePath "$env:LOCALAPPDATA\Discord\Update.exe" -ArgumentList "--processStart Discord.exe" -Wait
    Write-Output "Discord started successfully..."
    Write-Output "Update complete!"
    Start-Sleep -Seconds 10
    exit 0
} catch {
    Write-Output "Error starting Discord: $_"
    Start-Sleep -Seconds 5
    exit 1
}
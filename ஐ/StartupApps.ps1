
# Create Windows startup registry entries for the Zenith portable folder.
# Run as Administrator because the Everything entry uses HKLM.

$ErrorActionPreference = 'Stop'

$hkcuRun = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'
$hklmRun = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run'

# Check for Administrator privileges (required for HKLM).
$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = [Security.Principal.WindowsPrincipal]::new($identity)
$isAdmin = $principal.IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)

if (-not $isAdmin) {
    throw 'Please run PowerShell as Administrator and try again.'
}

# Ensure the registry keys exist.
New-Item -Path $hkcuRun -Force | Out-Null
New-Item -Path $hklmRun -Force | Out-Null

# Machine-wide startup entry.
$machineEntries = [ordered]@{
    'Everything' = '"%Zenith%\Apps\Find\Everything\everything64.exe" -startup'
}

# Current-user startup entries.
$userEntries = [ordered]@{
    'BgKural'        = '"%Zenith%\Apps\Tools\BGKural\Bgkural.bat"'
    'DesktopTicker'  = '"%Zenith%\Apps\Media\DesktopTicker\DesktopTicker.exe"'
    'DiCom'          = '"%Zenith%\Apps\Edit\Abbrv\DiCom.exe"'
    'Ditto'          = '"%Zenith%\Apps\Edit\Ditto\Ditto.exe"'
    'Executor'       = '"%Zenith%\PortableApps\Executor\Executor.exe" -s'
    'Flow.Launcher'  = '"%Zenith%\PortableApps\FlowLauncher\app-2.1.4\Flow.Launcher.exe"'
    'IniyaTamil'     = '"%Zenith%\Apps\Tools\Keyboard\IniyaTamil\IniyaTamil.exe"'
    'Keypirinha'     = '"%Zenith%\PortableApps\Keypirinha\keypirinha.exe" --autorun'
    'RocketDock'     = '"%Zenith%\PortableApps\RocketDock\RocketDock.exe"'
    'Expanso'        = '"%Zenith%\Apps\Edit\Abbrv\Espanso\START_ESPANSO.bat"'
    'Workrave'       = '"%Zenith%\Apps\Tools\WorkRave\lib\workrave.exe"'
    'WinLaunch'      = '"%Zenith%\PortableApps\WinLaunch\WinLaunch.exe" -hide'
}

# Write REG_EXPAND_SZ values so Windows can expand %Zenith%.
foreach ($entry in $machineEntries.GetEnumerator()) {
    New-ItemProperty `
        -Path $hklmRun `
        -Name $entry.Key `
        -Value $entry.Value `
        -PropertyType ExpandString `
        -Force | Out-Null

    Write-Host "Created HKLM startup entry: $($entry.Key)"
}

foreach ($entry in $userEntries.GetEnumerator()) {
    New-ItemProperty `
        -Path $hkcuRun `
        -Name $entry.Key `
        -Value $entry.Value `
        -PropertyType ExpandString `
        -Force | Out-Null

    Write-Host "Created HKCU startup entry: $($entry.Key)"
}

Write-Host ''
Write-Host 'All startup registry entries have been created.' -ForegroundColor Green

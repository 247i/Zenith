# Paths to add to the user PATH
$PathsToAdd = @(
    (Join-Path $env:Zenith 'Apps\.github\Git.Ext\Git\bin')
    (Join-Path $env:Zenith 'Apps\.github\Gource')
)

# Get the existing user PATH
$UserPath = [Environment]::GetEnvironmentVariable('Path', 'User')

# Convert the existing PATH into a list of entries
$ExistingPaths = @(
    $UserPath -split ';' |
    Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
    ForEach-Object { $_.Trim().TrimEnd('\') }
)

# Add each requested directory if it exists and is not already present
foreach ($PathToAdd in $PathsToAdd) {
    if (-not (Test-Path -LiteralPath $PathToAdd -PathType Container)) {
        Write-Warning "Directory not found: $PathToAdd"
        continue
    }

    $NormalizedPath = $PathToAdd.TrimEnd('\')

    if ($ExistingPaths -contains $NormalizedPath) {
        Write-Host "Already in user PATH: $PathToAdd"
        continue
    }

    $ExistingPaths += $NormalizedPath
    Write-Host "Added to user PATH: $PathToAdd"
}

# Save the updated user PATH
$NewUserPath = $ExistingPaths -join ';'
[Environment]::SetEnvironmentVariable('Path', $NewUserPath, 'User')

Write-Host "`nUser PATH updated successfully."
Write-Host "Open a new terminal for the changes to take effect."
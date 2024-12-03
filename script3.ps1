# Define the archive folder path
$archiveFolderPath = "./archive"

# Create the 'archive' folder if it doesn't exist
if (!(Test-Path -Path $archiveFolderPath)) {
    New-Item -ItemType Directory -Path $archiveFolderPath | Out-Null
    Write-Host "Created 'archive' folder at $archiveFolderPath"
}

# Get all directories in the current directory
$existingFolders = Get-ChildItem -Path "./" -Directory

# Check if there are any folders to move
if ($existingFolders.Count -eq 0) {
    Write-Host "No folders found to move to archive."
    exit
}

# Move each folder to the archive folder
foreach ($folder in $existingFolders) {
    $destinationPath = "$archiveFolderPath/$($folder.Name)"

    # If a folder with the same name exists in the archive, append a timestamp
    if (Test-Path -Path $destinationPath) {
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        $destinationPath = "$archiveFolderPath/$($folder.Name)_$timestamp"
    }

    Move-Item -Path $folder.FullName -Destination $destinationPath
    Write-Host "Moved folder $($folder.Name) to $destinationPath"
}

Start-Sleep -Seconds 1.5
Invoke-Expression -Command "./script4.ps1"
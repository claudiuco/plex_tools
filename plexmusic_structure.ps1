# Set the source directory, like the Music folder that's unstructured
$sourceDirectory = "<insert here>"

# Set the destination directory - this is the one you'll add to your Plex media library
$destinationDirectory = "<insert here>"

# Create the destination directory if it does not exist
if (-not (Test-Path $destinationDirectory)) {
    New-Item -ItemType Directory -Path $destinationDirectory | Out-Null
}

# Get all files in the source directory - they have to comply with the Plex music naming convention, take a look in the Readme file.
$files = Get-ChildItem -Path $sourceDirectory

# Iterate through each file, duh!
foreach ($file in $files) {
    # Parse the filename to extract information, this is why it was important to respect the naming convention
    $fileName = $file.Name -replace '\.\w+$'
    $parts = $fileName -split ' - '

    # Extract artist, album, and track name, I chose to ignore the track number, if you need the track numbers, you may delete this part
    $artist = $parts[0].Trim()
    $album = $parts[1].Trim()
    $trackName = $parts[3].Trim()

    # Create artist directory if it does not exist
    $artistDirectory = Join-Path $destinationDirectory $artist
    if (-not (Test-Path $artistDirectory)) {
        New-Item -ItemType Directory -Path $artistDirectory | Out-Null
    }

    # Create album directory if it does not exist
    $albumDirectory = Join-Path $artistDirectory $album
    if (-not (Test-Path $albumDirectory)) {
        New-Item -ItemType Directory -Path $albumDirectory | Out-Null
    }

    # Create the new file path with the original extension
    $newFilePath = Join-Path $albumDirectory ("$trackName" + $file.Extension)

    # Copy the file to the new location and rename it
    Copy-Item -Path $file.FullName -Destination $newFilePath -Force
}

Write-Host "Congrats! Now you may copy me $destinationDirectory to your Plex Music server." 

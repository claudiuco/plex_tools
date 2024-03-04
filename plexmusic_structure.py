# importing some libraries, if you don't have them, try install them using pip
import os
import shutil

# Set the source directory
source_directory = "C:\\Users\\Claudiu Costin\\Music"

# Set the destination directory
destination_directory = "E:\\Music_Plex"

# Create the destination directory if it does not exist
if not os.path.exists(destination_directory):
    os.makedirs(destination_directory)

# Get all files in the source directory
files = os.listdir(source_directory)

# Iterate through each file
for file_name in files:
    # Parse the filename to extract information
    file_path = os.path.join(source_directory, file_name)
    parts = file_name.rsplit('.', 1)[0].split(' - ')

    # Ensure the filename structure is as expected
    if len(parts) < 4:
        print(f"Skipping file: {file_name}. Unexpected filename structure.")
        continue

    # Extract artist, album, and track name
    artist = parts[0].strip()
    album = parts[1].strip()
    track_name = parts[3].strip()

    # Create artist directory if it does not exist
    artist_directory = os.path.join(destination_directory, artist)
    if not os.path.exists(artist_directory):
        os.makedirs(artist_directory)

    # Create album directory if it does not exist
    album_directory = os.path.join(artist_directory, album)
    if not os.path.exists(album_directory):
        os.makedirs(album_directory)

    # Create the new file path with the original extension
    new_file_path = os.path.join(album_directory, f"{track_name}{os.path.splitext(file_name)[1]}")

    # Copy the file to the new location and rename it
    shutil.copy(file_path, new_file_path)

print("Congrats! Now you may copy me", destination_directory, "to your Plex Music server")

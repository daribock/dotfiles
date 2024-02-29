import os
import eyeD3

# Prompt for the text to search for in the file names
target_text = input("Enter the text to search for in the file names (e.g., 'EV'): ")

# Prompt for the new author
new_author = input("Enter the new author name: ")

# Prompt for the path to the cover image
cover_path = input("Enter the path to the new cover image (e.g., '/path/to/cover.jpg'): ")

# Directory containing your MP3 files (current directory)
mp3_directory = os.getcwd()

# Loop through MP3 files in the directory, check if their names contain the target text, and update the author and cover art
for filename in os.listdir(mp3_directory):
    if filename.endswith(".mp3") and target_text in filename:
        file_path = os.path.join(mp3_directory, filename)

        # Update author tag
        tag = eyeD3.Tag()
        tag.link(file_path)
        tag.setArtist(new_author)
        tag.update()

        # Update cover art
        tag = eyeD3.Tag()
        tag.link(file_path)
        tag.removeImages()
        tag.addImage(3, cover_path, "image/jpeg", "Front Cover")
        tag.update()
        
        print(f"Updated author and cover art for {filename}")


#!/bin/bash

# Function to check if a package is installed
check_package() {
    if brew ls --versions "$1" >/dev/null; then
        return 0
    else
        return 1
    fi
}

# Array of required packages
required_packages=("ffmpeg" "eye-d3")

# Check if each required package is installed
for package in "${required_packages[@]}"; do
    if ! check_package "$package"; then
        read -p "Package '$package' is not installed. Do you want to install it with Homebrew? (y/n): " answer
        case "$answer" in
            [yY]|[yY][eE][sS])
                brew install "$package"
                ;;
            *)
                echo "Stopping script. Please install '$package' manually and rerun the script."
                exit 1
                ;;
        esac
    fi
done

# Ask for user input
read -p "Enter Subject: " subject
read -p "Enter City: " city
read -p "Enter Teacher: " teacher

# Set date format
date_format="%Y%m%d"

# Path to your cover image
cover_image_path="/Users/bockdar/Documents/RBTC audio/logo.jpg"

# Destination folder for processed files
destination_folder="../bearbeitet"

# Create the destination folder if it doesn't exist
mkdir -p "$destination_folder"

# Loop through WAV files in the current directory
for file in *.WAV *.wav; do
    if [ -e "$file" ]; then
        # Extract information from the filename
        filename=$(basename "$file")
        extension="${filename##*.}"
        filename_no_ext="${filename%.*}"

        # Convert WAV to mp3 and place in the destination folder
        ffmpeg -i "$file" -q:a 0 -map a "$destination_folder/${filename_no_ext}.mp3"

        # Update cover art, author tag, and rename the file
        eyeD3 --add-image="$cover_image_path":FRONT_COVER "$destination_folder/${filename_no_ext}.mp3"
        eyeD3 --artist="$teacher" "$destination_folder/${filename_no_ext}.mp3"
        eyeD3 --to-v2.4 "$destination_folder/${filename_no_ext}.mp3"
        # TODO: Get correct name
        # eyeD3 --title="$subject" "$destination_folder/${filename_no_ext}.mp3"
        eyeD3 --album="$subject" "$destination_folder/${filename_no_ext}.mp3"
        # TODO: How to get index
        # eyeD3 --track="01" "$destination_folder/${filename_no_ext}.mp3"

        # TODO: Optionally, remove the original WAV file
        # rm "$file"
    fi
done

echo "Conversion and metadata update complete."

#!/bin/bash

# ================= CONFIGURATION =================
# Path to your main Music directory (use absolute path)
MUSIC_DIR="/home/jackson/Music"

# Path to the .m3u playlist you want to update
PLAYLIST_FILE="/home/jackson/.config/mpd/playlists/AutoPlaylist.m3u"

# Supported audio file extensions (pipe-separated)
AUDIO_EXTS="mp3|flac|wav|m4a|ogg|aac|wma"
# =================================================

# Check if inotifywait is installed
if ! command -v inotifywait &> /dev/null; then
    echo "Error: inotify-tools is not installed."
    exit 1
fi

# Create playlist file with a standard header if it doesn't exist
if [ ! -f "$PLAYLIST_FILE" ]; then
    echo "#EXTM3U" > "$PLAYLIST_FILE"
fi

# Enable case-insensitive matching for the audio extensions
shopt -s nocasematch

echo "Monitoring '$MUSIC_DIR' for new songs..."

# Watch recursively (-r) for files that finish writing (close_write) or are moved in (moved_to)
inotifywait -m -r -e close_write -e moved_to --format '%w%f' "$MUSIC_DIR" | while read -r FILE_PATH; do
    
    # Ignore the playlist file itself if it's stored inside the Music directory
    if [[ "$FILE_PATH" == "$PLAYLIST_FILE" ]]; then
        continue
    fi

    # Check if the new file matches our allowed audio extensions
    if [[ "$FILE_PATH" =~ \.($AUDIO_EXTS)$ ]]; then
        
        # Check for exact string duplicate in the playlist (-F = fixed string, -x = whole line matching)
        if ! grep -Fxq "$FILE_PATH" "$PLAYLIST_FILE"; then
            echo "New song detected: $FILE_PATH"
            
            # Use a temporary file to safely write to the top of the playlist 
            # (This avoids special character escaping issues with commands like 'sed')
            TMP_PLAYLIST=$(mktemp)
            FIRST_LINE=$(head -n 1 "$PLAYLIST_FILE" 2>/dev/null)
            
            if [[ "$FIRST_LINE" == *"#EXTM3U"* ]]; then
                # Keep the #EXTM3U header at the top
                echo "#EXTM3U" > "$TMP_PLAYLIST"
                echo "$FILE_PATH" >> "$TMP_PLAYLIST"
                # Append the rest of the existing playlist
                tail -n +2 "$PLAYLIST_FILE" >> "$TMP_PLAYLIST"
            else
                # No header, just put it at line 1
                echo "$FILE_PATH" > "$TMP_PLAYLIST"
                cat "$PLAYLIST_FILE" >> "$TMP_PLAYLIST"
            fi
            
            # Atomically replace the old playlist with the updated one
            mv "$TMP_PLAYLIST" "$PLAYLIST_FILE"
            echo "-> Added to the top of the playlist."
        else
            echo "Duplicate ignored: $FILE_PATH"
        fi
    fi
done

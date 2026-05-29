#!/usr/bin/env bash

WALLPAPER_DIR="/home/ndrax/Pictures/wallpapers"

# Select a random image
NEW_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

if [ -n "$NEW_WALLPAPER" ]; then
    # 1. Preload the new image into memory
    hyprctl hyprpaper preload "$NEW_WALLPAPER"
    
    # 2. Apply it to all monitors (note the comma before the path)
    hyprctl hyprpaper wallpaper ",$NEW_WALLPAPER"
    
    # 3. Unload unused images to free RAM
    hyprctl hyprpaper unload unused
fi   

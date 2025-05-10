#!/bin/bash

WALLPAPER_DIR="/home/dk/Pictures/Wallpaper"

# Pick a random file safely
WALLPAPER=$(find "$WALLPAPER_DIR" -type f -print0 | shuf -z -n 1 | tr -d '\0')

# Smooth fade transition
swww img "$WALLPAPER" --transition-type fade --transition-duration 0.1


#!/bin/bash

WALLPAPER_DIR="/home/dk/Pictures/Wallpaper"

# Pick a random file safely
WALLPAPER=$(find "$WALLPAPER_DIR" -path "$WALLPAPER_DIR/.git" -prune -o -type f -print0 | shuf -z -n 1 | tr -d '\0')

# Smooth fade transition
swww img "$WALLPAPER" --transition-type fade --transition-duration 0.1


#!/bin/bash

ZIP_URL="https://github.com/OutlawedDev/Firely/releases/download/2.0.0/Firely.Interface.app.zip"
DEST="$HOME/Desktop/Firely.Interface.app.zip"
APP_PATH="$HOME/Desktop/Firely.Interface.app"

echo "⬇️ Downloading app..."
curl -L -o "$DEST" "$ZIP_URL"

echo "🗜 Unzipping..."
unzip -q "$DEST" -d "$HOME/Desktop"

echo "🚫 Removing quarantine attributes..."
xattr -dr com.apple.quarantine "$APP_PATH"

echo "🧹 Cleaning up ZIP file..."
rm "$DEST"

echo "✅ App ready at: $APP_PATH"

echo "🚀 Launching app..."
open "$APP_PATH"

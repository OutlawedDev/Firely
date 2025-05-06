#!/bin/bash

echo "🟣 Downloading Firely Interface Suite..."

# Direct DMG download URL
DOWNLOAD_URL="https://github.com/OutlawedDev/Firely-Interface-Suite/releases/download/0.1.0/Firely.Interface_0.1.0_universal.dmg"

# Local filename
DMG_NAME="Firely.Interface_0.1.0_universal.dmg"

# Mount point name
MOUNT_DIR="/Volumes/Firely Interface"

# Download the DMG
curl -L -o "$DMG_NAME" "$DOWNLOAD_URL"

echo "✅ Download complete."

# Mount the DMG
echo "📦 Mounting the installer..."
hdiutil attach "$DMG_NAME" -mountpoint "$MOUNT_DIR" -nobrowse -quiet

# Copy app to Applications folder
echo "📥 Copying Firely Interface Suite to /Applications..."
cp -R "$MOUNT_DIR/Firely Interface.app" /Applications/

# Remove quarantine flag to bypass Gatekeeper
echo "🔓 Removing quarantine flag..."
xattr -dr com.apple.quarantine "/Applications/Firely Interface.app"

# Unmount DMG
echo "💾 Cleaning up..."
hdiutil detach "$MOUNT_DIR" -quiet

echo "✅ Firely Interface Suite installed and ready to use."

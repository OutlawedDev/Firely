#!/bin/bash

echo "🟣 Downloading Firely Interface Suite..."

DOWNLOAD_URL="https://github.com/OutlawedDev/Firely-Interface-Suite/releases/download/0.1.0/Firely.Interface_0.1.0_universal.dmg"
DMG_FILE="Firely.Interface_0.1.0_universal.dmg"

curl -L -o "$DMG_FILE" "$DOWNLOAD_URL"
echo "✅ Download complete."

echo "📦 Mounting DMG..."
MOUNT_OUTPUT=$(hdiutil attach "$DMG_FILE" -nobrowse -quiet)
MOUNT_POINT=$(echo "$MOUNT_OUTPUT" | grep -o '/Volumes/[^"]*')

if [ -z "$MOUNT_POINT" ]; then
  echo "❌ Failed to mount the DMG."
  exit 1
fi

APP_NAME="Firely Interface.app"
APP_PATH="$MOUNT_POINT/$APP_NAME"

if [ ! -d "$APP_PATH" ]; then
  echo "❌ App not found in DMG."
  hdiutil detach "$MOUNT_POINT"
  exit 1
fi

echo "📥 Installing to /Applications..."
sudo cp -R "$APP_PATH" /Applications/

echo "🔓 Removing quarantine flag..."
sudo xattr -dr com.apple.quarantine "/Applications/$APP_NAME"

echo "💾 Unmounting..."
hdiutil detach "$MOUNT_POINT" -quiet

echo "✅ Firely Interface Suite installed successfully."

#!/bin/bash

ZIP_URL="https://github.com/your-user/your-repo/releases/download/v1.0/Firely.Interface.app.zip"
TMP_ZIP="/tmp/Firely.Interface.app.zip"
UNZIP_DIR="/tmp/firely_unzip"
APP_NAME="Firely Interface.app"
DEST_DIR="$HOME/Downloads"

echo "⬇️ Downloading app zip..."
curl -L -o "$TMP_ZIP" "$ZIP_URL"

echo "🗜 Unzipping..."
rm -rf "$UNZIP_DIR"
mkdir -p "$UNZIP_DIR"
unzip -q "$TMP_ZIP" -d "$UNZIP_DIR"

# 🧹 Delete __MACOSX if it appears
MACOSX_FOLDER="$UNZIP_DIR/__MACOSX"
if [ -d "$MACOSX_FOLDER" ]; then
  echo "🧹 Removing __MACOSX folder..."
  rm -rf "$MACOSX_FOLDER"
fi

echo "📁 Moving app to Downloads..."
mv -f "$UNZIP_DIR/$APP_NAME" "$DEST_DIR/$APP_NAME"

echo "🔐 Removing quarantine flag..."
xattr -dr com.apple.quarantine "$DEST_DIR/$APP_NAME"

echo "🧼 Cleaning up temp files..."
rm -rf "$TMP_ZIP" "$UNZIP_DIR"

echo "✅ App is ready in Downloads."
echo "🚀 Launching app..."
open "$DEST_DIR/$APP_NAME"

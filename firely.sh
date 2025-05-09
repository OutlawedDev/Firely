#!/bin/bash

APP_NAME="Firely Interface"
APP_URL="https://github.com/OutlawedDev/Firely/releases/download/2.0.0/Firely.Interface.app.zip"
ZIP_PATH="$HOME/Downloads/$APP_NAME.zip"
EXTRACT_DIR="$HOME/Downloads/$APP_NAME-Extract"

echo "⬇️ Downloading $APP_NAME..."
curl -L -o "$ZIP_PATH" "$APP_URL"

echo "🗂 Unzipping..."
mkdir -p "$EXTRACT_DIR"
unzip -q "$ZIP_PATH" -d "$EXTRACT_DIR"

APP_PATH=$(find "$EXTRACT_DIR" -name "*.app" -type d | head -n 1)

if [ -d "$APP_PATH" ]; then
    echo "📦 Moving $APP_NAME to /Applications..."
    mv "$APP_PATH" "$HOME/Applications/" 2>/dev/null || sudo mv "$APP_PATH" /Applications/

    echo "🔓 Prompting macOS for permissions (Gatekeeper)..."
    APP_FINAL_PATH="/Applications/$APP_NAME.app"
    open -a "$APP_FINAL_PATH"

    echo "✅ $APP_NAME is ready to run. You may be prompted to approve it in System Settings > Privacy & Security."
else
    echo "❌ Failed to find .app in extracted files."
fi

# 🧹 Cleanup
rm -rf "$ZIP_PATH" "$EXTRACT_DIR"

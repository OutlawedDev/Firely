#!/bin/bash

APP_NAME="Firely Interface"
APP_DIR="$HOME/Desktop/$APP_NAME.app"
CONTENTS="$APP_DIR/Contents"
MACOS="$CONTENTS/MacOS"
RESOURCES="$CONTENTS/Resources"

echo "🛠 Creating bundle structure..."
mkdir -p "$MACOS"
mkdir -p "$RESOURCES"

echo "⬇️ Downloading app files..."

curl -L -o "$MACOS/Firely Interface" "https://github.com/OutlawedDev/Firely/releases/download/2.0.0/Firely.Interface.app.zip"
curl -L -o "$CONTENTS/Info.plist" "https://raw.githubusercontent.com/alexkkork/ui-testing/main/Firely%20Interface.app/Contents/Info.plist"
curl -L -o "$RESOURCES/icon.icns" "https://raw.githubusercontent.com/alexkkork/ui-testing/main/Firely%20Interface.app/Contents/Resources/icon.icns"

echo "🔐 Setting permissions..."
chmod +x "$MACOS/Firely Interface"

echo "✅ App created: $APP_DIR"
open -R "$APP_DIR"

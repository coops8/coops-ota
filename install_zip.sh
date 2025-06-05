#!/data/data/com.termux/files/usr/bin/bash

echo "🛠️ CoopsOS OTA Zip Installer"
echo "------------------------------"

ZIP_DIR="$HOME/CoopsOS/coops-ota/output_zips"

if [ ! -d "$ZIP_DIR" ]; then
    echo "❌ OTA output directory not found: $ZIP_DIR"
    exit 1
fi

cd "$ZIP_DIR" || exit

echo "📦 Available OTA ZIPs:"
select zip_file in *.zip; do
    if [ -n "$zip_file" ]; then
        echo "✅ Selected: $zip_file"
        break
    else
        echo "⚠️ Invalid selection. Try again."
    fi
done

echo "🔍 Verifying zip..."
if unzip -t "$zip_file" > /dev/null; then
    echo "✅ Zip file is valid!"
else
    echo "❌ Zip file is corrupt."
    exit 1
fi

# Simulated install path for testing
INSTALL_PATH="$HOME/CoopsOS/installed_ota"

echo "📂 Installing to: $INSTALL_PATH"
mkdir -p "$INSTALL_PATH"
unzip -o "$zip_file" -d "$INSTALL_PATH" > /dev/null

echo "🚀 OTA Update Installed!"
echo "📍 Location: $INSTALL_PATH"

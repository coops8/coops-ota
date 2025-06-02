echo "CoopsOS OTA GitHub Template Structure"

echo "-------------------"

echo "📁 Directory Layout"

echo "-------------------"

echo "coops-ota/"

echo "├── ota_config_wizard.py"        # 🔧 The terminal-based OTA wizard script

echo "├── coops_ota_launcher.sh"       # 🚀 Shell launcher script (symlink this as coops-ota)

echo "├── update/"                     # 📦 Folder containing update files to be zipped

echo "├── output_zips/"                # 📁 Generated OTA zips land here

echo "├── README.md"                   # 📘 Usage guide and documentation

echo "└── .gitignore"                  # 🛡️ Ignore compiled files, zips, temp files

echo "---------------------------"

echo "📜 File: ota_config_wizard.py"

echo "---------------------------"

import os import shutil import time from zipfile import ZipFile

def bundle_zip(source_dir, output_dir): timestamp = time.strftime("%Y%m%d-%H%M%S") zip_name = f"CoopsOS-OTA-{timestamp}.zip" zip_path = os.path.join(output_dir, zip_name)

print("\n🔍 Looking for update files to bundle...")
if not os.path.exists(source_dir):
    print(f"❌ Error: Update source directory '{source_dir}' not found.")
    return

with ZipFile(zip_path, 'w') as zipf:
    for root, dirs, files in os.walk(source_dir):
        for file in files:
            file_path = os.path.join(root, file)
            arcname = os.path.relpath(file_path, source_dir)
            zipf.write(file_path, arcname)

print(f"✅ OTA package created: {zip_path}")

def main(): default_dir = os.path.expanduser("/coops-ota/output_zips") os.makedirs(output_dir, exist_ok=True)

print("\n🛠️ CoopsOS OTA Config Wizard")
print("---------------------------")
print(f"📍 Current OTA download location: {default_dir}")
change = input("❓ Do you want to change the OTA download location? (y/n): ")

if change.lower() == 'y':
    default_dir = input("📁 Enter new update files path: ")

print("\n📦 Choose update method:")
print("1. Download as .zip")
print("2. Fetch from GitHub")
option = input("👉 Enter option (1 or 2): ")

if option == '1':
    bundle_zip(default_dir, output_dir)
elif option == '2':
    print("🌐 GitHub fetch not yet implemented.")
else:
    print("❌ Invalid option.")

if name == "main": main()

echo "---------------------------"

echo "📜 File: coops_ota_launcher.sh"

echo "---------------------------"

#!/data/data/com.termux/files/usr/bin/bash

python ~/coops-ota/ota_config_wizard.py

echo "---------------------------"

echo "📘 File: README.md"

echo "---------------------------"

echo "CoopsOS OTA Wizard"

echo "This is the interactive OTA packaging and config wizard for CoopsOS."

echo "🔧 Usage"

echo "1. Clone this repo:"



git clone https://github.com/coops8/coops-ota.git
cd coops-ota
chmod +x coops_ota_launcher.sh

echo "2. (Optional) Add launcher:"



ln -s $(pwd)/coops_ota_launcher.sh $PREFIX/bin/coops-ota

echo "3. Run it:"



coops-ota

echo "📦 Update File Structure"

echo "Place all files you want in the OTA zip inside update/."

echo "📁 Output"

echo "Zipped packages will appear in output_zips/."


echo "---"

echo "Made with 💙 by Coops"


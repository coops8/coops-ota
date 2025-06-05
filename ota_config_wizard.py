ota_config_wizard.py

import os import time import shutil import subprocess

OTA_DIR = os.path.expanduser("/coops-ota/output_zips")

os.makedirs(OTA_DIR, exist_ok=True) os.makedirs(OUTPUT_DIR, exist_ok=True)

def bundle_zip(source_dir, output_dir): timestamp = time.strftime("%Y%m%d-%H%M%S") zip_name = f"CoopsOS-OTA-{timestamp}.zip" zip_path = os.path.join(output_dir, zip_name) shutil.make_archive(zip_path.replace(".zip", ""), 'zip', source_dir) print(f"\n✅ OTA ZIP created: {zip_path}")

def fetch_from_github(repo_url, destination): print(f"\n📡 Cloning OTA repo from GitHub...") subprocess.run(['git', 'clone', repo_url, destination])

def main(): print("\n🛠️ CoopsOS OTA Config Wizard") print("---------------------------") print(f"📍 Current OTA download location: {OTA_DIR}") change = input("❓ Do you want to change the OTA download location? (y/n): ") if change.lower() == 'y': new_path = input("🔧 Enter new download location: ") OTA_DIR = new_path os.makedirs(OTA_DIR, exist_ok=True)

print("\n📦 Choose update method:")
print("1. Download as .zip")
print("2. Fetch from GitHub")
option = input("👉 Enter option (1 or 2): ")

if option == '1':
    print("\n🔍 Looking for update files to bundle...")
    if not os.path.exists(OTA_DIR):
        print("❌ Error: Update source directory not found.")
        return
    bundle_zip(OTA_DIR, OUTPUT_DIR)
elif option == '2':
    repo_url = input("🌐 Enter GitHub OTA repo URL: ")
    fetch_from_github(repo_url, OTA_DIR)
    print("✅ GitHub update fetched!")
else:
    print("❌ Invalid option selected.")

if name == 'main': main()


#!/data/data/com.termux/files/usr/bin/bash
python ~/coops-ota/ota_config_wizard.py

echo "Made with 💙 by Coops"

#!/data/data/com.termux/files/usr/bin/bash

echo "🧠 CoopsOS OTA Control Panel"
echo "-----------------------------"
echo "1️⃣ Run OTA Config Wizard"
echo "2️⃣ Install OTA ZIP"
echo "3️⃣ Pull GitHub Updates"
echo "4️⃣ Exit"
read -p "👉 Choose an option: " option

case $option in
  1)
    python3 $HOME/CoopsOS/coops-ota/ota_config_wizard.py
    ;;
  2)
    bash $HOME/CoopsOS/coops-ota/install_zip.sh
    ;;
  3)
    bash $HOME/CoopsOS/coops-ota/github_updater.sh
    ;;
  4)
    echo "👋 Exiting..."
    exit 0
    ;;
  *)
    echo "❌ Invalid choice."
    ;;
esac

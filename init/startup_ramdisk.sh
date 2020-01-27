LABEL_NAME=com.hide.ramdisk
PLIST_FILE=/Library/LaunchDaemons/$LABEL_NAME.plist

# Input desired size in MB
echo ">> Please input the desired size in MB for ramdisk."
read desired_mb

if ! [[ "$desired_mb" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Integers only!"
    exit 1
fi

# Set up startup script
echo "Adding startup script. You may be asked the password."
echo

sudo tee $PLIST_FILE <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.hide.ramdisk</string>
        <key>ProgramArguments</key>
        <array>
            <string>/bin/sh</string>
            <string>$HOME/.dotfiles/tools/ramdisk.sh</string>
            <string>$desired_mb</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
    </dict>
</plist>
EOF

sudo chown root:wheel $PLIST_FILE
sudo launchctl unload $PLIST_FILE
sudo launchctl load $PLIST_FILE

echo "\nRegistered as a startup"
sudo launchctl list | grep $LABEL_NAME
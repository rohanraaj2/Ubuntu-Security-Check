#!/bin/bash

echo "🔐 Ubuntu Minimal Security Audit"
echo "--------------------------------"

# 1. Check if auto-login is enabled
echo -n "Auto-login: "
if grep -q "AutomaticLoginEnable=true" /etc/gdm3/custom.conf; then
    echo "❌ ENABLED (not secure)"
else
    echo "✅ Disabled"
fi

# 2. Check if firewall is active
echo -n "UFW Firewall: "
sudo ufw status | grep -q "Status: active" && echo "✅ Active" || echo "❌ Inactive"

# 3. Check if screen lock is enabled
echo -n "Screen Lock (idle): "
gsettings get org.gnome.desktop.screensaver lock-enabled | grep -q true && echo "✅ Enabled" || echo "❌ Disabled"

# 4. Check if system is up-to-date
echo "Checking for updates..."
sudo apt list --upgradable 2>/dev/null | grep -q "upgradable" && echo "❌ Updates available" || echo "✅ System is up to date"

# 5. Check sudo users
echo -n "Sudo Users: "
getent group sudo | cut -d: -f4

# 6. Check if GNOME keyring exists
echo -n "GNOME Keyring status: "
[ -f ~/.local/share/keyrings/login.keyring ] && echo "✅ Found" || echo "❌ Not Found"

# 7. Optional: Check if disk is encrypted
echo -n "Disk Encryption: "
lsblk -o NAME,TYPE | grep -q "crypt" && echo "✅ Encrypted" || echo "❌ Not Encrypted"

echo "--------------------------------"
echo "Audit Complete."

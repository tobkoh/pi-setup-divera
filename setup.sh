#!/bin/bash

# Beschreibung:
# Dieses Skript konfiguriert ein Raspberry Pi mit Raspberry Pi OS Bookworm 64 bit.
# Es konfiguriert eine WLAN-Verbindung, entfernt unnötige Programme und behält nur die grafische Oberfläche bei.
# Es installiert erforderliche Pakete, erstellt notwendige Konfigurationsdateien und richtet ein Programm für den automatischen Start ein.
# Am Ende wird das System neu gestartet, um alle Änderungen anzuwenden.

# Bevor Sie dieses Skript ausführen, füllen Sie bitte die SSID und das PASS (WLAN-Passwort) aus.
# Bitte die XXXX gegen die SSID und das Passwort tauschen und zwischen die Anführungszeigen eintragen. 

# WLAN-SSID und -Passwort
SSID="XXXX"
PASS="XXXX"

echo "1/11: Konfiguration des WLAN-Netzwerks..."

# WLAN-Netzwerk konfigurieren (hinzufügen, falls nicht vorhanden)
if ! grep -q "ssid=\"$SSID\"" /etc/wpa_supplicant/wpa_supplicant.conf; then
    cat <<EOF >> /etc/wpa_supplicant/wpa_supplicant.conf
network={
  ssid="$SSID"
  psk="$PASS"
}
EOF
fi

# WLAN-Dienst neu starten, um die Änderungen zu übernehmen
sudo systemctl restart dhcpcd

# Warten, bis die Internetverbindung hergestellt ist
echo "Warten auf Internetverbindung..."
until ping -c1 google.com &>/dev/null; do
  sleep 5
done
echo "Internetverbindung hergestellt."

echo "2/11: Entfernen unnötiger Programme..."

# Entfernen Sie unnötige Programme
sudo apt-get remove -y libreoffice* wolfram-engine sonic-pi scratch scratch2 nuscratch python-sense-emu sense-emu-tools python3-sense-emu smartsim java-common minecraft-pi claws-mail geany greenfoot bluej nodered thonny code the-powder-toy

echo "3/11: Systembereinigung..."

# Bereinigen Sie das System
sudo apt-get autoremove -y
sudo apt-get clean
sudo apt-get autoclean

echo "4/11: System-Update und -Upgrade..."

# Update package manager and upgrade the system
sudo apt-get update && sudo apt-get upgrade -y

echo "5/11: Installation erforderlicher Pakete..."

# Install required packages
sudo apt-get install -y libfuse2 dbus notification-daemon xdotool

echo "6/11: Erstellung der dbus-Service-Datei..."

# Create dbus service file
sudo bash -c 'cat << EOF > /usr/share/dbus-1/services/org.freedesktop.Notifications.service
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon/notification-daemon
EOF'

echo "7/11: Import des Debian-Paket-Signaturschlüssels und Hinzufügen des non-free Repositorys..."

# Import Debian package signing key and add non-free repository
wget -qO- https://ftp-master.debian.org/keys/release-10.asc | sudo apt-key add -
echo "deb http://deb.debian.org/debian buster non-free" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install -y libttspico-utils

echo "8/11: Herunterladen der DIVERA247 Monitor-Anwendung..."

# Download DIVERA247 Monitor application and make it executable
wget -O /home/pi/DIVERA247-Monitor.AppImage https://s3.live.divera247.de/public/software/monitor/DIVERA247-Monitor-1.1.4-arm64.AppImage
sudo chmod a+x /home/pi/DIVERA247-Monitor.AppImage

echo "9/11: Konfiguration der Autostart-Datei..."

# Configure autostart file
mkdir -p /home/pi/.config/autostart
cat << EOF > /home/pi/.config/autostart/divera.desktop
[Desktop Entry]
Type=Application
Exec=/home/pi/DIVERA247-Monitor.AppImage
EOF

echo "10/11: Installation der Audio-Speech-Pakete..."

# Make Audio Speech Packet 
sudo apt install -y software-properties-common
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository non-free
sudo apt update
sudo apt install -y libttspico-utils vlc

echo "11/11: Neustart des Systems zur Übernahme der Änderungen..."

# Reboot the system to apply changes
sudo reboot

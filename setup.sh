#!/bin/bash

# Beschreibung:
# Dieses Skript konfiguriert ein Raspberry Pi mit Raspberry Pi OS Bookworm.
# Es stellt eine WLAN-Verbindung her, entfernt unnötige Programme, aktualisiert das System und installiert die DIVERA247 Monitor-Anwendung.
# Außerdem richtet es Audio-Speech-Pakete ein und konfiguriert den dbus-Dienst und die Autostart-Einstellungen.
# Am Ende wird das System neu gestartet, um alle Änderungen anzuwenden.

# Abfrage für den Benutzernamen (Pflicht)
read -p "Bitte geben Sie den Benutzernamen ein: " USERNAME
if [ -z "$USERNAME" ]; then
  echo "Benutzername darf nicht leer sein. Das Skript wird abgebrochen."
  exit 1
fi

# Abfrage für SSID und PASS (optional)
read -p "Bitte geben Sie die WLAN-SSID ein (optional): " SSID
read -s -p "Bitte geben Sie das WLAN-Passwort ein (optional): " PASS
echo

echo "1/12: Konfiguration des WLAN-Netzwerks..."

# WLAN-Netzwerk konfigurieren (hinzufügen, falls nicht vorhanden)
if [ -n "$SSID" ] && [ -n "$PASS" ]; then
  sudo nmcli radio wifi on
  sudo nmcli dev wifi connect "$SSID" password "$PASS"

  # Warten, bis die Internetverbindung hergestellt ist
  echo "Warten auf Internetverbindung..."
  until ping -c1 google.com &>/dev/null; do
    sleep 5
  done
  echo "Internetverbindung hergestellt."
else
  echo "WLAN-SSID und/oder Passwort nicht angegeben. Überspringe WLAN-Konfiguration."
fi

echo "2/12: Entfernen unnötiger Programme..."

# Entfernen Sie unnötige Programme
sudo apt-get remove -y libreoffice* wolfram-engine sonic-pi scratch scratch2 nuscratch python-sense-emu sense-emu-tools python3-sense-emu smartsim java-common minecraft-pi claws-mail geany greenfoot bluej nodered thonny code the-powder-toy

echo "3/12: Systembereinigung..."

# Bereinigen Sie das System
sudo apt-get autoremove -y
sudo apt-get clean
sudo apt-get autoclean

echo "4/12: System-Update und -Upgrade..."

# Update package manager and upgrade the system
sudo apt-get update && sudo apt-get upgrade -y

echo "5/12: Installation erforderlicher Pakete..."

# Install required packages
sudo apt-get install -y libfuse2 dbus notification-daemon xdotool jq unclutter cec-utils

echo "6/12: Erstellung der dbus-Service-Datei..."

# Create dbus service file
sudo bash -c 'cat << EOF > /usr/share/dbus-1/services/org.freedesktop.Notifications.service
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon/notification-daemon
EOF'

echo "7/12: Import des Debian-Paket-Signaturschlüssels und Hinzufügen des non-free Repositorys..."

# Import Debian package signing key and add non-free repository
wget -qO- https://ftp-master.debian.org/keys/release-10.asc | sudo apt-key add -
echo "deb http://deb.debian.org/debian buster non-free" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install -y libttspico-utils

echo "8/12: Herunterladen der DIVERA247 Monitor-Anwendung..."

# Download DIVERA247 Monitor application and make it executable
wget -O /home/$USERNAME/DIVERA247-Monitor.AppImage https://s3.live.divera247.de/public/software/monitor/DIVERA247-Monitor-1.1.4-arm64.AppImage
sudo chmod a+x /home/$USERNAME/DIVERA247-Monitor.AppImage

echo "9/12: Konfiguration der Autostart-Datei..."

# Configure autostart file
mkdir -p /home/$USERNAME/.config/autostart
cat << EOF > /home/$USERNAME/.config/autostart/divera.desktop
[Desktop Entry]
Type=Application
Exec=/home/$USERNAME/DIVERA247-Monitor.AppImage
EOF

echo "10/12: Installation der Audio-Speech-Pakete..."

# Make Audio Speech Packet 
sudo apt install -y software-properties-common
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository non-free
sudo apt update
sudo apt install -y libttspico-utils vlc

echo "11/12: Erstellung des Skripts zum Aktivieren des SmartTV per CEC..."

# Skript zum Aktivieren des SmartTV per CEC erstellen
cat << 'EOF' > /home/$USERNAME/activate_tv.sh
#!/bin/bash

# Funktion zum Einschalten des TVs per CEC
echo "Einschalten des TVs..."
echo on 0 | cec-client -s -d 1
EOF

# Skript ausführbar machen
chmod +x /home/$USERNAME/activate_tv.sh

echo "12/12: Neustart des Systems zur Übernahme der Änderungen..."

# Reboot the system to apply changes
sudo reboot

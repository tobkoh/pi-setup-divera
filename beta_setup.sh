#!/bin/bash

# Beschreibung:
# Dieses Skript entfernt die bestehende DIVERA247 Monitor-App Konfiguration und installiert die Beta-Version der Monitor-App.
# Es stellt sicher, dass der Benutzername angegeben wird, und führt die erforderlichen Schritte aus, um die Beta-Version zu installieren.

# Abfrage für den Benutzernamen (Pflicht)
read -p "Bitte geben Sie den Benutzernamen ein: " USERNAME
if [ -z "$USERNAME" ]; then
  echo "Benutzername darf nicht leer sein. Das Skript wird abgebrochen."
  exit 1
fi

echo "1/5: Entfernen der bestehenden DIVERA247 Monitor-App Konfiguration..."

# Entfernen der App-Konfiguration aus dem .config-Ordner
CONFIG_DIR="/home/$USERNAME/.config"
DIVERA_DIR="$CONFIG_DIR/@divera247"

if [ -d "$DIVERA_DIR" ]; then
  rm -rf "$DIVERA_DIR"
  echo "Konfigurationsordner $DIVERA_DIR wurde entfernt."
else
  echo "Konfigurationsordner $DIVERA_DIR existiert nicht. Überspringe diesen Schritt."
fi

echo "2/5: Entfernen der bestehenden Autostart-Datei..."

# Entfernen der Autostart-Datei für die aktuelle Version
AUTOSTART_DIR="$CONFIG_DIR/autostart"
AUTOSTART_FILE="$AUTOSTART_DIR/divera.desktop"

if [ -f "$AUTOSTART_FILE" ]; then
  rm -f "$AUTOSTART_FILE"
  echo "Autostart-Datei $AUTOSTART_FILE wurde entfernt."
else
  echo "Autostart-Datei $AUTOSTART_FILE existiert nicht. Überspringe diesen Schritt."
fi

echo "3/5: Herunterladen der DIVERA247 Monitor Beta-Version..."

# Herunterladen der Beta-Version der DIVERA247 Monitor-App
BETA_APP_URL="https://s3.florian.divera247.de/public/software/monitor/DIVERA247-Monitor-2.0.0-beta.13-arm64.AppImage"
BETA_APP_PATH="/home/$USERNAME/DIVERA247-Monitor-Beta.AppImage"

wget -O "$BETA_APP_PATH" "$BETA_APP_URL"
sudo chmod a+x "$BETA_APP_PATH"

echo "4/5: Konfiguration der Autostart-Datei für die Beta-Version..."

# Konfiguration der Autostart-Datei für die Beta-Version
AUTOSTART_BETA_FILE="$AUTOSTART_DIR/divera-beta.desktop"

mkdir -p "$AUTOSTART_DIR"
cat << EOF > "$AUTOSTART_BETA_FILE"
[Desktop Entry]
Type=Application
Exec=$BETA_APP_PATH
EOF

echo "5/5: Installation der Beta-Version abgeschlossen. Bitte starten Sie das System neu, um die Änderungen zu übernehmen."

# Hinweis zum Neustart des Systems
echo "Bitte starten Sie das System neu, um die Änderungen zu übernehmen."

# Optional: Systemneustart (auskommentiert, um manuell auszuführen)
sudo reboot

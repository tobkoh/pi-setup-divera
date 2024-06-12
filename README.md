

---

# Raspberry Pi Setup Scripts for DIVERA247

Dieses Repository enthält zwei Skripte zur Konfiguration eines Raspberry Pi mit Raspberry Pi OS Bookworm. Das erste Skript konfiguriert das System und installiert die stabile Version der DIVERA247 Monitor-Anwendung. Das zweite Skript entfernt die bestehende Konfiguration und installiert die Beta-Version der DIVERA247 Monitor-Anwendung.

## Skripte

### setup.sh

Dieses Skript führt die folgenden Aufgaben aus:

1. **Konfiguration des WLAN-Netzwerks:**
   - Aktiviert das WLAN und verbindet es mit dem angegebenen Netzwerk.
2. **Entfernen unnötiger Programme:**
   - Entfernt vorinstallierte Programme wie LibreOffice, Wolfram Engine, Sonic Pi, Scratch und andere.
3. **Systembereinigung:**
   - Entfernt nicht benötigte Pakete und bereinigt den Cache.
4. **System-Update und -Upgrade:**
   - Aktualisiert das System und führt ein Upgrade durch.
5. **Installation erforderlicher Pakete:**
   - Installiert Pakete wie `libfuse2`, `dbus`, `notification-daemon` und `xdotool`.
6. **Erstellung der dbus-Service-Datei:**
   - Erstellt eine Service-Datei für den Notification-Daemon.
7. **Import des Debian-Paket-Signaturschlüssels und Hinzufügen des non-free Repositorys:**
   - Importiert den Debian-Paket-Signaturschlüssel und fügt das `non-free` Repository hinzu.
8. **Herunterladen der DIVERA247 Monitor-Anwendung:**
   - Lädt die DIVERA247 Monitor-Anwendung herunter und macht sie ausführbar.
9. **Konfiguration der Autostart-Datei:**
   - Erstellt eine Autostart-Datei für die DIVERA247 Monitor-Anwendung.
10. **Installation der Audio-Speech-Pakete:**
    - Installiert benötigte Pakete für Text-to-Speech und VLC.
11. **Erstellung eines Skripts zum Aktivieren des SmartTV per CEC:**
    - Erstellt ein Skript, das den SmartTV per CEC einschaltet.
12. **Neustart des Systems zur Übernahme der Änderungen:**
    - Startet das System neu, um alle Änderungen zu übernehmen.

### setup_beta.sh

Dieses Skript führt die folgenden Aufgaben aus:

1. **Entfernen der bestehenden DIVERA247 Monitor-App Konfiguration:**
   - Löscht den Ordner `@divera247` im `.config`-Verzeichnis des Benutzers.
2. **Entfernen der bestehenden Autostart-Datei:**
   - Löscht die Autostart-Datei `divera.desktop` im Autostart-Verzeichnis des Benutzers.
3. **Herunterladen der DIVERA247 Monitor Beta-Version:**
   - Lädt die Beta-Version der DIVERA247 Monitor-Anwendung herunter und macht sie ausführbar.
4. **Konfiguration der Autostart-Datei für die Beta-Version:**
   - Erstellt eine Autostart-Datei für die Beta-Version der Monitor-Anwendung.
5. **Hinweis zum Neustart des Systems zur Übernahme der Änderungen:**
   - Gibt einen Hinweis, dass das System neu gestartet werden sollte, um die Änderungen zu übernehmen.

## Verwendung

### Vorbereitung

Stellen Sie sicher, dass Sie die folgenden Voraussetzungen erfüllen:

- Ein Raspberry Pi mit Raspberry Pi OS Bookworm.
- Zugang zum Internet.

### Installation

1. Klonen Sie dieses Repository auf Ihr Raspberry Pi:
   ```bash
   git clone https://github.com/tobkoh/pi-setup-divera.git
   ```

2. Navigieren Sie in das Verzeichnis des geklonten Repositories:
   ```bash
   cd pi-setup-divera
   ```

### Ausführung

#### setup.sh

1. Machen Sie das Skript ausführbar:
   ```bash
   sudo chmod +x setup.sh
   ```

2. Führen Sie das Skript aus:
   ```bash
   ./setup.sh
   ```

3. Folgen Sie den Anweisungen auf dem Bildschirm, um den Benutzernamen, die WLAN-SSID und das WLAN-Passwort einzugeben.

#### setup_beta.sh

1. Machen Sie das Skript ausführbar:
   ```bash
   sudo chmod +x setup_beta.sh
   ```

2. Führen Sie das Skript aus:
   ```bash
   ./setup_beta.sh
   ```

3. Geben Sie den Benutzernamen ein, wenn Sie dazu aufgefordert werden.


---

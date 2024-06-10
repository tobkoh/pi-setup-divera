Hier ist der komplette Text für die README-Datei:

```markdown
# pi-setup-divera

Dieses Skript konfiguriert ein Raspberry Pi mit Raspberry Pi OS Bookworm. Es stellt eine WLAN-Verbindung her, entfernt unnötige Programme, aktualisiert das System und installiert die DIVERA247 Monitor-Anwendung. Außerdem richtet es Audio-Speech-Pakete ein und konfiguriert den dbus-Dienst und die Autostart-Einstellungen.

## Vor der Ausführung

Bevor Sie dieses Skript ausführen, stellen Sie sicher, dass Sie die WLAN-SSID und das Passwort im Skript eingetragen haben:

```bash
SSID="Ihre_SSID"
PASS="Ihr_Passwort"
```

## Schritte des Skripts

1. **Konfiguration des WLAN-Netzwerks:**
   - Fügt die SSID und das Passwort zum WLAN-Netzwerk hinzu.
   - Startet den WLAN-Dienst neu und wartet, bis die Internetverbindung hergestellt ist.

2. **Entfernen unnötiger Programme:**
   - Entfernt vorinstallierte Programme wie LibreOffice, Wolfram Engine, Sonic Pi, Scratch und andere.

3. **Systembereinigung:**
   - Entfernt nicht benötigte Pakete und bereinigt den Cache.

4. **System-Update und -Upgrade:**
   - Aktualisiert das System und führt ein Upgrade durch.

5. **Installation erforderlicher Pakete:**
   - Installiert Pakete wie libfuse2, dbus, notification-daemon und xdotool.

6. **Erstellung der dbus-Service-Datei:**
   - Erstellt eine Service-Datei für den Notification-Daemon.

7. **Import des Debian-Paket-Signaturschlüssels und Hinzufügen des non-free Repositorys:**
   - Importiert den Debian-Paket-Signaturschlüssel und fügt das non-free Repository hinzu.

8. **Herunterladen und Installieren der DIVERA247 Monitor-Anwendung:**
   - Lädt die DIVERA247 Monitor-Anwendung herunter und macht sie ausführbar.

9. **Konfiguration der Autostart-Datei:**
   - Erstellt eine Autostart-Datei für die DIVERA247 Monitor-Anwendung.

10. **Installation der Audio-Speech-Pakete:**
    - Installiert benötigte Pakete für Text-to-Speech und VLC.

11. **Neustart des Systems:**
    - Startet das System neu, um alle Änderungen zu übernehmen.

## Verwendung

1. Klonen Sie dieses Repository auf Ihr Raspberry Pi:
   ```bash
   git clone https://github.com/IhrGitHubBenutzername/pi-setup-divera.git
   ```

2. Navigieren Sie in das Verzeichnis des geklonten Repositories:
   ```bash
   cd pi-setup-divera
   ```

3. Bearbeiten Sie das Skript, um Ihre WLAN-SSID und Ihr Passwort einzutragen:
   ```bash
   nano setup.sh
   ```

4. Führen Sie das Skript aus:
   ```bash
   chmod +x setup.sh
   sudo ./setup.sh
   ```

## Lizenz

Dieses Projekt ist unter der MIT-Lizenz lizenziert – siehe die [LICENSE](LICENSE) Datei für Details.
```

Sie können diesen Text in eine Datei mit dem Namen `README.md` einfügen und sie in Ihrem Repository speichern.

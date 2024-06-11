
```markdown
# Raspberry Pi Setup Scripts for DIVERA247

Dieses Repository enthält zwei Skripte zur Konfiguration eines Raspberry Pi mit Raspberry Pi OS Bookworm. Das erste Skript konfiguriert das System und installiert die stabile Version der DIVERA247 Monitor-Anwendung. Das zweite Skript entfernt die bestehende Konfiguration und installiert die Beta-Version der DIVERA247 Monitor-Anwendung.

## Skripte

### setup.sh

Dieses Skript führt die folgenden Aufgaben aus:

1. Konfiguration des WLAN-Netzwerks.
2. Entfernen unnötiger Programme.
3. Systembereinigung.
4. System-Update und -Upgrade.
5. Installation erforderlicher Pakete.
6. Erstellung der dbus-Service-Datei.
7. Import des Debian-Paket-Signaturschlüssels und Hinzufügen des non-free Repositorys.
8. Herunterladen der DIVERA247 Monitor-Anwendung.
9. Konfiguration der Autostart-Datei.
10. Installation der Audio-Speech-Pakete.
11. Erstellung eines Skripts zum Aktivieren des SmartTV per CEC.
12. Neustart des Systems zur Übernahme der Änderungen.

### setup_beta.sh

Dieses Skript führt die folgenden Aufgaben aus:

1. Entfernen der bestehenden DIVERA247 Monitor-App Konfiguration.
2. Entfernen der bestehenden Autostart-Datei.
3. Herunterladen der DIVERA247 Monitor Beta-Version.
4. Konfiguration der Autostart-Datei für die Beta-Version.
5. Hinweis zum Neustart des Systems zur Übernahme der Änderungen.

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
   chmod +x setup.sh
   ```

2. Führen Sie das Skript aus:
   ```bash
   sudo ./setup.sh
   ```

3. Folgen Sie den Anweisungen auf dem Bildschirm, um den Benutzernamen, die WLAN-SSID und das WLAN-Passwort einzugeben.

#### setup_beta.sh

1. Machen Sie das Skript ausführbar:
   ```bash
   chmod +x setup_beta.sh
   ```

2. Führen Sie das Skript aus:
   ```bash
   sudo ./setup_beta.sh
   ```

3. Geben Sie den Benutzernamen ein, wenn Sie dazu aufgefordert werden.


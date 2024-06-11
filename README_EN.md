

---

# Raspberry Pi Setup Scripts for DIVERA247

This repository contains two scripts for configuring a Raspberry Pi with Raspberry Pi OS Bookworm. The first script configures the system and installs the stable version of the DIVERA247 Monitor application. The second script removes the existing configuration and installs the beta version of the DIVERA247 Monitor application.

## Scripts

### setup.sh

This script performs the following tasks:

1. **Configure the Wi-Fi network:**
   - Activates Wi-Fi and connects it to the specified network.
2. **Remove unnecessary programs:**
   - Removes pre-installed programs such as LibreOffice, Wolfram Engine, Sonic Pi, Scratch, and others.
3. **System cleanup:**
   - Removes unnecessary packages and cleans the cache.
4. **System update and upgrade:**
   - Updates the system and performs an upgrade.
5. **Install required packages:**
   - Installs packages such as libfuse2, dbus, notification-daemon, and xdotool.
6. **Create the dbus service file:**
   - Creates a service file for the Notification Daemon.
7. **Import the Debian package signing key and add the non-free repository:**
   - Imports the Debian package signing key and adds the non-free repository.
8. **Download the DIVERA247 Monitor application:**
   - Downloads the DIVERA247 Monitor application and makes it executable.
9. **Configure the autostart file:**
   - Creates an autostart file for the DIVERA247 Monitor application.
10. **Install audio speech packages:**
    - Installs necessary packages for text-to-speech and VLC.
11. **Create a script to activate the SmartTV via CEC:**
    - Creates a script to turn on the SmartTV via CEC.
12. **Reboot the system to apply the changes:**
    - Reboots the system to apply all changes.

### setup_beta.sh

This script performs the following tasks:

1. **Remove the existing DIVERA247 Monitor app configuration:**
   - Deletes the `@divera247` folder in the user's `.config` directory.
2. **Remove the existing autostart file:**
   - Deletes the `divera.desktop` autostart file in the user's autostart directory.
3. **Download the DIVERA247 Monitor beta version:**
   - Downloads the beta version of the DIVERA247 Monitor application and makes it executable.
4. **Configure the autostart file for the beta version:**
   - Creates an autostart file for the beta version of the monitor application.
5. **Note about rebooting the system to apply changes:**
   - Provides a note that the system should be restarted to apply the changes.

## Usage

### Preparation

Ensure you meet the following requirements:

- A Raspberry Pi with Raspberry Pi OS Bookworm.
- Access to the internet.

### Installation

1. Clone this repository to your Raspberry Pi:
   ```bash
   git clone https://github.com/tobkoh/pi-setup-divera.git
   ```

2. Navigate to the directory of the cloned repository:
   ```bash
   cd pi-setup-divera
   ```

### Execution

#### setup.sh

1. Make the script executable:
   ```bash
   chmod +x setup.sh
   ```

2. Run the script:
   ```bash
   sudo ./setup.sh
   ```

3. Follow the on-screen instructions to enter the username, Wi-Fi SSID, and Wi-Fi password.

#### setup_beta.sh

1. Make the script executable:
   ```bash
   chmod +x setup_beta.sh
   ```

2. Run the script:
   ```bash
   sudo ./setup_beta.sh
   ```

3. Enter the username when prompted.


# Ubuntu Minimal Security Audit

This project provides a simple Bash script to perform a minimal security audit on Ubuntu systems. The script checks for several basic security settings and configurations to help users quickly assess their system's security posture.

## Features
- **Auto-login check**: Detects if automatic login is enabled (not secure).
- **UFW Firewall status**: Checks if the Uncomplicated Firewall (UFW) is active.
- **Screen lock status**: Verifies if the GNOME screen lock is enabled.
- **System updates**: Checks if there are any pending system updates.
- **Sudo users**: Lists users with sudo privileges.
- **GNOME Keyring**: Checks if the GNOME keyring exists.
- **Disk encryption**: Detects if any disk partitions are encrypted.

## Usage
1. **Clone or download this repository.**
2. **Run the script in your terminal:**
   ```bash
   bash security_check.sh.save
   ```
   > **Note:** Some checks require `sudo` privileges. You may be prompted for your password.

## Output
The script will print a summary of each security check, indicating whether each item is secure or needs attention.

## Requirements
- Ubuntu (tested on Ubuntu 24.04.2 LTS)
- Bash shell
- UFW (for firewall check)
- GNOME desktop (for screen lock and keyring checks)

## Disclaimer
This script provides a minimal and basic security audit. For comprehensive security, consider using more advanced tools and following best practices for system hardening.

## License
MIT License

# Kali Linux Setup Guide

## Installation Methods

### Method 1: Download Pre-built Image
```bash
# Download from Offensive Security
# https://www.kali.org/get-kali/
# Available for: VirtualBox, VMware, Hyper-V, AWS, Azure, Docker
```

### Method 2: Install from ISO
```bash
# 1. Download ISO from https://www.kali.org/downloads/
# 2. Create new VM with 6GB RAM, 40GB disk, 4 CPU cores
# 3. Boot from ISO and follow installation wizard
# 4. Configure network during installation
```

### Method 3: Docker Installation
```bash
# Pull Kali Linux Docker image
docker pull kalilinux/kali-rolling

# Run container
docker run -it kalilinux/kali-rolling /bin/bash
```

## Post-Installation Configuration

### Update System
```bash
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
```

### Install Essential Tools
```bash
# Metapackages (choose based on needs)
sudo apt install -y kali-tools-top10        # Top 10 most useful
sudo apt install -y kali-tools-full         # Everything
```

### Configure Network
```bash
# Set static IP (if needed)
sudo nano /etc/network/interfaces

# Restart networking
sudo systemctl restart networking
```

### Install Additional Tools
```bash
# Docker
sudo apt install -y docker.io
sudo systemctl start docker
sudo usermod -aG docker $USER

# Git and Python
sudo apt install -y git python3 python3-pip
pip3 install requests beautifulsoup4 paramiko scapy
```

## Security Hardening

### SSH Configuration
```bash
# Generate SSH keys
ssh-keygen -t rsa -b 4096

# Harden SSH config
sudo nano /etc/ssh/sshd_config
# Set: PermitRootLogin no, PasswordAuthentication no

# Restart SSH
sudo systemctl restart ssh
```

### Firewall Setup
```bash
# Install UFW (if not present)
sudo apt install -y ufw

# Enable firewall
sudo ufw enable

# Allow SSH and common ports
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
```

## Customization

### Add Custom Aliases
```bash
# Edit .bashrc
nano ~/.bashrc

# Add useful aliases
alias nmap-quick='nmap -sC -sV -O -A -T4'
alias nmap-full='nmap -sC -sV -O -A -T4 -p-'
```

## Next Steps

1. Configure network for lab
2. Create VM snapshots
3. Install metapackages
4. Customize environment
5. Start with Module 1

---

For more information: https://docs.kali.org/
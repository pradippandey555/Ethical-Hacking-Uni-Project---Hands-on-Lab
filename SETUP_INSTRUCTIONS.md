# Complete Setup Instructions

## Prerequisites

Before starting, ensure you have:
- **16GB+ RAM** (32GB recommended for all modules)
- **100GB+ disk space** (200GB+ for all tools)
- **Multi-core processor** (Intel i5/AMD Ryzen 5 or better)
- **Virtualization capability** enabled in BIOS
- **VirtualBox, VMware, or Hyper-V** installed

## Step 1: Prepare Your Lab Environment

### 1.1 Create Isolated Network
```bash
# VirtualBox Example
VBoxManage natnetwork create --netname labnetwork --network "192.168.100.0/24" --enable
```

### 1.2 Allocate VM Resources
- Attacker VM (Kali Linux): 6GB RAM, 40GB disk, 4 cores
- Target VMs: 2GB RAM each, 20GB disk, 2 cores

## Step 2: Set Up Kali Linux

```bash
# Download Kali Linux ISO
wget https://cdnweb.mirrors.kali.org/kali-images/kali-2025-Q1/kali-linux-2025-q1-vbox-amd64.iso

# Update system
sudo apt update
sudo apt upgrade -y
```

## Step 3: Set Up Vulnerable Target VMs

### 3.1 DVWA
```bash
wget https://github.com/digininja/DVWA/archive/master.zip
unzip master.zip
cd DVWA-master
cp config/config.inc.php.dist config/config.inc.php
```

### 3.2 Metasploitable
```bash
# Download from: https://information.rapid7.com/metasploitable-download.html
# Extract and import into VirtualBox
# Default credentials: msfadmin / msfadmin
```

## Step 4: Install Penetration Testing Tools

### 4.1 Network Scanning
```bash
sudo apt install -y nmap masscan wireshark tcpdump
```

### 4.2 Web Application Testing
```bash
sudo apt install -y sqlmap nikto dirb
```

### 4.3 Exploitation Framework
```bash
sudo apt install -y metasploit-framework
sudo msfdb init
```

### 4.4 Password Cracking
```bash
sudo apt install -y hashcat john hydra
```

### 4.5 Wireless Tools
```bash
sudo apt install -y aircrack-ng
```

## Step 5: Clone the Lab Repository

```bash
git clone https://github.com/pradippandey555/Ethical-Hacking-Uni-Project---Hands-on-Lab.git
cd Ethical-Hacking-Uni-Project---Hands-on-Lab

mkdir -p lab-results wordlists/custom targets captures
```

## Step 6: Automated Setup

### 6.1 Run Quick Installation Script
```bash
cd Tools-Setup
chmod +x quick-install.sh
./quick-install.sh
```

### 6.2 Docker Alternative
```bash
cd Tools-Setup
docker-compose up -d
```

## Step 7: Verify Installation

```bash
# Test connectivity
ping 192.168.100.3

# Check tools
nmap --version
msfconsole -x "exit"
hashcat --version
```

## Step 8: Configure Lab Environment

```bash
# Create baseline
echo "Lab initialized on $(date)" > lab-results/baseline.txt
nmap 192.168.100.0/24 > lab-results/network-baseline.txt
```

## Post-Setup Checklist

- [ ] All VMs created and running
- [ ] Network isolation verified
- [ ] All tools installed and verified
- [ ] Database connectivity confirmed
- [ ] Lab directory structure created
- [ ] Safety checklist reviewed
- [ ] First module accessible
- [ ] Snapshots created

## Next Steps

1. Review SECURITY.md for ethical guidelines
2. Start with Module 1: Network Scanning
3. Follow lab guides step by step
4. Create detailed notes
5. Practice exercises thoroughly

---

**You're now ready to start your ethical hacking journey!** 🚀🔐
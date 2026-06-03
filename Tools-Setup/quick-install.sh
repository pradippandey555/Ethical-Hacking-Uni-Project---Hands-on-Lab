#!/bin/bash
# Quick Lab Installation Script
# Run this script to set up all essential tools for the lab

set -e

echo "=========================================="
echo "Ethical Hacking Lab - Quick Setup"
echo "=========================================="
echo ""

if [ "$EUID" -ne 0 ]; then 
  echo "⚠️  Warning: Some tools require root privileges"
  echo "Recommended: Run with sudo"
  echo ""
fi

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
  echo -e "${BLUE}[*]${NC} $1"
}

print_success() {
  echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
  echo -e "${RED}[✗]${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}[!]${NC} $1"
}

print_status "Updating system packages..."
apt update -qq
apt upgrade -y -qq
print_success "System updated"

print_status "Installing basic tools..."
apt install -y -qq build-essential git curl wget net-tools dnsutils iputils-ping telnet ssh openssh-client
print_success "Basic tools installed"

print_status "Installing network scanning tools..."
apt install -y -qq nmap masscan wireshark tcpdump netcat-traditional
print_success "Network scanning tools installed"

print_status "Installing web application testing tools..."
apt install -y -qq sqlmap nikto dirb curl wget
print_success "Web application tools installed"

print_status "Installing password cracking tools..."
apt install -y -qq hashcat john hydra
print_success "Password cracking tools installed"

print_status "Installing wireless security tools..."
apt install -y -qq aircrack-ng || true
print_success "Wireless security tools installed"

print_status "Creating lab directory structure..."
mkdir -p logs
mkdir -p lab-results
mkdir -p wordlists/custom
mkdir -p targets
mkdir -p captures
mkdir -p reports
print_success "Directory structure created"

print_status "Installing Python packages..."
apt install -y -qq python3 python3-pip
pip install -q requests beautifulsoup4 paramiko scapy pycryptodome 2>/dev/null || true
print_success "Python packages installed"

echo ""
echo "=========================================="
echo -e "${GREEN}Lab setup completed successfully!${NC}"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Review SECURITY.md for ethical guidelines"
echo "2. Check SETUP_INSTRUCTIONS.md for detailed setup"
echo "3. Start with Module 01: Network Scanning"
echo ""
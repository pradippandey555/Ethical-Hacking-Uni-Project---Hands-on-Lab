# Nmap Cheat Sheet

## Basic Scanning

```bash
# Simple scan
nmap target.com

# Scan specific port
nmap -p 80 target.com

# Scan port range
nmap -p 1-1000 target.com

# Scan all ports
nmap -p- target.com

# Quick top ports
nmap --top-ports 20 target.com
```

## Scan Types

```bash
# TCP SYN scan (stealth)
sudo nmap -sS target.com

# TCP connect scan
nmap -sT target.com

# UDP scan
sudo nmap -sU target.com

# ACK scan (firewall detection)
sudo nmap -sA target.com
```

## Service and OS Detection

```bash
# Version detection
nmap -sV target.com

# OS detection
nmap -O target.com

# Aggressive scan (versions + OS + scripts + traceroute)
nmap -A target.com
```

## NSE Scripting

```bash
# Default scripts
nmap -sC target.com

# Specific script
nmap --script banner target.com

# Script category
nmap --script "http-*" target.com

# Vulnerability detection
nmap --script vuln target.com
```

## Network Discovery

```bash
# Ping scan (find alive hosts)
nmap -sn 192.168.1.0/24

# No ping (skip host discovery)
nmap -Pn target.com

# List targets only
nmap -sL 192.168.1.0/24
```

## Output Options

```bash
# Normal output
nmap target.com > output.txt

# XML output
nmap -oX output.xml target.com

# Grepable output
nmap -oG output.gnmap target.com

# All formats
nmap -oA output target.com
```

## Timing and Performance

```bash
# Timing templates (0-5, slowest to fastest)
nmap -T0 target.com    # Paranoid
nmap -T1 target.com    # Sneaky
nmap -T2 target.com    # Polite
nmap -T3 target.com    # Normal (default)
nmap -T4 target.com    # Aggressive
nmap -T5 target.com    # Insane
```

## Useful Combinations

```bash
# Common penetration test scan
nmap -sC -sV -O -A -T4 target.com

# Network discovery
nmap -sn -T4 192.168.1.0/24

# Comprehensive scan (slow)
nmap -p- -sV -O target.com
```

---

**Remember:** Always get authorization before scanning!
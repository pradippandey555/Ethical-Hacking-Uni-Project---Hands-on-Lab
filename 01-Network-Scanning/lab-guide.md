# 01 - Network Scanning & Reconnaissance Lab

## Objectives
- Understand network scanning fundamentals
- Learn Nmap basics and advanced scanning
- Perform network topology mapping
- Identify services and OS fingerprinting
- Practice responsible scanning techniques

## Prerequisites
- Kali Linux installed on attacker machine
- DVWA or target VM available
- Understanding of TCP/IP basics
- Knowledge of port states
- Basic networking concepts

## Environment Setup

### Network Configuration
```
Attacker VM: 192.168.100.2 (Kali Linux)
Target VM:   192.168.100.3 (DVWA/Metasploitable)
Gateway:     192.168.100.1
Netmask:     255.255.255.0
```

## Part 1: Nmap Fundamentals

### 1.1 Basic Port Scanning

```bash
# Simple TCP connect scan
nmap 192.168.100.3

# Scan specific ports
nmap -p 80,443,22 192.168.100.3

# Scan port ranges
nmap -p 1-1000 192.168.100.3

# Scan all 65535 ports
nmap -p- 192.168.100.3
```

**Understanding Output:**
- **Open**: Service is listening on this port
- **Closed**: Port is accessible but no service
- **Filtered**: Firewall is blocking the port
- **Unfiltered**: Port is open but state undetermined

### 1.2 Scan Types

```bash
# TCP SYN Scan (Stealth scan - requires sudo)
sudo nmap -sS 192.168.100.3

# TCP Connect Scan
nmap -sT 192.168.100.3

# UDP Scan
sudo nmap -sU 192.168.100.3

# ACK Scan (Firewall detection)
sudo nmap -sA 192.168.100.3
```

### 1.3 Version Detection

```bash
# Detect service versions
nmap -sV 192.168.100.3

# Aggressive scanning
nmap -A 192.168.100.3
```

## Part 2: Advanced Scanning Techniques

### 2.1 OS Fingerprinting

```bash
# OS detection
nmap -O 192.168.100.3

# Aggressive OS detection
nmap -O --osscan-guess 192.168.100.3
```

### 2.2 Service Enumeration

```bash
# Detect service versions and info
nmap -sV 192.168.100.3

# NSE scripts for service detection
nmap --script banner 192.168.100.3
```

### 2.3 NSE (Nmap Scripting Engine)

```bash
# Use default scripts
nmap -sC 192.168.100.3

# Use specific script
nmap --script http-enum 192.168.100.3

# Vulnerability detection
nmap --script vuln 192.168.100.3
```

## Part 3: Network Mapping

### 3.1 Scan Network Ranges

```bash
# Scan entire subnet
nmap 192.168.100.0/24

# Ping scan only
nmap -sn 192.168.100.0/24
```

### 3.2 Host Discovery

```bash
# Disable ping (assumes all hosts up)
nmap -Pn 192.168.100.3
```

## Part 4: Output Formats

### 4.1 Saving Results

```bash
# Normal output
nmap 192.168.100.3 > scan-normal.txt

# XML output (for parsing)
nmap -oX scan-results.xml 192.168.100.3

# Grepable output
nmap -oG scan-results.gnmap 192.168.100.3

# All formats
nmap -oA scan-results 192.168.100.3
```

## Part 5: Performance Optimization

### 5.1 Speeding Up Scans

```bash
# Aggressive timing
nmap -T4 192.168.100.0/24

# Skip reverse DNS
nmap -n 192.168.100.3
```

### 5.2 Timing Templates

```bash
# Paranoid to Insane (T0 to T5)
nmap -T4 192.168.100.3
```

## Hands-on Exercises

### Exercise 1: Basic Reconnaissance
```bash
nmap -sV -O 192.168.100.3 -oA exercise1
```

### Exercise 2: Network Mapping
```bash
nmap -sn 192.168.100.0/24 -oG network-map.gnmap
```

### Exercise 3: Web Service Enumeration
```bash
nmap -p 80,443 --script http-enum 192.168.100.3
```

## Troubleshooting

### Issue: "sendto in send_ip_packet" errors
**Solution:** Use root privileges
```bash
sudo nmap -O 192.168.100.3
```

### Issue: Scan taking too long
**Solution:** Increase timing templates
```bash
nmap -T5 --min-rate 5000 192.168.100.3
```

## References

- [Nmap Official Documentation](https://nmap.org/book/)
- [Nmap Scripting Engine Guide](https://nmap.org/book/nse.html)
- [OWASP Network Segmentation](https://www.owasp.org/index.php/Network_Segmentation)

## Safety Reminders

⚠️ **Important:**
- Always verify network isolation before scanning
- Only scan systems you have authorization for
- Never scan production networks
- Document all scanning activities
- Get written permission before any testing

---

**Next Module:** Web Application Security (02-Web-Application-Security)

Last Updated: June 3, 2026
# 🏴‍☠️ Pirates_Subbers.sh  
> ⚓ *"Those who control the seas of the subdomains… control the map of the web."*

---

## 🧭 Overview

**Pirates_Subbers.sh** a **clean, fast, and reliable passive subdomain enumerator** that doesn’t need any API keys, paid services, or external dependencies.

It leverages **publicly available sources** to gather subdomains efficiently and consolidate them into a single, deduplicated list all from your terminal.

---

## 🏴‍☠️ Key Features

- ⚙️ **No API keys required** — 100% public & open-source data sources  
- 🧠 **Passive Enumeration Only** — stays stealthy and avoids detection  
- 🧹 **Clean & Deduplicated Output** — no repeated or junk domains  
- ⚡ **Fast & Parallel Queries** — multiple sources hit at once  
- 📜 **Custom Timeout Control** — tune speed vs accuracy  
- 🔒 **Fully Offline Execution** — only network calls to public data sources  

---

## 🌊 Data Sources

Pirates_Subbers scrapes multiple **publicly accessible services** for subdomain data:
- 🏴 [crt.sh](https://crt.sh)  
- 🏴 [CertSpotter](https://certspotter.com)  
- 🏴 [Web Archive](https://web.archive.org)  
- 🏴 [JLDC Anubis](https://jldc.me/anubis/subdomains/)  
- 🏴 [HackerTarget](https://api.hackertarget.com/hostsearch/)  
- 🏴 [AlienVault OTX](https://otx.alienvault.com)  
- 🏴 [Subdomain Center](https://api.subdomain.center)  
- 🏴 [RapidDNS](https://rapiddns.io)  

> 🪶 More sources coming soon — powered by community contributions.

---

## ⚓ Installation

```bash
git clone https://github.com/yourusername/Pirates_Subbers.git
cd Pirates_Subbers
chmod +x Pirates_Subbers.sh
```
## ☠️ Usage
```bash
# Simple enumeration
./Pirates_Subbers.sh example.com

# Custom output and verbose mode
./Pirates_Subbers.sh example.com -v -o results.txt

# Extend timeout for slow connections
./Pirates_Subbers.sh example.com --timeout 120

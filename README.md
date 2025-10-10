# 🖥️ Server Performance Stats

A lightweight and straightforward **Bash script** to gather essential performance metrics on any **Linux server**.  
Perfect for quick diagnostics, server audits, or daily monitoring routines.

---

## ⚙️ Features

The `server-stats.sh` script provides:

- 🏷️ **OS Version** — Displays `NAME` and `VERSION` from the system release info.  
- ⏱️ **System Uptime** — Shows uptime in hours and minutes (without unnecessary load details).  
- 📊 **Load Average** — Reports system load for the last 1, 5, and 15 minutes.  
- 👥 **Currently Logged-in Users** — Displays active sessions.  
- 🔐 **Failed Login Attempts (last 5)** — If `/var/log/auth.log` exists, shows the latest 5 failed attempts.  
- 🧠 **CPU Usage** — Displays CPU usage percentage (checks if `mpstat` is installed).  
- 💾 **Memory Usage** — Displays memory usage percentage with a warning for high usage.  
- 🔝 **Top 5 Processes by CPU Usage** — Sorted list by CPU usage.  
- 🔝 **Top 5 Processes by Memory Usage** — Sorted list by memory usage.  
- 🗄️ **Disk Usage** — Displays disk usage filtered to `/dev/`, `/media/`, and `/mnt/` mount points.

---

## 🚀 Usage

Clone the repository or manually copy the script to your server:

```bash
git clone https://github.com/yourusername/server-stats.git
cd server-stats
```

Make the script executable:

```bash
chmod +x server-stats.sh
```

Run the script:

```bash
./server-stats.sh
```

---

## 📂 Example Output

```
Operating System Version:
    NAME="Ubuntu"
    VERSION="24.04.3 LTS (Noble Numbat)"

System Uptime:
    2:52, 1 user

Current System Load Average:
    0.18, 0.12, 0.10

Failed login attempts (last 5):
    None

CPU Usage: 0.50%

Top 5 Processes by CPU Usage:
    PID    PPID CMD                         %CPU
  28545    5599 /opt/google/chrome/chrome -  2.6
   2586    2336 /usr/bin/gnome-shell         1.7
   ...

Memory Usage: 16.9%

Top 5 Processes by Memory Usage:
    PID    PPID CMD                         %MEM
   5578    2586 /opt/google/chrome/chrome    2.4
   ...

Total Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2       457G   20G  414G   5% /
/dev/sda1       1.1G  7.8M  1.1G   1% /boot/efi
```

---

## 📦 Requirements

- Linux-based system  
- Bash shell (`/bin/bash`)  
- Standard system utilities:
  - `mpstat` (optional)
  - `free`
  - `df`
  - `uptime`
  - `who`
  - `grep`
  - `tail`

> 💡 **Note:** If `mpstat` is not installed, CPU usage will show a warning but the script continues running.

---

## 🔗 Project Link

🌐 [Roadmap.sh Project Page](https://roadmap.sh/projects/server-stats)

---

## 👤 Author

**Juanito M. Ramos II**  
GitHub: [https://github.com/Juaaanits](https://github.com/Juaaanits)

---

## 📜 License

This project is licensed under the **MIT License**.

---

### ✅ Key Improvements

- Added display of the **last 5 failed login attempts**  
- Implemented **CPU usage check** for missing `mpstat`  
- Simplified **uptime output** for readability  
- **Filtered disk output** for relevant mounts only  
- Highlighted **memory usage warnings**

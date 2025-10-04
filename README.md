# 🖥️ Server Performance Stats

![Shell Script](https://img.shields.io/badge/Shell-Bash-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Linux](https://img.shields.io/badge/Platform-Linux-yellow)

A lightweight and straightforward **Bash script** to gather essential performance metrics on any **Linux server**. Perfect for quick diagnostics, server audits, or daily monitoring routines.

---

## ⚙️ Features

The `server-stats.sh` script provides:

- 🏷️ **OS version**
- ⏱️ **System uptime**
- 📊 **Load average**
- 👥 **Logged-in users**
- 🧠 **CPU usage** (percentage)
- 💾 **Memory usage** (free, used, %)
- 🗄️ **Disk usage** (free, used, %)
- 🔝 **Top 5 processes by CPU usage**
- 🔝 **Top 5 processes by memory usage**
- 🔐 **Failed login attempts** *(if `/var/log/auth.log` is available)*

---

## 🚀 Usage

1. **Clone the repository** or manually copy the script to your server:

   ```bash
   git clone https://github.com/yourusername/server-stats.git
   cd server-stats
   ```

2. **Make the script executable**:

   ```bash
   chmod +x server-stats.sh
   ```

3. **Run the script**:

   ```bash
   ./server-stats.sh
   ```

---

## 📂 Example Output

\`\`\`bash
OS: Ubuntu 22.04.3 LTS
Uptime: 3 days, 4:12
Load Average: 0.35 0.42 0.51
Users Logged In: 2
CPU Usage: 15.3%
Memory Usage: 2.1 GB / 8 GB (26.3%)
Disk Usage: 18 GB / 50 GB (36%)

Top 5 Processes by CPU:
  1. python3     12.3%
  2. nginx       4.1%
  ...

Top 5 Processes by Memory:
  1. java        512 MB
  2. postgres    400 MB
  ...

Failed login attempts (last 24h): 3
\`\`\`

---

## 📦 Requirements

- Linux-based system
- Bash shell (`/bin/bash`)
- Standard system utilities: `top`, `free`, `df`, `uptime`, `who`, `grep`, etc.

---

## 🔗 Project Link

- 🌐 **Roadmap.sh Project Page**: [https://roadmap.sh/projects/server-stats](https://roadmap.sh/projects/server-stats)

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 👤 Author

- **Juanito M. Ramos II**  
- GitHub: [https://github.com/yourusername](https://github.com/yourusername)

# Server Performance Stats

A simple Bash script to analyze basic server performance stats on any Linux machine.

## Features

The script (`server-stats.sh`) provides:

- **OS version**
- **System uptime**
- **Load average**
- **Logged in users**
- **Total CPU usage**
- **Total memory usage** (Free vs Used, including percentage)
- **Total disk usage** (Free vs Used, including percentage)
- **Top 5 processes by CPU usage**
- **Top 5 processes by memory usage**
- *(Optional)* Failed login attempts (if `/var/log/auth.log` exists)

---

## Usage

1. Clone this repository or copy the script into your server.  
2. Make the script executable:
   ```bash
   chmod +x server-stats.sh
3. Run the script.
   ```bash
   ./server-stats.sh

## Project Link
- ** Roadmap Project Page: https://roadmap.sh/projects/server-stats

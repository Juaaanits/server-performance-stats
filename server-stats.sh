#!/bin/bash

: <<'COMMENT_BLOCK'
A bash script that can analyze basic server performance stats.

COMMENT_BLOCK

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

get_os_version() {
    echo -e "${CYAN}Operating System Version:${NC}"
    grep -E '^(NAME|VERSION)=' /etc/os-release | sed 's/^/    /'
}

get_uptime() {
    echo -e "${CYAN}System Uptime:${NC}"
    uptime | awk -F',' '{print $1"," $2}' |  sed 's/^/   /'
}

get_load_average() {
    echo -e "${CYAN}Current System Load Average:${NC}"
    uptime | awk -F'load average:' '{print $2}' | sed 's/^/   /' 
}

get_logged_in_users() {
    echo -e "${CYAN}Currently logged-in users:${NC}"
    who | sed 's/^/    /'
}

get_failed_login_attempts(){
    echo -e "${CYAN}Failed login attempts (last 5):${NC}"
    if [ -f /var/log/auth.log ]; then
        failed=$(grep "Failed password" /var/log/auth.log | tail -n 5)
        if [ -z "$failed" ]; then
            echo "    None"
        else
            echo "$failed" | sed 's/^/    /'
        fi
    else
        echo "    Log file not found"
    fi 
}

get_total_cpu_usage() {
    if ! command -v mpstat &> /dev/null;  then
        echo -e "${CYAN}CPU Usage:${NC}    mpstat not installed"
        return
    fi

    cpu_usage=$(mpstat 1 1 | awk '/Average:/ {print 100 - $12}')
    if (( $(echo "$cpu_usage > 80" | bc -l) )); then
        color=$RED
    elif (( $(echo "$cpu_usage > 50" | bc -l ) )); then
        color=$YELLOW
    else
	color=$GREEN
    fi 

    printf "${CYAN}CPU Usage: ${color}%.2f${NC}%%\n" "$cpu_usage"
}

get_top_cpu_processes() {
    echo -e "${CYAN}Top 5 Processes by CPU Usage:${NC}"
    ps -eo pid,ppid,cmd,%cpu --sort=-%cpu \
    | grep -v '\[' \
    | head -n 6
}

get_total_memory_usage() {
    mem_usage=$(free -m | awk 'NR==2{print $3*100/$2 }' )
    if (( $(echo "$mem_usage > 80" | bc -l) )); then
        color=$RED
        warning=" (High Memory!)"
    elif (( $(echo "$mem_usage > 50" | bc -l ) )); then
        color=$YELLOW
        warning=""
    else
        color=$GREEN
        warning=""
    fi

    printf "${CYAN}Memory Usage: ${color}%.2f${NC}%%\n" "$mem_usage"
}

get_top_memory_usage() {
    echo -e "${CYAN}Top 5 Processes by Memory Usage:${NC}"
    ps 	-eo pid,ppid,cmd,%mem --sort=-%mem \
	| grep -v '\[' \
	| head -n 6
}

get_total_disk_usage() {
    echo -e "${CYAN}Total Disk Usage:${NC}"
    df -h | awk 'NR==1 || /^\/dev\// || /^\/media\// || /^\/mnt\//' 
}

main() {
    echo "=========== Server Performance Statistics ========================"
    echo
    get_os_version
    echo
    get_uptime
    echo
    get_load_average
    echo
    get_failed_login_attempts
    echo
    get_total_cpu_usage
    echo
    get_top_cpu_processes
    echo
    get_total_memory_usage
    echo
    get_top_memory_usage
    echo
    get_total_disk_usage
    echo
}

main

# -----------
# For future use
# while true; do
#     clear
#     main
#     sleep 5
# done

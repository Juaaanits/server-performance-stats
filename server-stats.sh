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

get_total_cpu_usage() {
    cpu_usage=$(mpstat 1 1 | awk '/Average:/ {print 100 - $12}')
    if (( $(echo "$cpu_usage > 80" | bc -l) )); then
        color=$RED
    elif (( $(echo "$cpu_usage > 50" | bc -l ) )); then
        color=$YELLOW
    else
	color=$GREEN
    fi 

    printf "CPU Usage: ${color}%.2f${NC}%%\n" "$cpu_usage"
}

get_top_cpu_processes() {
    echo -e "${CYAN}Top 5 Processes by CPU Usage:${NC}"
    ps -eo pid,ppid,cmd,%cpu --sort=%cpu \
        | grep -v '\[' \
        | head -n 6
}

get_total_memory_usage() {
    mem_usage=$(free -m | awk 'NR==2{print $3*100/$2 }' )
    if (( $(echo "$mem_usage > 80" | bc -l) )); then
        color=$RED
    elif (( $(echo "$mem_usage > 50" | bc -l ) )); then
        color=$YELLOW
    else
        color=$GREEN
    fi

    printf "Memory Usage: ${color}%.2f${NC}%%\n" "$mem_usage" 
}

get_top_memory_usage() {
    echo -e "${CYAN}Top 5 Processes by Memory Usage:${NC}"
    ps 	-eo pid,ppid,cmd,%mem --sort=%mem \
	| grep -v '\[' \
	| head -n 6 
}

get_total_disk_usage() {
    echo -e "${CYAN}Total Disk Usage:${NC}"
    df -h
}

main(){
    echo "===========Welcome to Server Performance Statistics Tool========================"
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

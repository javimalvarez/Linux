#!/bin/bash
ping -c 1 $1 > pinginfo
sudo nmap -v -sV -O $1 > ports
nmap -v --iflist $1 > interfaces
traceroute $1 > route
cat pinginfo ports interfaces route > info.log
rm -r pinginfo ports interfaces route
cat info.log

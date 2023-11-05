#!/bin/bash
echo escaneando puertos...
read -p "introduce la IP: " ip
nmap -p- --open -sS --min-rate 5000 -vvvv -n $ip -oG data

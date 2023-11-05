#!/bin/bash
sync
echo "echo 3 > /proc/sys/vm/drop_caches"
zenity --info --text "Apagando Kali Linux...\nHappy hacking!" --timeout="3"

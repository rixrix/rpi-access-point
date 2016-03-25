#!/bin/bash

# clear/reset tc
sudo tc qdisc del dev wlan0 root

# list rules
sudo tc qdisc show dev wlan0

# Watch status
sudo watch tc -s qdisc ls dev wlan0

# 56kbps
sudo tc qdisc add dev wlan0 root handle 1:0 htb default 10
sudo tc class add dev wlan0 parent 1:0 classid 1:10 htb rate 56kbps ceil 56kbps prio 0
sudo tc qdisc add dev wlan0 parent 1:10 netem delay 40ms

# wifi-b
sudo tc qdisc add dev wlan0 root handle 1:0 htb default 10
sudo tc class add dev wlan0 parent 1:0 classid 1:10 htb rate 11mbps ceil 11mbps prio 0
sudo tc qdisc add dev wlan0 parent 1:10 netem delay 10ms

# dsl
sudo tc qdisc add dev wlan0 root handle 1:0 htb default 10
sudo tc class add dev wlan0 parent 1:0 classid 1:10 htb rate 2mbps ceil 2mbps prio 0
sudo tc qdisc add dev wlan0 parent 1:10 netem delay 40ms

# EDGE|2.5G|GPRS
sudo tc qdisc add dev wlan0 root handle 1:0 htb default 10
sudo tc class add dev wlan0 parent 1:0 classid 1:10 htb rate 50kbps ceil 50kbps prio 0
sudo tc qdisc add dev wlan0 parent 1:10 netem delay 200ms

# 3G
sudo tc qdisc add dev wlan0 root handle 1:0 htb default 10
sudo tc class add dev wlan0 parent 1:0 classid 1:10 htb rate 1000kbps ceil 1000kbps prio 0
sudo tc qdisc add dev wlan0 parent 1:10 netem delay 200ms

# 4G
sudo tc qdisc add dev wlan0 root handle 1:0 htb default 10
sudo tc class add dev wlan0 parent 1:0 classid 1:10 htb rate 10000kbps ceil 10000kbps prio 0
sudo tc qdisc add dev wlan0 parent 1:10 netem delay 100ms
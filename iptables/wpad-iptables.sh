#!/bin/bash

# Creates an iptables chain that checks for WPAD requests from new
# connections, drops them, or releases further packets.

# Create our wpad chain:
iptables -N wpad

# Redirect incoming TPC packets (port 80 only) to our wpad chain:
iptables -A INPUT -p tcp --dport 80 -j wpad

# Look for the SYN packet and create the list:
iptables -A wpad -m recent -p tcp --syn --set

# Look for the ACK packet and update the list:
iptables -A wpad -m recent -p tcp --tcp-flags PSH,SYN,ACK ACK --update

# This is the right packet: look for our string pattern and DROP it 
# if we find it.
# Then, delete our list, we don't want to filter any further packet:
iptables -A wpad -m recent -p tcp --tcp-flags PSH,ACK PSH,ACK --remove \
  -m string --to 70 --algo bm --string "GET /wpad.dat" \
  -j REJECT --reject-with tcp-reset
# EOF


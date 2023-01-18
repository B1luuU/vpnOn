#!/bin/bash

IP=$(w -h | awk '{ print $3 }')

GW=$(ip route | head -n 1 | awk '{ print $3 }')

clear

echo "####################################################################################"
echo "# BEFORE USING THIS SCRIPT, DEFINE THE ACTIVE VARIABLE WITH YOUR ACTIVATION KEY #"
echo "#                                                                                  #"
echo "# THE ACTIVATION CODE IS IN THE _ACTIVE_ VARIABLE AT THE BEGINNING OF THE SCRIPT             #"
echo "####################################################################################"

expressvpn activate

ip route add $IP via $GW dev eth0 2>/dev/null

echo "This is my output IP before connecting VPN: $(curl -s ifconfig.me)"

expressvpn preferences set network_lock off
expressvpn preferences set send_diagnostics false
expressvpn connect

echo "This is my output IP after connecting VPN: $(curl -s ifconfig.me)"

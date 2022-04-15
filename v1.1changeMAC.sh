#!/bin/bash
# Programmer: Diether07
# Purpose: To apply what I learn in Linux 
# Date: 4/15/2022

#Before you start plase use root 
#pirnt interface address
sudo ifconfig -a
#Print MAC address
echo "Enter what interface you want to change the MAC/Ether address"
read interface
echo "==============================================================="
echo "MAC: "
sudo ifconfig $interface | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
echo "==============================================================="
echo "Closing interface in : "
#counter
for ((i = 5; i > 0; i--))
do
	printf "%i " "$i"	#Use printf to print in the same line
 	sleep 1s
done
#shutdown interface
sudo ifconfig $interface down
#Show the interface down
echo $'\n'"==============================================================="
echo "Wlan0 interface is down!"
sudo ifconfig $interface | grep flags
echo "==============================================================="
echo "Enter new MAC/Ether e.g(00:--:--:--:--:--) !Start with 00:"
read newMAC 
echo "Changing MAC/Ether adress"
#countDown to change the MAC
for ((i = 63; i > 0; i--))
do
	printf "#" "$i"
	sleep 0.1s
done
echo $'\n'"==============================================================="

#Ill hard print the MAC address for test
if ifconfig $interface hw ether $newMAC; then
echo $'\n'"MAC/Ether changed succcessfully!"

#Interface Activating
#countDown
echo $'\n'"==============================================================="
echo "Interface activating in : "
for ((i = 5; i > 0; i--))
do
        printf  "$i "
        sleep 1s
done
ifconfig $interface up
echo $'\n'"==============================================================="
echo "The $interface interface is activate!"
echo "Check status below: "
ifconfig $interface
echo "==============================================================="
else 
echo "error!"
fi

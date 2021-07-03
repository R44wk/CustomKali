#!/bin/bash

IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
COUNTRY=$(/usr/bin/nordvpn status | grep "Country" | awk '{print $2}')

if [ "$IFACE" = "tun0"  ];  then


	#echo "%{F#15f902}   %{F#ffcc00}$(/usr/sbin/ifconfig tun0 | grep "inet" |  awk '{print $2}' )%{u-}"
	echo "%{F#15f902}   %{F#dff705}$(echo "Conected to:" $COUNTRY)%{u-}"
	
	
else
	echo "%{F#15f902}  %{F#ffcc00}$(echo "NordVPN OFF" )%{u-}"
		
fi
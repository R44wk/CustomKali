#!/bin/bash

echo "%{F#15f902} %{F#dff705 }$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')%{u-}"


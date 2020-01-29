#!/bin/bash

# disconnect from current wifi without turning off wifi 
networksetup -setnetworkserviceenabled Wi-Fi off

# found this on Google, no idea what it does. But it is necessary :-)
/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport --disassociate

# this generates a random mac address
ifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/./0/2; s/.$//')

# detect new hardware
networksetup -detectnewhardware

# activate wifi again
networksetup -setnetworkserviceenabled Wi-Fi on

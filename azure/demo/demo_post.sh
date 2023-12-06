#!/bin/bash
set -x
cd /
dsiprouter setcredentials -dc ZmIwMTdmY2I5NjE4
dsiprouter setcredentials -ac 9lyrny3HOtwgjR6JIMwRaMej9LijIS835zhVbD8ywHDzXT07Xm6vem1sgfvWkFz3

# Update Kamailio Network Settings
#SYSTEM_KAMAILIO_CONFIG_FILE="/etc/kamailio/kamailio.cfg"
#INTERNAL_IP=`ip addr show eth0:1 | grep eth0:1 | awk '{print $2}' | cut -f1 -d'/'`
#INTERNAL_NET=`echo $INTERNAL_IP | sed "s/\([0-9]*\.[0-9]*\.[0-9]*\.\)\([0-9]*\)/\1/g"`
#INTERNAL_NET+="*"
#EXTERNAL_IP="138.197.227.97"
#setKamailioConfigIP 'INTERNAL_IP_ADDR' "${INTERNAL_IP}" ${SYSTEM_KAMAILIO_CONFIG_FILE}
#setKamailioConfigIP 'INTERNAL_IP_NET' "${INTERNAL_NET}" ${SYSTEM_KAMAILIO_CONFIG_FILE}
#setKamailioConfigIP 'EXTERNAL_IP_ADDR' "${EXTERNAL_IP}" ${SYSTEM_KAMAILIO_CONFIG_FILE}

# Restart dSIPRouter
systemctl restart dsiprouter

# Install License key
cd /etc/dsiprouter/
git clone https://mack:zEKpGbDamixmaRT3fbKQ@git.flyball.co/dsiprouter/licenseserver
tar -xvf licenseserver/module/license_bundle_demo.tar

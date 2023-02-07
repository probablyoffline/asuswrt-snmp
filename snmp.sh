#! /bin/bash

# Asuswrt-Merlin SNMPD install for ASUS GT-AX11000

opkg install mini_snmpd
opkg install snmp-utils

read -p "Enter value for SNMP location: " rLOCATION
read -p "Enter value for SNMP community: " rCOMMUNITY
read -p "Enter value for SNMP email: " rEMAIL

echo "#!/bin/sh" > /opt/etc/init.d/S50mini_snmpd
echo "" >> /opt/etc/init.d/S50mini_snmpd
echo "ENABLED=yes" >> /opt/etc/init.d/S50mini_snmpd
echo "PROCS=mini_snmpd" >> /opt/etc/init.d/S50mini_snmpd
echo 'ARGS="-i br0,eth0 -D GT-AX11000 -L $rLOCATION -c $rCOMMUNITY -C $rEMAIL"' >> /opt/etc/init.d/S50mini_snmpd
echo "PREARGS="\""" >> /opt/etc/init.d/S50mini_snmpd
echo "DESC=$PROCS" >> /opt/etc/init.d/S50mini_snmpd
echo "PATH=/opt/sbin:/opt/bin:/opt/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /opt/etc/init.d/S50mini_snmpd
echo "" >> /opt/etc/init.d/S50mini_snmpd
echo ". /opt/etc/init.d/rc.func" >> /opt/etc/init.d/S50mini_snmpd

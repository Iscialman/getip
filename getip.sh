#!/bin/bash
#执行
nic_name=`ifconfig | grep -i eth* | awk '{print $1}' | sed -n '1p'`

for nic in ${nic_name}
do
        ip_addr=`ifconfig ${nic_name} | grep -w inet | cut -d " " -f 12 | cut -d ":" -f 2`
        echo "-----------------------------" $nic "----------------------------"
        echo ${ip_addr}  | tee 2>&1 $(hostname)_${nic_name}
        echo "-----------------------------------------------------------------"
done

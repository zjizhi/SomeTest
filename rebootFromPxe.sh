#!/bin/sh

## 
## before you deploy this script ,please make sure that you have install ipmi-tools
## to install it ,do :yum install ipmi-tools -y

declare -a ip
ip=''  # for some discontinuous ip,please add to here.it will reinstall after 


for i in `seq 106 128`
do
     echo 'install os:',$i
     ipmitool -I lanplus -U admin -P admin -H 10.0.0.$i chassis bootdev pxe
     ipmitool -I lanplus -U admin -P admin -H 10.0.0.$i power reset
     sleep 120
done

for i in $ip
do
     echo 'install os:',$i
     ipmitool -I lanplus -U admin -P admin -H 10.0.0.$i chassis bootdev pxe
     ipmitool -I lanplus -U admin -P admin -H 10.0.0.$i power reset
     sleep 120
done

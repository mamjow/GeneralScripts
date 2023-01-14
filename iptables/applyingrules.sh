#!/bin/bash
function myfunc() {
    total=$1
    nr=$2
    value=$(((($nr + 1) * 100) / $total))
    # echo -e "\033[5A"
    printf "\r%s%%" $value
}

whitelistInput="${BASH_SOURCE%/*}/cidrIp.txt"
wlineNr=$(wc -l < $whitelistInput)
printf "Total of %s rules to apply..." $wlineNr

for ((i = 0 ; i < $wlineNr ; i++)); do
    #  do iptable command
    iprange=$(sed -n "${i}p" < $whitelistInput)
    sudo iptables -A INPUT -s $iprange -j ACCEPT 
    myfunc $wlineNr $i
done

printf "\n"
printf "time to ban whole word"
sudo iptables -P INPUT DROP
printf "\n"
printf "Enjoy"
printf "\n"


#!/bin/bash
function myfunc() {
    total=$1
    nr=$2
    value=$(((($nr + 1) * 100) / $total))
    # printf "\r%s%% IP: %s" $value $3
    echo -e "\e[1A\e[K${value}%  IP: ${3}"
}
scriptPath=$(dirname $0)
whitelistInput="${scriptPath}/cidrIp.txt"
wLineNr=$(wc -l < $whitelistInput)
printf "Total of %s rules to apply...\n" $wLineNr

for ((i = 0 ; i < $wLineNr ; i++)); do
    #  do iptable command
    iprange=$( sed -n "${i}p" < $whitelistInput )
    # echo $iprange
    # echo  iptables -A INPUT -s $iprange -j ACCEPT 
    # iptables -A INPUT -s $iprange -j ACCEPT
    myfunc $wLineNr $i $iprange
done

printf "\n"
printf "time to ban whole word"
sudo iptables -P INPUT DROP
printf "\n"
printf "Enjoy"
printf "\n"


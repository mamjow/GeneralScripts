#!/bin/bash
function myfunc() {
    total=$1
    nr=$2
    value=$((($nr * 100) / $total))
    # printf "\r%s%% IP: %s" $value $3
    echo -e "\e[1A\e[K${value}%  IP: ${3}"
}
scriptPath=$(dirname $0)
whitelistInput="${scriptPath}/cidrIp.txt"
wLineNr=$(wc -l < $whitelistInput)
printf "Total of %s rules to apply...\n" $wLineNr

for ((i = 1 ; i <= $wLineNr ; i++)); do
    #  do iptable command
    if iprange=$( sed -n "${i}p" < $whitelistInput ); then
        # echo $iprange
        # echo  iptables -A INPUT -s $iprange -j ACCEPT
        if iptables -I INPUT -s $iprange -j ACCEPT; then
            myfunc $wLineNr $i $iprange
        else
            echo "Failed to apply $iprange"
        fi
    else
        echo "Failed to read Ip adress sy line $i"
    fi
done

printf "\n"
printf "time to ban whole word"
sudo iptables -P INPUT DROP
printf "\n"
printf "Enjoy"
printf "\n"


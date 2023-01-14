#!/bin/bash
fileLocation=$(pwd)
bashLocations="${BASH_SOURCE/./$fileLocation}"
bashLocations="${bashLocations///ban.sh}"
sudo chmod +x $bashLocations/iptables/applyingrules.sh
echo "Hoi hoi"
while true; do
    read -p "Do you wish to apply Iran, Netherlands firewall whitelist and General block? [y/n]" yn
    case $yn in
        [Yy]* )
            echo "Applying ACCEPT rules";
            # ( exec "./iptables/applyingrules.sh" )
            bash $bashLocations/iptables/applyingrules.sh $bashLocations
            exit
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

#!/bin/bash
scriptPath=$(dirname $0)
sudo chmod +x "${scriptPath}/iptables/applyingrules.sh"
echo "Hoi hoi"
while true; do
    read -p "Do you wish to apply Iran, Netherlands firewall whitelist and General block? [y/n]: " yn
    case $yn in
        [Yy]* )
            echo "Applying ACCEPT rules";
            # ( exec "./iptables/applyingrules.sh" )
            bash "${scriptPath}/iptables/applyingrules.sh"
            exit
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

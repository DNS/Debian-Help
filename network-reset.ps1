
# run as root

rfkill list && iwconfig
rfkill unblock all
modprobe -r iwlwifi && modprobe iwlwifi && systemctl restart NetworkManager


#!/usr/bin/env sh

# MUST BE RUN AS ROOT

# enable su
#passwd -d root
#passwd -d dns

sudo su

# add 3rd party software repo
#apt-add-repository -y contrib non-free

# install powershell
apt update
apt install -y wget
pwsh_filename=$( curl -s https://api.github.com/repos/PowerShell/PowerShell/releases/latest | grep -iPo -m1 '(?i)name"\: "\K.+?amd64\.deb' )
pwsh_dl=$( curl -s https://api.github.com/repos/PowerShell/PowerShell/releases/latest | grep -iPo -m 1 '(?i)"browser_download_url"\: "\K.+?amd64\.deb' )
wget -cnd $pwsh_dl
dpkg -i $pwsh_filename
apt install -f
#rm $pwsh_filename

# Change default shell
#chsh -s /usr/bin/pwsh root
#chsh -s /usr/bin/pwsh dns
touch /root/.hushlogin


pwsh -Command 'Set-PSReadLineOption -PredictionViewStyle ListView'


# second stage installer
pwsh ./setup-second.ps1


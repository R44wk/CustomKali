#!/bin/bash

# Global variables
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
NC='\033[0m'
cyan='\e[0;36m'
lightcyan='\e[96m'
green='\e[0;32m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
purpura='\e[0;35m'
AV="AV-Evation"
DOS="DoS-attack"
EXPLOIT="Exploit"
FRAMEWORK="Framework"
INCIDENT="Incident"
OSINT="OSINT"
SOCIAL="Social-Ing"
APP="Vulneravility-App"
SHELL="Webshell"
WIFI="WiFi"
token=" "  


###############################################################################################################################
clear



#Install Hack Nerd Font
echo -e "${BLUE} \n Install fonts. ﯔ ${NC}"
wget -P /usr/local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
sleep 2 
unzip /usr/local/share/fonts/Hack.zip  -d /usr/local/share/fonts/ && rm /usr/local/share/fonts/Hack.zip
sleep 4 
mkdir /root/.config
clear

Kali(){

NUM=$(cat /etc/passwd | cut -d: -f3)
MIN="999"
MAX="2000"
 
echo -e "${purpura}\n..::Your System users::..\n${NC}"
echo
for ID in do $NUM; do
    if [ $ID -gt $MIN > /dev/null 2>&1 ] && [ $ID -lt $MAX > /dev/null 2>&1 ] ; then
                USER=$(cat /etc/passwd | cut -d: -f1-3 | grep $ID | cut -d: -f1)
                echo -e "${lightgreen} >> $USER ${NC}"
        fi
done

echo -e "\n=========================================================================================================\n"
read -p "Enter your username:~# " DANT
read -p "Enter your GitHub APIKey:~# " token

echo -e "${BLUE}\n Upgrade Kali.  ${NC}"
apt update ; apt -y upgrade ; apt -y dist-upgrade ; apt -y autoremove ; apt -y autoclean ; apt -y full-upgrade; updatedb
apt -y install openjdk-8-jdk
apt -y install python3-dev python3-venv python3-pip build-essential libffi-dev libssl-dev libxml2-dev libxslt1-dev zlib1g-dev wkhtmltopdf

echo -e "${BLUE}\n Create Paths 嬨 " ${NC}
#create paths
mkdir /opt/Tools
mkdir /opt/Tools/{$DOS,$AV,$EXPLOIT,$FRAMEWORK,$INCIDENT,$OSINT,$SOCIAL,$APP,$SHELL,$WIFI}


#Install NordVPN
echo -e "${BLUE}\n Install NordVPN 嬨 " ${NC}
wget -O /home/$DANT/Downloads/CustomKali/nordvpn.deb https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb?_ga=2.63514733.310161373.1623303705-1134963399.1623303705
cd /home/$DANT/Downloads/CustomKali/
apt install ./nordvpn.deb && apt update && apt install nordvpn
rm /home/$DANT/Downloads/CustomKali/nordvpn.deb

echo -e "${BLUE}\n Install OpenVPN. 嬨 ${NC}"
apt install -y network-manager-openvpn
apt install -y network-manager-openvpn-gnome
apt install -y network-manager-pptp
apt install -y network-manager-pptp-gnome
apt install -y  network-manager-strongswan
apt install -y network-manager-vpnc
apt install -y network-manager-vpnc-gnome

echo -e "${BLUE}\n Install Mono. 嬨 ${NC}"
apt install -y mono-devel

echo -e "${BLUE}\n Trensmission. 褐 ${NC}"
apt install -y transmission

echo -e "${BLUE}\n Feroxbuster. 褐 ${NC}"
apt install -y feroxbuster

echo -e "${BLUE}\n Keepass. 褐 ${NC}"
apt install -y keepass2

echo -e "${BLUE}\n PW-10K.  ${NC}"
#Install powerlevel10k in user
cd /home/$DANT/ && git clone --depth=1 https://$token@github.com/romkatv/powerlevel10k.git /home/$DANT/powerlevel10k
sudo echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc # && zsh
cp /home/$DANT/Downloads/CustomKali/p10k.zsh /home/$DANT/.p10k.zsh
#mv /home/$DANT/.zshrc /home/$DANT/zshrcBACKUP 
cp /home/$DANT/Downloads/CustomKali/zshrc /home/$DANT/.zshrc
sleep 2
#Install Oh myTmux
cd /home/$DANT/ && git clone https://$token@github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cp /home/$DANT/Downloads/CustomKali/tmux.conf.local /home/$DANT/.tmux.conf.local

#Install powerlevel10k in root
cd /root && git clone --depth=1 https://$token@github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc # && zsh
cp /home/$DANT/Downloads/CustomKali/p10k.zsh /root/.p10k.zsh
#mv /root/.zshrc /root/zshrcBACKUP
cp /home/$DANT/Downloads/CustomKali/zshrc /root/.zshrc
#Install Oh myTmux
cd /root && git clone https://$token@github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cp /home/$DANT/Downloads/CustomKali/tmux.conf.local /root/.tmux.conf.local

cd /root && rm .zshrc && rm .tmux.conf.local
ln -s -f /home/$DANT/.zshrc .zshrc && ln -s -f /home/$DANT/.tmux.conf.local .tmux.conf.local

#Install lsd
echo -e "${BLUE}\n LSD.  ${NC}"
cd /home/$DANT/Downloads/CustomKali/
wget https://$token@github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb
dpkg -i lsd-musl_0.20.1_amd64.deb

#Install bat
echo -e "${BLUE}\n BAT.  ${NC}"
wget https://$token@github.com/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1_amd64.deb
dpkg -i bat_0.18.1_amd64.deb
rm *.deb
source /root/.zshrc

echo -e "${BLUE}\n rlwrap.  ${NC}"
apt install rlwrap -y 

#Install Telegram
echo -e "${BLUE}\n Telegram.  ${NC}"
wget -O /home/$DANT/Desktop/telegram.tar.xz  https://telegram.org/dl/desktop/linux
tar -Jxvf /home/$DANT/Desktop/telegram.tar.xz -C /home/$DANT/Desktop/ && rm /home/$DANT/Desktop/telegram.tar.xz

#Install Visual Studio code
echo -e "${BLUE}\n VSC.  ${NC}"
wget -O /home/$DANT/Downloads/CustomKali/visual.deb https://az764295.vo.msecnd.net/stable/b4c1bd0a9b03c749ea011b06c6d2676c8091a70c/code_1.57.0-1623259737_amd64.deb
dpkg -i /home/$DANT/Downloads/CustomKali/visual.deb; rm /home/$DANT/Downloads/CustomKali/visual.deb

#Instal driver Wifi
echo -e "${BLUE}\n Install WiFi Realtek 8812AU/8821AU Driver   ${NC}"
apt-get install -y linux-headers-$(uname -r) 
git clone https://$token@github.com/aircrack-ng/rtl8812au /home/$DANT/Downloads/CustomKali/rtl8812au
cd /home/$DANT/Downloads/CustomKali/rtl8812au
apt install -y dkms
make dkms_remove; sleep 2
make dkms_install; cd /home/$DANT/Downloads/CustomKali/

echo -e "${BLUE}\n Install GIMP   ${NC}"
apt install gimp -y 

echo -e "${BLUE}\n Install Remina.  ${NC}"
apt-get install remmina -y

echo -e "${BLUE}\n Install Chrome.  ${NC}"
wget -P /home/$DANT/Downloads/CustomKali/ https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb; rm /home/$DANT/Downloads/CustomKali/google-chrome-stable_current_amd64.deb

echo -e "${BLUE}\n Install Nessus. 陋 ${NC}"
wget -O /home/$DANT/Downloads/CustomKali/nessus.deb https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/12696/download?i_agree_to_tenable_license_agreement=true
dpkg -i /home/$DANT/Downloads/CustomKali/nessus.deb; rm /home/$DANT/Downloads/CustomKali/nessus.deb
/bin/systemctl start nessusd.service

echo -e "${BLUE}\n Subfinder. 陋 ${NC}"
apt install -y subfinder

echo -e "${BLUE}\n Speddtest. 陋 ${NC}"
apt install -y speedtest-cli

echo -e "${BLUE}\n Install Tor. 﨩 ${NC}"
apt install tor -y 
systemctl start tor
apt install -y onionshare
systemctl enable tor

echo -e "${BLUE}\n Install i2p.  ${NC}"
docker pull geti2p/i2p

echo -e "${BLUE}\n Install Dirsearch.  ${NC}"
apt install -y dirsearch

echo -e "${BLUE}\n Install OpenVPN.  ${NC}"
apt install network-manager-openvpn
apt install network-manager-openvpn-gnome
apt install network-manager-pptp
apt install network-manager-pptp-gnome
apt install network-manager-strongswan
apt install network-manager-vpnc
apt install network-manager-vpnc-gnome

echo -e "${BLUE}\n Install OpenOffice.  ${NC}"
wget -P /home/$DANT/Downloads/CustomKali/ https://netactuate.dl.sourceforge.net/project/openofficeorg.mirror/4.1.10/binaries/es/Apache_OpenOffice_4.1.10_Linux_x86-64_install-deb_es.tar.gz
tar -xzvf /home/$DANT/Downloads/CustomKali/Apache_OpenOffice_4.1.10_Linux_x86-64_install-deb_es.tar.gz && rm /home/$DANT/Downloads/CustomKali/Apache_OpenOffice_4.1.10_Linux_x86-64_install-deb_es.tar.gz
cd /home/$DANT/Downloads/CustomKali/es/DEBS; dpkg -i *.deb
cd /home/$DANT/Downloads/CustomKali/es/DEBS/desktop-integration; dpkg -i *.deb; cd /home/$DANT/Downloads && rm -rf es

echo -e "${BLUE}\n Install Docker.  ${NC}"
apt install -y docker.io
systemctl enable docker --now

echo -e "${BLUE}\n Install Virtualenv.  ${NC}"
pip3 install virtualenv

echo -e "${BLUE}\n Install Go.  ${NC}"
apt install -y golang

echo -e "${BLUE}\n Install VLC.  ${NC}"
apt install -y vlc

echo -e "${BLUE}\n Install NSearch.  ${NC}"
git clone https://$token@github.com/jtibaquira/nsearch.git /opt/NSearch
#Instalar y ejecutar en virtualenv

echo -e "${BLUE}\n Install VulnScan.  ${NC}"
git clone https://$token@github.com/scipag/vulscan.git /usr/share/nmap/scripts/vulscan/

# Install POLYBAR
echo -e "${BLUE}\n Install Polybar.  ${NC}"
apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
apt install -y libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
#wget -P /opt/ https://github.com/polybar/polybar/releases/download/3.5.6/polybar-3.5.6.tar.gz
#tar -xf /opt/polybar-3.5.6.tar.gz -C /opt/ #&& rm /opt/polybar-3.5.6.tar.gz && cd /opt/polybar-3.5.6
#mkdir build; cd /opt/polybar-3.5.6/build && cmake ..; make -j$(nproc); make install
apt install -y polybar && apt install -y gnome-shell-extension-autohidetopbar
sleep 1
cp  -r /home/$DANT/Downloads/CustomKali/polybar /root/.config/polybar 2>>/home/$DANT/Downloads/CustomKali/error.txt && cp -r /home/$DANT/Downloads/CustomKali/polybar /home/$DANT/.config/polybar  2>>/home/$DANT/Downloads/CustomKali/error.txt
cp /root/.config/polybar/launch.sh /etc/init.d/  2>>/home/$DANT/Downloads/CustomKali/error.txt && chmod 777 /etc/init.d/launch.sh  2>>/home/$DANT/Downloads/CustomKali/error.txt && update-rc.d launch.sh defaults  2>>/home/$DANT/Downloads/CustomKali/error.txt
sleep 2
/etc/init.d/launch.sh start 2>/dev/null
#gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval string:\'Main.panel.actor.hide();\'
chmod +x /root/.config/polybar/bin/*.sh


mv /home/$DANT/Downloads/CustomKali/matrix.sh /bin/matrix.sh; chmod +x /bin/matrix.sh

#Install BETTERCAP
echo -e "${YELLOW}\n Install Bettercap.  ${NC}"
apt install -y bettercap

#Install Discover
echo -e "${YELLOW}\n Install Discover.  ${NC}"
cd /opt; git clone https://$token@github.com/leebaird/discover.git
cd /opt/discover; chmod +x update.sh; ./update.sh

#Install Proxmark3
echo -e "${YELLOW}\n Install Proxmark3.  ${NC}"
apt install -y git build-essential readline-common libreadline-dev gcc-arm-none-eabi libusb-0.1-4 libusb-dev libncurses-dev perl pkg-config libpcsclite-dev pcscd
cd /opt; git clone https://$token@github.com/Proxmark/proxmark3.git
cd proxmark3
make clean && make all


}

###############################################################################################################################
################################################## AV-Evation #################################################################
###############################################################################################################################


AV-Evation(){

echo -e "${YELLOW}\n Download AV-Evation.${NC}"

cd /opt/Tools/$AV; git clone https://$token@github.com/phra/Phantom-Evasion.git
cd /opt/Tools/$AV; git clone https://$token@github.com/Screetsec/TheFatRat.git
cd /opt/Tools/$AV; git clone https://$token@github.com/EgeBalci/HERCULES.git
cd /opt/Tools/$AV; git clone https://$token@github.com/outflanknl/EvilClippy.git
cd /opt/Tools/$AV; git clone https://$token@github.com/tokyoneon/Chimera.git

echo -e "${cyan}\n Install Chimera.${NC}" 
cd /opt/Tools/$AV/Chimera
apt-get update && sudo apt-get install -Vy sed xxd libc-bin curl jq perl gawk grep coreutils git
chmod +x chimera.sh

echo -e "${cyan}\n Install EvilClippy.${NC}"
cd /opt/Tools/$AV/EvilClippy
mcs /reference:OpenMcdf.dll,System.IO.Compression.FileSystem.dll /out:EvilClippy.exe *.cs

echo -e "${cyan}\n Install HERCULES.${NC}"
cd /opt/Tools/$AV/HERCULES
apt install golang -y; go get github.com/fatih/color; go run Setup.go; chmod +x HERCULES

echo -e "${cyan}\nInstall TheFatRat.${NC}"
cd /opt/Tools/$AV/TheFatRat
chmod +x setup.sh && ./setup.sh

echo -e "${cyan}\nInstall shellter.${NC}"
cd /opt/Tools/$AV/
apt-get install shellter -y

echo -e "${cyan}\nInstall Phantom-Evasion.${NC}"
cd /opt/Tools/$AV/Phantom-Evasion; python3 phantom-evasion.py --setup

git clone https://$token@github.com/devploit/XORpass
}

###############################################################################################################################
######################################################## WiFi #################################################################
###############################################################################################################################


wifi(){

echo -e "${YELLOW}\nInstall evilTrust.${NC}"
cd /opt/Tools/$WIFI
git clone https://$token@github.com/s4vitar/evilTrust.git
cd /opt/Tools/$WIFI/evilTrust; chmod +x evilTrust.sh

echo -e "${YELLOW}\nInstall HT-WPS-Breaker.${NC}"
cd /opt/Tools/$WIFI
git clone https://$token@github.com/SilentGhostX/HT-WPS-Breaker.git
cd /opt/Tools/$WIFI/HT-WPS-Breaker; chmod +x HT-WB.sh

echo -e "${YELLOW}\nInstall Wifite2.${NC}"
cd /opt/Tools/$WIFI
git clone https://$token@github.com/derv82/wifite2.git
cd /opt/Tools/$WIFI/wifite2

echo -e "${YELLOW}\nInstall wirespy.${NC}"
cd /opt/Tools/$WIFI
git clone https://$token@github.com/aress31/wirespy.git
cd /opt/Tools/$WIFI/wirespay; chmod +x wirespy.sh

git clone https://$token@github.com/vanhoefm/krackattacks-scripts.git krackattacks

git clone https://$token@github.com/Telefonica/HomePWN.git

git clone https://$token@github.com/hash3liZer/WiFiBroot.git


}


###############################################################################################################################
######################################################### DoS  ################################################################
###############################################################################################################################

Dos(){

echo -e "${YELLOW}\nInstall Bash-tls-reneg-attack${NC}"
cd  /opt/Tools/$DOS;git clone https://$token@github.com/c826/bash-tls-reneg-attack.git
cd /opt/Tools/$DOS/bash-tls-reneg-attack; chmod +x tls-reneg.sh

echo -e "${YELLOW}\ninstall GoldenEye${NC}"
cd  /opt/Tools/$DOS;git clone https://$token@github.com/jseidl/GoldenEye.git

echo -e "${YELLOW}\ninstall Memcrashed-DDoS${NC}"
cd  /opt/Tools/$DOS;git clone https://$token@github.com/649/Memcrashed-DDoS-Exploit.git
cd /opt/Tools/$DOS/Memcrashed-DDoS-Exploit
pip3 install scapy;pip3 install shodan
docker build -t memcrashed .

echo -e "${YELLOW}\nInstall Pentmenu${NC}"
cd  /opt/Tools/$DOS;git clone https://$token@github.com/GinjaChris/pentmenu.git

echo -e "${YELLOW}\nInstall Saddam${NC}"
cd  /opt/Tools/$DOS;git clone https://$token@github.com/OffensivePython/Saddam.git
cd /opt/Tools/$DOS/Saddam
pip install pinject

echo -e "${YELLOW}\nInstall XERXES${NC}"
cd  /opt/Tools/$DOS;git clone https://$token@github.com/XCHADXFAQ77X/XERXES.git
cd /opt/Tools/$DOS/XERXES; gcc -o xerxes xerxes.c

echo -e "${YELLOW}\nInstall Zambie${NC}"
cd  /opt/Tools/$DOS;git clone https://$token@github.com/iTzPrime/zambie.git
cd /opt/Tools/$DOS/zambie; chmod +x Installer.sh; ./Installer.sh
}

###############################################################################################################################
##################################################### Exploit #################################################################
###############################################################################################################################

Exploit (){

echo -e "${YELLOW}\nInstall Apache-Struts${NC}"
cd  /opt/Tools/$EXPLOIT; git clone https://$token@github.com/s1kr10s/Apache-Struts-v4.git

echo -e "${YELLOW}\nInstall AutoSploit${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/salvul/AutoSploit.git
cd  /opt/Tools/$EXPLOIT/AutoSploit/; pip install -r requirements.txt

echo -e "${YELLOW}\nBlueKeep${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/ekultek/bluekeep
cd  /opt/Tools/$EXPLOIT/bluekeep/; pip install -r requirements.txt

echo -e "${YELLOW}\nDeathstar${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/byt3bl33d3r/DeathStar.git

echo -e "${YELLOW}\nEasy-P${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/cheetz/Easy-P.git

echo -e "${YELLOW}\nhtbenum${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/SolomonSklash/htbenum.git
cd /opt/Tools/$EXPLOIT/htbtenum\; chmod +x htbenum.sh

echo -e "${YELLOW}\nIbombshell${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/Telefonica/ibombshell.git
cd  /opt/Tools/$EXPLOIT/ibombshell
pip install termcolor gnureadline pynput

echo -e "${YELLOW}\nImpacket${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/SecureAuthCorp/impacket.git
cd  /opt/Tools/$EXPLOIT/impacket pip3 install

echo -e "${YELLOW}\nJexboss${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/joaomatosf/jexboss.git
cd  /opt/Tools/$EXPLOIT/jexboss ;pip install -r requires.txt

echo -e "${YELLOW}\nMITMF${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/byt3bl33d3r/MITMf.git
apt-get install -y python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone-dev libffi-dev file
cd  /opt/Tools/$EXPLOIT/MITMf && git submodule init && git submodule update --recursive
pip install -r requirements.txt

#echo -e "${YELLOW}PolarBearRepo${NC}"
#cd  /opt/Tools/$EXPLOIT;git clone

echo -e "${YELLOW}\nRouterSploit${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/threat9/routersploit.git
cd /opt/Tools/$EXPLOIT/routersploit
python3 -m pip install -r requirements.txt

echo -e "${YELLOW}\nSippts${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/Pepelux/sippts.git
apt install libio-socket-timeout-perl libnetaddr-ip-perl libnet-address-ip-local-perl libnet-pcap-perl libtext-string-hexconvert-perl libdbd-sqlite3-perl

echo -e "${YELLOW}\nWesng${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/bitsadmin/wesng.git

echo -e "${YELLOW}\nxmlrpc-bruteforce${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/aress31/xmlrpc-bruteforcer.git
cd  /opt/Tools/$EXPLOIT/xmlrpc-bruteforcer
pip install -r requirements.txt

echo -e "${YELLOW}\nZeroLogon${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/dirkjanm/CVE-2020-1472.git ZeroLogon
cd  /opt/Tools/$EXPLOIT/ZeroLogon; 
pip install cffi==1.14.2 click==7.1.2 cryptography==3.1 dnspython==2.0.0 Flask==1.1.2 future==0.18.2 impacket==0.9.21 itsdangerous==1.1.0 Werkzeug==1.0.1
pip install Jinja2==2.11.2 ldap3==2.8 ldapdomaindump==0.9.3 MarkupSafe==1.1.1 pyasn1==0.4.8 pycparser==2.20 pycryptodomex==3.9.8 pyOpenSSL==19.1.0 six==1.15.0

echo -e "${YELLOW}\nInstall CVE-2019-0708${NC}"
cd  /opt/Tools/$EXPLOIT; git clone https://$token@github.com/Leoid/CVE-2019-0708.git
cd  /opt/Tools/$EXPLOIT/CVE-2019-0708

git clone https://$token@github.com/dorkerdevil/CVE-2019-11932.git WhatsApp-Exploit

}


###############################################################################################################################
##################################################### Framework ###############################################################
###############################################################################################################################

Framework(){

echo -e "${YELLOW}\nInstall Crips${NC}"
cd  /opt/Tools/$FRAMEWORK; git clone https://$token@github.com/Manisso/Crips.git
cd /opt/Tools/$FRAMEWORK/Crips; chmod +x install.sh;./install.sh

echo -e "${YELLOW}\nInstall jboss-autopwn${NC}"
cd  /opt/Tools/$FRAMEWORK; git clone https://$token@github.com/SpiderLabs/jboss-autopwn.git

echo -e "${YELLOW}\nInstall ZSC${NC}"
cd  /opt/Tools/$FRAMEWORK;git clone https://$token@github.com/OWASP/ZSC.git
cd /opt/Tools/$FRAMEWORK/ZSC; python installer.py

echo -e "${YELLOW}\nInstall Sparta${NC}"
apt install python3-sqlalchemy python3-pyqt5 wkhtmltopdf ldap-utils rwho rsh-client x11-apps finger -y
cd  /opt/Tools/$FRAMEWORK;git clone https://$token@github.com/secforce/sparta.git; cp sparta /usr/bin

echo -e "${YELLOW}\nInstall V3n0M-Scanner${NC}"
cd  /opt/Tools/$FRAMEWORK;git clone https://$token@github.com/v3n0m-Scanner/V3n0M-Scanner.git
apt-get install python3-dev apt-get install python-dev -y
cd /opt/Tools/$FRAMEWORK/V3n0M-Scanner/; python3 setup.py install --user

echo -e "${YELLOW}\nInstall BtleJuice Framework${NC}"
apt-get -y install bluetooth bluez libbluetooth-dev libudev-dev
npm install -g btlejuice

echo -e "${YELLOW}\nInstall MobSF${NC}"
cd  /opt/Tools/$FRAMEWORK;git clone https://$token@github.com/MobSF/Mobile-Security-Framework-MobSF.git
cd  /opt/Tools/$FRAMEWORK/Mobile-Security-Framework-MobSF; chmod +x *.sh
./setup.sh
}

###############################################################################################################################
##################################################### Incident ################################################################
###############################################################################################################################

Incident(){

echo -e "${YELLOW}\nInstall Logontracer${NC}"
cd  /opt/Tools/$INCIDENT; git clone https://$token@github.com/JPCERTCC/LogonTracer.git
cd  /opt/Tools/$INCIDENT/LogonTracer;  docker pull jpcertcc/docker-logontracer

echo -e "${YELLOW}\nInstall Wesng${NC}"
cd  /opt/Tools/$INCIDENT; git clone  https://$token@github.com/bitsadmin/wesng.git

echo -e "${YELLOW}\nInstall Oletools${NC}"
cd  /opt/Tools/$INCIDENT; git clone  https://$token@github.com/decalage2/oletools.git

}

###############################################################################################################################
##################################################### IngSocial ###############################################################
###############################################################################################################################

Social (){
echo -e "${YELLOW}\nInstall AdvPhishing${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/Ignitetch/AdvPhishing.git
cd /opt/Tools/$SOCIAL/AdvPhishing/; chmod 777 start.sh; ./start.sh

echo -e "${YELLOW}\nInstall CactusTorch${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/xillwillx/CACTUSTORCH_DDEAUTO.git
cd  /opt/Tools/$SOCIAL/CACTUSTORCH_DDEAUTO; git clone https://github.com/mdsecactivebreach/CACTUSTORCH.git

echo -e "${YELLOW}\nInstall Cuteit${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/D4Vinci/Cuteit.git

echo -e "${YELLOW}\nInstall HiddenEye${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/DarkSecDevelopers/HiddenEye-Legacy.git
cd  /opt/Tools/$SOCIAL/HiddenEye-Legacy; pip install -r requirements.txt

echo -e "${YELLOW}\nInstall IP-Obfuscator${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/findneo/IP-Obfuscator.git

echo -e "${YELLOW}\nInstall MaliciousMacroMSBuild${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/infosecn1nja/MaliciousMacroMSBuild.git

echo -e "${YELLOW}\nInstall Modlishka${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/drk1wi/Modlishka.git

}

###############################################################################################################################
###################################################### OSINT ##################################################################
###############################################################################################################################

Osint(){

echo -e "${YELLOW}\n Download Tools OSINT ${NC}"
cd  /opt/Tools/$OSINT/

git clone https://$token@github.com/stark0de/nginxpwner.git
git clone https://$token@github.com/six2dez/reconftw.git
git clone https://$token@github.com/thewhiteh4t/FinalRecon.git
git clone https://$token@github.com/smackerdodi/403bypasser.git
git clone https://$token@github.com/sense-of-security/ADRecon.git
git clone https://$token@github.com/1N3/BlackWidow.git
git clone https://$token@github.com/mattweidner/bucket_finder.git
git clone https://$token@github.com/lobuhi/byp4xx.git
git clone https://$token@github.com/christophetd/cloudflair.git
git clone https://$token@github.com/greycatz/CloudUnflare.git
git clone https://$token@github.com/D4Vinci/Cr3dOv3r.git
git clone https://$token@github.com/lightos/credmap.git
git clone https://$token@github.com/UnaPibaGeek/ctfr.git
git clone https://$token@github.com/ThoughtfulDev/EagleEye
git clone https://$token@github.com/mxrch/GHunt.git
git clone https://$token@github.com/liamg/gitjacker.git
git clone https://$token@github.com/FeeiCN/gsil.git
git clone https://$token@github.com/khast3x/h8mail.git
git clone --depth 1 https://$token@github.com/stamparm/identYwaf.git
git clone https://$token@github.com/m4ll0k/Infoga.git infoga
git clone https://$token@github.com/adnane-X-tebbaa/Katana.git
git clone https://$token@github.com/adnane-X-tebbaa/GRecon.git
git clone https://$token@github.com/guelfoweb/knock.git
git clone https://$token@github.com/4w4k3/KnockMail.git
git clone https://$token@github.com/m4ll0k/Konan.git konan
git clone https://$token@github.com/davidtavarez/pwndb
git clone https://$token@github.com/TunisianEagles/quasar.git
git clone https://$token@github.com/lolwaleet/ReverseIP.git
git clone https://$token@github.com/Anon-Exploiter/ReVeRsE-IP.git
git clone https://$token@github.com/s4vitar/rpcenum.git
git clone https://$token@github.com/ollypwn/SMBGhost.git
git clone https://$token@github.com/ZecOps/CVE-2020-1206-POC.git
git clone https://$token@github.com/cytopia/smtp-user-enum.git
git clone https://$token@github.com/adityaks/sparty.git
git clone https://$token@github.com/aboul3la/Sublist3r.git
git clone --recursive https://$token@github.com/screetsec/Sudomy.git
git clone --depth 1 https://$token@github.com/drwetter/testssl.sh.git
git clone https://$token@github.com/DedSecInside/TorBot.git
git clone https://$token@github.com/m3n0sd0n4ld/uDork
git clone https://$token@github.com/wishihab/userrecon.git
git clone https://$token@github.com/wafpassproject/wafpass.git
git clone https://$token@github.com/Ekultek/WhatBreach.git
git clone https://$token@github.com/Ekultek/WhatWaf.git
git clone https://$token@github.com/Rumpelstiltsquin/MyOS.git
git clone https://$token@github.com/Rumpelstiltsquin/CheckWeb.git
git clone https://$token@github.com/gocaio/goca.git
git clone https://$token@github.com/liamg/furious.git
git clone https://$token@github.com/iojw/socialscan.git
git clone https://$token@github.com/Dheerajmadhukar/karma_v2.git
git clone https://$token@github.com/smicallef/spiderfoot.git
git clone https://$token@github.com/BishopFox/GitGot.git
}


###############################################################################################################################
####################################################### Apps ##################################################################
###############################################################################################################################

App(){

echo -e "${YELLOW}\n Download Tools AppVulnerability ${NC}"
cd  /opt/Tools/$APP/

git clone https://$token@github.com/s0md3v/XSStrike.git
git clone https://$token@github.com/almandin/fuxploider.git



}



Banner() {

echo -e "\n\n${BLUE}  ██╗  ██╗ █████╗ ██╗     ██╗       ██████╗██╗   ██╗███████╗████████╗ ██████╗ ███╗   ███╗${NC}"
sleep 0.10
echo -e "${BLUE}  ██║ ██╔╝██╔══██╗██║     ██║      ██╔════╝██║   ██║██╔════╝╚══██╔══╝██╔═══██╗████╗ ████║${NC}"
sleep 0.10
echo -e "${BLUE}  █████╔╝ ███████║██║     ██║█████╗██║     ██║   ██║███████╗   ██║   ██║   ██║██╔████╔██║${NC}"
sleep 0.10
echo -e "${cyan}  ██╔═██╗ ██╔══██║██║     ██║╚════╝██║     ██║   ██║╚════██║   ██║   ██║   ██║██║╚██╔╝██║${NC}"
sleep 0.10
echo -e "${cyan}  ██║  ██╗██║  ██║███████╗██║      ╚██████╗╚██████╔╝███████║   ██║   ╚██████╔╝██║ ╚═╝ ██║${NC}"
sleep 0.10
echo -e "${cyan}  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝       ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝${NC}"
echo -e "${YELLOW}                                                                                          By R4wk ${white} ${NC}"                                                                                       

}

Banner
sleep 2 
Kali
sleep 2 
AV-Evation
sleep 2
wifi
sleep 2
Dos
sleep 2 
Exploit
apt update -y && apt upgrade 
Framework
sleep 2 
Incident
sleep 2 
Social
sleep 2 
Osint
sleep2
App


chown -R $DANT: /opt/
nordvpn set dns 1.1.1.1 8.8.8.8 #set DNS in NordVPN
#rm -rf /home/$DANT/Downloads/CustomKali/*
echo -e "${BLUE}\nUpdating locate database.${NC}"
updatedb
source /root/.zshrc
echo -e "${red}\nSYSTEM REBOOT....${NC}"
sleep 5
#reboot
exit





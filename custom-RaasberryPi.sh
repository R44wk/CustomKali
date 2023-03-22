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
token="" 
track=$(pwd)



###############################################################################################################################
#create tracks
mkdir /opt/Tools;
mkdir /opt/Tools/{$DOS,$AV,$EXPLOIT,$FRAMEWORK,$INCIDENT,$OSINT,$SOCIAL,$APP,$SHELL,$WIFI};

clear;

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

for ID in do $NUM; do
    if [ $ID -gt $MIN > /dev/null 2>&1 ] && [ $ID -lt $MAX > /dev/null 2>&1 ] ; then
                USER=$(cat /etc/passwd | cut -d: -f1-3 | grep $ID | cut -d: -f1)
                echo -e "${lightgreen}  >> $USER ${NC}"
        fi
done

echo -e "\n=========================================================================================================\n"
read -p " Enter your username:~# " DANT
read -p " Enter your APIKey Github:~# " token

echo -e "${BLUE}\n Upgrade Kali.  ${NC}"
apt -y update ; apt -y upgrade ; apt -y dist-upgrade ; apt -y autoremove ; apt -y autoclean ; apt -y full-upgrade; updatedb
}

###############################################################################################################################
###############################################################################################################################

system(){



#========================================================================================================================================================
#                                                                      Misc.
#========================================================================================================================================================

#Install NordVPN
echo -e "${BLUE}\n Install NordVPN 嬨  ${NC}"
wget -O $track/nordvpn.deb https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb?_ga=2.63514733.310161373.1623303705-1134963399.1623303705
cd $track/
apt install ./nordvpn.deb && apt update && apt install nordvpn
rm $track/nordvpn.deb


echo -e "${BLUE}\n Trensmission. 褐 ${NC}"
apt install -y transmission;


echo -e "${BLUE}\n Ngrok ${NC}"
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
            


echo -e "${BLUE}\n Install Docker.  ${NC}"
apt install -y docker.io; systemctl enable docker --now;

#Install lsd
echo -e "${BLUE}\n LSD.  ${NC}"
cd $track/
wget https://github.com/Peltoche/lsd/releases/download/0.23.0/lsd-musl_0.23.0_arm64.deb
dpkg -i lsd-musl_0.23.0_arm64.deb

#Install bat
echo -e "${BLUE}\n BAT.  ${NC}"
wget https://github.com/sharkdp/bat/releases/download/v0.22.0/bat_0.22.0_arm64.deb; dpkg -i bat_0.22.0_arm64.deb


echo -e "${BLUE}\n rlwrap.  ${NC}"
apt install rlwrap -y; 



#Instal driver Wifi
echo -e "${BLUE}\n Install WiFi Realtek 8812AU/8821AU Driver   ${NC}";
apt-get install -y linux-headers-$(uname -r) ;
git clone https://$token@github.com/aircrack-ng/rtl8812au $track/rtl8812au;
cd $track/rtl8812au;
apt install -y dkms;
make dkms_remove; sleep 2;
make dkms_install; cd $track/


echo -e "${BLUE}\n Install Remina.  ${NC}"
apt-get install remmina -y;


echo -e "${BLUE}\n Speddtest. 陋 ${NC}"
apt install -y speedtest-cli;

echo -e "${BLUE}\n Install Tor. 﨩 ${NC}"
systemctl start tor;systemctl enable tor;


echo -e "${BLUE}\n Install Virtualenv.  ${NC}"
pip3 install virtualenv;

echo -e "${BLUE}\n Install Go. ﳑ ${NC}"
apt install -y golang;

echo -e "${BLUE}\n Install NSearch.  ${NC}"
git clone https://$token@github.com/jtibaquira/nsearch.git /opt/NSearch;

echo -e "${BLUE}\n Install VulnScan.  ${NC}"
git clone https://$token@github.com/scipag/vulscan.git /usr/share/nmap/scripts/vulscan/;

cp $track/matrix.sh /bin/matrix.sh; chmod +x /bin/matrix.sh;


#Install Proxmark3
echo -e "${YELLOW}\n Install Proxmark3.  ${NC}"
apt install -y git build-essential readline-common libreadline-dev gcc-arm-none-eabi libusb-0.1-4 libusb-dev libncurses-dev perl pkg-config libpcsclite-dev pcscd
cd /opt; git clone https://$token@github.com/Proxmark/proxmark3.git
cd proxmark3
make clean && make all

echo -e "${YELLOW}\n Install UberTooth.  ${NC}"

apt update && sudo apt install cmake libusb-1.0-0-dev git make gcc g++ libbluetooth-dev wget build-essential pkg-config python3-numpy python3-qtpy python3-distutils python3-setuptools wireshark wireshark-dev libwireshark-dev python3-protobuf python3-requests python3-numpy python3-serial python3-usb python3-dev python3-websockets librtlsdr0 libsqlite3-dev libprotobuf-dev libprotobuf-c-dev protobuf-compiler protobuf-c-compiler libsensors4-dev -y

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
cd /opt/Tools/$AV; git clone https://$token@ggithub.com/tokyoneon/chimera
cd /opt/Tools/$AV; git clone https://$token@github.com/devploit/XORpass
cd /opt/Tools/$AV; git clone https://$token@github.com/abdulkadir-gungor/JPGtoMalware.git

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

echo -e "${YELLOW}\nInstall wirespy.${NC}"
cd /opt/Tools/$WIFI
git clone https://$token@github.com/aress31/wirespy.git
cd /opt/Tools/$WIFI/wirespay; chmod +x wirespy.sh

git clone https://$token@github.com/vanhoefm/krackattacks-scripts.git krackattacks

git clone https://$token@github.com/Telefonica/HomePWN.git

git clone https://$token@github.com/hash3liZer/WiFiBroot.git

git clone https://$token@github.com/FluxionNetwork/fluxion.git

echo -e "${YELLOW}\nInstall BtleJuice Framework${NC}"
apt-get -y install bluetooth bluez libbluetooth-dev libudev-dev
npm install -g btlejuice

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

echo -e "${YELLOW}\nIbombshell${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/Telefonica/ibombshell.git
cd  /opt/Tools/$EXPLOIT/ibombshell
pip install termcolor gnureadline pynput

echo -e "${YELLOW}\nJexboss${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/joaomatosf/jexboss.git
cd  /opt/Tools/$EXPLOIT/jexboss ;pip install -r requires.txt

echo -e "${YELLOW}\nMITMF${NC}"
cd  /opt/Tools/$EXPLOIT;git clone https://$token@github.com/byt3bl33d3r/MITMf.git

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


echo -e "${YELLOW}\nInstall V3n0M-Scanner${NC}"
cd  /opt/Tools/$FRAMEWORK;git clone https://$token@github.com/v3n0m-Scanner/V3n0M-Scanner.git



echo -e "${YELLOW}\nInstall MobSF${NC}"
git clone https://$token@github.com/MobSF/Mobile-Security-Framework-MobSF.git

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

echo -e "${YELLOW}\nInstall IP-Obfuscator${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/findneo/IP-Obfuscator.git

echo -e "${YELLOW}\nInstall MaliciousMacroMSBuild${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/infosecn1nja/MaliciousMacroMSBuild.git

echo -e "${YELLOW}\nInstall Modlishka${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/drk1wi/Modlishka.git

echo -e "${YELLOW}\nInstall ZPhisher${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/htr-tech/zphisher.git

echo -e "${YELLOW}\nInstall Hidden-Eye${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/r3x07/HiddenEye.git

echo -e "${YELLOW}\nInstall PyPhisher${NC}"
cd  /opt/Tools/$SOCIAL/; git clone https://$token@github.com/KasRoudra/PyPhisher

}

###############################################################################################################################
###################################################### OSINT ##################################################################
###############################################################################################################################

Osint(){

echo -e "${YELLOW}\nDownload Tools OSINT ${NC}"
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
git clone https://$token@github.com/BishopFox/GitGot.git
git clone https://$token@github.com/mubix/IOXIDResolver.git
git clone https://$token@github.com/m0rtem/CloudFail.git
git clone https://$token@github.com/ropnop/kerbrute.git
}


###############################################################################################################################
####################################################### Apps ##################################################################
###############################################################################################################################

App(){

echo -e "${YELLOW}\nDownload Tools AppVulnerability ${NC}"
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
echo -e "${YELLOW}                                                                                     By R4wk ${white} ${NC}"                                                                                       

}



Banner
sleep 2 
Kali 
sleep 2 
system 2>>/home/$DANT/Downloads/CustomKali/errors.txt
AV-Evation 2>>/home/$DANT/Downloads/CustomKali/errors.txt
sleep 2
wifi 2>>/home/$DANT/Downloads/CustomKali/>errors.txt
sleep 2
Exploit 2>>/home/$DANT/Downloads/CustomKali/errors.txt
apt update -y && apt upgrade 2>>/home/$DANT/Downloads/CustomKali/errors.txt
Framework 2>>/home/$DANT/Downloads/CustomKali/errors.txt
sleep 2 
Social 2>>/home/$DANT/Downloads/CustomKali/errors.txt
sleep 2 
Osint 2>>/home/$DANT/Downloads/CustomKali/errors.txt
sleep 2
App 2>>/home/$DANT/Downloads/CustomKali/errors.txt
echo -e "\n"
nordvpn set dns 1.1.1.1 8.8.8.8 2>>errors.txt #set DNS in VPN
echo -e "${BLUE}\nUpdating locate database.${NC}"
updatedb 2>>/home/$DANT/Downloads/CustomKali/errors.txt
sleep 2
cd /root && rm .zshrc
cp $track/zshrc /root/.zshrc
ln -s -f /home/$DANT/.zshrc .zshrc
source /root/.zshrc 2>>/home/$DANT/Downloads/CustomKali/errors.txt
sleep 5
echo -e "${red}\nDone...${NC}"
exit





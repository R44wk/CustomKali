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
reconnaissance="Reconnaissance"
weaponization="Weaponization"
delivery="Delivery"
explotation="Explotation_Scalation_C&C"
evation="Defense_Evasion"
exfiltration="Exfiltration"
WIFI="WiFi_BLE"
DOS="DoS-attack"
INCIDENT="Incident"
FRAMEWORK="Framework"
token="" 
track=$(pwd)



###############################################################################################################################
#create paths
mkdir /opt/Tools;
mkdir /opt/Tools/{$reconnaissance,$weaponization,$delivery,$explotation,$evation,$exfiltration,$WIFI,$DOS,$INCIDENT,$FRAMEWORK};

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

echo -e "${BLUE}\n PW-10K.  ${NC}"
#Install powerlevel10k in user
cd /home/$DANT/ && git clone --depth=1 https://$token@github.com/romkatv/powerlevel10k.git /home/$DANT/powerlevel10k
sudo echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc # && zsh
cp $track/p10k.zsh /home/$DANT/.p10k.zsh
#mv /home/$DANT/.zshrc /home/$DANT/zshrcBACKUP 
cp $track/zshrc /home/$DANT/.zshrc
sleep 2
#Install Oh myTmux
cd /home/$DANT/ && git clone https://$token@github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cp $track/tmux.conf.local /home/$DANT/.tmux.conf.local
#Install Oh myTmux in root user
cd /root && git clone https://$token@github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cp $track/tmux.conf.local /root/.tmux.conf.local

cd /root && rm .zshrc && rm .tmux.conf.local
ln -s -f /home/$DANT/.zshrc .zshrc && ln -s -f /home/$DANT/.tmux.conf.local .tmux.conf.local

#Install powerlevel10k in root
cd /root && git clone --depth=1 https://$token@github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc # && zsh
cp $track/p10k.zsh /root/.p10k.zsh
cp $track/zshrc /root/.zshrc

# Install POLYBAR
echo -e "${BLUE}\n Install Polybar.  ${NC}";
apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev;
apt install -y libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev;
#wget -P /opt/ https://github.com/polybar/polybar/releases/download/3.5.6/polybar-3.5.6.tar.gz
#tar -xf /opt/polybar-3.5.6.tar.gz -C /opt/ #&& rm /opt/polybar-3.5.6.tar.gz && cd /opt/polybar-3.5.6
#mkdir build; cd /opt/polybar-3.5.6/build && cmake ..; make -j$(nproc); make install
apt install -y polybar && apt install -y gnome-shell-extension-autohidetopbar;
sleep 1
cp  -r $track/polybar /root/.config/polybar 2>>$track/errors.txt && cp -r $track/polybar /home/$DANT/.config/polybar  2>>$track/errors.txt;
cp /root/.config/polybar/launch.sh /etc/init.d/  2>>$track/errors.txt && chmod 777 /etc/init.d/launch.sh  2>>$track/errors.txt && update-rc.d launch.sh defaults  2>>$track/errors.txt;
sleep 2
/etc/init.d/launch.sh start 2>/dev/null;
#gdbus call --session --dest org.gnome.Shell --object-track /org/gnome/Shell --method org.gnome.Shell.Eval string:\'Main.panel.actor.hide();\'
chmod +x /root/.config/polybar/bin/*.sh
sleep 4

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
            

echo -e "${BLUE}\n Name-that-hash.  ${NC}"
pip3 install name-that-hash


echo -e "${BLUE}\n Install Docker.  ${NC}"
apt-get remove docker docker-engine docker.io containerd runc;
apt install -y curl gnupg2 apt-transport-https software-properties-common ca-certificates;
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg;
echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" | sudo tee  /etc/apt/sources.list.d/docker.list;
apt update;
apt install -y docker-ce docker-ce-cli containerd.io;
systemctl enable docker --now;

#Install lsd
echo -e "${BLUE}\n LSD.  ${NC}"
cd $track/
wget https://$token@github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb
dpkg -i lsd-musl_0.20.1_amd64.deb

#Install bat
echo -e "${BLUE}\n BAT.  ${NC}"
wget https://$token@github.com/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1_amd64.deb; dpkg -i bat_0.18.1_amd64.deb


echo -e "${BLUE}\n rlwrap.  ${NC}"
apt install rlwrap -y; 

#Install Telegram
echo -e "${BLUE}\n Telegram.  ${NC}";
wget -O /home/$DANT/Desktop/telegram.tar.xz  https://updates.tdesktop.com/tlinux/tsetup.3.5.2.tar.xz;
tar -xvf /home/$DANT/Desktop/telegram.tar.xz -C /home/$DANT/Desktop/ && rm /home/$DANT/Desktop/telegram.tar.xz;

#Instal driver Wifi
echo -e "${BLUE}\n Install WiFi Realtek 8812AU/8821AU Driver   ${NC}";
apt-get install -y linux-headers-$(uname -r) ;
git clone https://$token@github.com/aircrack-ng/rtl8812au $track/rtl8812au;
cd $track/rtl8812au;
apt install -y dkms;
make dkms_remove; sleep 2;
make dkms_install; cd $track/

echo -e "${BLUE}\n Install GIMP   ${NC}";
apt install gimp -y;

echo -e "${BLUE}\n Install Remina.  ${NC}"
apt-get install remmina -y;

echo -e "${BLUE}\n Speddtest. 陋 ${NC}"
apt install -y speedtest-cli;

echo -e "${BLUE}\n Install Tor. 﨩 ${NC}"
systemctl start tor;systemctl enable tor;

echo -e "${BLUE}\n OnionShare. 練${NC}"
apt install -y snapd;
systemctl enable --now snapd apparmor;
snap install core;
snap install onionshare;snap remove onionshare;snap install onionshare

echo -e "${BLUE}\n Install i2p.  ${NC}"
docker pull geti2p/i2p;

echo -e "${BLUE}\n Install Virtualenv.  ${NC}"
pip3 install virtualenv;

echo -e "${BLUE}\n Install Go. ﳑ ${NC}"
apt install -y golang;

echo -e "${BLUE}\n Install VLC.  ${NC}"
apt install -y vlc;

echo -e "${BLUE}\n Install NSearch.  ${NC}"
git clone https://$token@github.com/jtibaquira/nsearch.git /opt/NSearch;

echo -e "${BLUE}\n Install VulnScan.  ${NC}"
git clone https://$token@github.com/scipag/vulscan.git /usr/share/nmap/scripts/vulscan/;

cp $track/matrix.sh /bin/matrix.sh; chmod +x /bin/matrix.sh;


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

#Install Debugger

echo -e "${YELLOW}\n Install edbPeda-debugger.  ${NC}"
git clone https://$token@github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
apt install -y edb-debugger && apt install -y gdb-peda && apt install -y gdb

#Install VMWare-Tools
echo -e "${YELLOW}\n Install VMWare-Tools.  ${NC}"
apt install -y --reinstall open-vm-tools-desktop

#Install Sonarqube
echo -e "${YELLOW}\n Install Sonarqube.  ${NC}"
docker pull sonarqube
docker volume create sonarqube-conf 
docker volume create sonarqube-data
docker volume create sonarqube-logs
docker volume create sonarqube-extensions

echo -e "${YELLOW}\n Install ADB-Tools.  ${NC}"
apt install -y adb

}


###############################################################################################################################
###################################################### Reconnaissance ##################################################################
###############################################################################################################################

reconnaissance(){

echo -e "${YELLOW}\nDownload Tools Reconnaissance ${NC}"
cd  /opt/Tools/$reconnaissance/

git clone https://$token@github.com/stark0de/nginxpwner.git
git clone https://$token@github.com/smackerdodi/403bypasser.git
git clone https://$token@github.com/sense-of-security/ADRecon.git
git clone https://$token@github.com/mattweidner/bucket_finder.git
git clone https://$token@github.com/lobuhi/byp4xx.git
git clone https://$token@github.com/christophetd/cloudflair.git
git clone https://$token@github.com/greycatz/CloudUnflare.git
git clone https://$token@github.com/D4Vinci/Cr3dOv3r.git
git clone https://$token@github.com/ThoughtfulDev/EagleEye
git clone https://$token@github.com/mxrch/GHunt.git
git clone https://$token@github.com/liamg/gitjacker.git
git clone https://$token@github.com/FeeiCN/gsil.git
git clone --depth 1 https://$token@github.com/stamparm/identYwaf.git
git clone https://$token@github.com/m4ll0k/Infoga.git infoga
git clone https://$token@github.com/adnane-X-tebbaa/Katana.git
git clone https://$token@github.com/adnane-X-tebbaa/GRecon.git
git clone https://$token@github.com/guelfoweb/knock.git
git clone https://$token@github.com/lolwaleet/ReverseIP.git
git clone https://$token@github.com/s4vitar/rpcenum.git
git clone https://$token@github.com/ollypwn/SMBGhost.git
git clone https://$token@github.com/cytopia/smtp-user-enum.git
git clone https://$token@github.com/adityaks/sparty.git
git clone https://$token@github.com/aboul3la/Sublist3r.git
git clone --recursive https://$token@github.com/screetsec/Sudomy.git
git clone --depth 1 https://$token@github.com/drwetter/testssl.sh.git
git clone https://$token@github.com/DedSecInside/TorBot.git
git clone https://$token@github.com/m3n0sd0n4ld/uDork
git clone https://$token@github.com/wafpassproject/wafpass.git
git clone https://$token@github.com/Ekultek/WhatBreach.git
git clone https://$token@github.com/Ekultek/WhatWaf.git
git clone https://$token@github.com/iojw/socialscan.git
git clone https://$token@github.com/Dheerajmadhukar/karma_v2.git
git clone https://$token@github.com/BishopFox/GitGot.git
git clone https://$token@github.com/mubix/IOXIDResolver.git
git clone https://$token@github.com/m0rtem/CloudFail.git
git clone https://$token@github.com/ropnop/kerbrute.git
git clone https://$token@github.com/sundowndev/phoneinfoga.git
git clone https://$token@github.com/Greenwolf/social_mapper.git
git clone https://$token@github.com/laramies/metagoofil.git
git clone https://$token@github.com/metac0rtex/GitHarvester.git
git clone https://$token@github.com/cheetz/sslScrape.git
git clone https://$token@github.com/TheRook/subbrute.git
git clone https://$token@github.com/bbb31/slurp.git
git clone https://$token@github.com/nahamsec/HostileSubBruteforcer.git
git clone https://$token@github.com/JordyZomer/autoSubTakeover.git
git clone https://$token@github.com/s0md3v/Photon.git
git clone https://$token@github.com/teknogeek/virtual-host-discovery-py.git
git clone https://$token@github.com/khalilbijjou/WAFNinja.git
git clone https://$token@github.com/absolomb/WindowsEnum.git
git clone https://$token@github.com/jordanpotti/AWSBucketDump.git
git clone https://$token@github.com/0xsha/CloudBrute.git
git clone https://$token@github.com/trufflesecurity/trufflehog.git
git clone https://$token@github.com/michenriksen/gitrob.git
git clone https://$token@github.com/sa7mon/S3Scanner.git
git clone https://$token@github.com/SharonBrizinov/s3viewer.git
git clone https://$token@github.com/IvanGlinkin/Fast-Google-Dorks-Scan.git
git clone https://$token@github.com/NetSPI/MicroBurst.git
git clone https://$token@github.com/R44wk/CloudPeler.git
}


###############################################################################################################################
################################################## Weaponization #################################################################
###############################################################################################################################

weaponization(){
cd  /opt/Tools/$weaponization/
echo -e "${YELLOW}\n Download Weaponization.${NC}"

git clone https://$token@github.com/outflanknl/EvilClippy.git
git clone https://$token@ggithub.com/tokyoneon/chimera
git clone https://$token@github.com/abdulkadir-gungor/JPGtoMalware.git
git clone https://$token@github.com/cheetz/Easy-P.git
git clone https://$token@github.com/byt3bl33d3r/DeathStar.git
git clone https://$token@github.com/Mr-Un1k0d3r/MaliciousMacroGenerator.git
git clone https://$token@github.com/enigma0x3/Generate-Macro.git
git clone https://$token@github.com/Greenwolf/ntlm_theft.git
git clone https://$token@github.com/mdsecactivebreach/SharpShooter.git
git clone https://$token@github.com/infosecn1nja/MaliciousMacroMSBuild.git
git clone https://$token@github.com/TheWover/donut.git
git clone https://$token@github.com/sevagas/macro_pack.git
git clone https://$token@github.com/curi0usJack/luckystrike.git
git clone https://$token@ghttps://github.com/Pepitoh/VBad.git

echo -e "${YELLOW}\nInstall ZSC${NC}"
cd  /opt/Tools/$FRAMEWORK;git clone https://$token@github.com/OWASP/ZSC.git

}

###############################################################################################################################
##################################################### Delivery ###############################################################
###############################################################################################################################

delivery (){
cd  /opt/Tools/$delivery/

echo -e "${YELLOW}\nInstall AdvPhishing${NC}"
git clone https://$token@github.com/Ignitetch/AdvPhishing.git

echo -e "${YELLOW}\nInstall Modlishka${NC}"
git clone https://$token@github.com/drk1wi/Modlishka.git

echo -e "${YELLOW}\nInstall CactusTorch${NC}"
git clone https://$token@github.com/xillwillx/CACTUSTORCH_DDEAUTO.git
git clone https://$token@github.com/mdsecactivebreach/CACTUSTORCH.git

echo -e "${YELLOW}\nInstall Cuteit${NC}"
git clone https://$token@github.com/D4Vinci/Cuteit.git

echo -e "${YELLOW}\nInstall IP-Obfuscator${NC}"
git clone https://$token@github.com/findneo/IP-Obfuscator.git

echo -e "${YELLOW}\nInstall ZPhisher${NC}"
git clone https://$token@github.com/htr-tech/zphisher.git

echo -e "${YELLOW}\nInstall Hidden-Eye${NC}"
git clone https://$token@github.com/r3x07/HiddenEye.git

echo -e "${YELLOW}\nInstall PyPhisher${NC}"
git clone https://$token@github.com/KasRoudra/PyPhisher

echo -e "${YELLOW}\nInstall Evilgnix2${NC}"
git clone https://$token@github.com/kgretzky/evilginx2.git

echo -e "${YELLOW}\nInstall CredSniper${NC}"
git clone https://$token@github.com/ustayready/CredSniper.git

git clone https://$token@github.com/Arno0x/EmbedInHTML.git
git clone https://$token@github.com/fin3ss3g0d/evilgophish.git
git clone https://$token@github.com/mdsecactivebreach/o365-attack-toolkit.git
git clone https://$token@github.com/mandiant/PwnAuth.git
git clone https://$token@github.com/R44wk/mip22.git
}



###############################################################################################################################
##################################################### Explotation_Scalation_C&C ##################################################
###############################################################################################################################

explotation(){

echo -e "${YELLOW}\nDownload Tools Explotation_Scalation_C&C. ${NC}"
cd  /opt/Tools/$explotation/

git clone https://$token@github.com/salvul/AutoSploit.git
git clone https://$token@github.com/Telefonica/ibombshell.git
git clone https://$token@github.com/threat9/routersploit.git
git clone https://$token@github.com/Pepelux/sippts.git
git clone https://$token@github.com/aress31/xmlrpc-bruteforcer.git
git clone https://$token@github.com/trustedsec/unicorn.git
git clone https://$token@github.com/offsecginger/koadic.git
git clone https://$token@github.com/cobbr/Covenant.git
git clone https://$token@github.com/Ne0nd0g/merlin.git
git clone https://$token@github.com/iagox86/dnscat2.git
git clone https://$token@github.com/mandiant/SharPersist.git
git clone https://$token@github.com/n1nj4sec/pupy.git
git clone https://$token@github.com/Viralmaniar/Powershell-RAT.git
git clone https://$token@github.com/mitre/caldera.git
git clone https://$token@github.com/bdamele/icmpsh.git
git clone https://$token@github.com/dafthack/MailSniper.git

echo -e "${YELLOW}\nZeroLogon${NC}"

git clone https://$token@github.com/dirkjanm/CVE-2020-1472.git ZeroLogon
cd  /opt/Tools/$explotation/ZeroLogon; 
pip install cffi==1.14.2 click==7.1.2 cryptography==3.1 dnspython==2.0.0 Flask==1.1.2 future==0.18.2 impacket==0.9.21 itsdangerous==1.1.0 Werkzeug==1.0.1
pip install Jinja2==2.11.2 ldap3==2.8 ldapdomaindump==0.9.3 MarkupSafe==1.1.1 pyasn1==0.4.8 pycparser==2.20 pycryptodomex==3.9.8 pyOpenSSL==19.1.0 six==1.15.0

}

###############################################################################################################################
################################################## Defense_Evasion #################################################################
###############################################################################################################################

evation(){

echo -e "${YELLOW}\nDownload Tools Defense Evation ${NC}"
cd  /opt/Tools/$evation/

git clone https://$token@github.com/devploit/XORpass
git clone https://$token@github.com/slaeryan/FALCONSTRIKE.git
git clone https://$token@github.com/t3l3machus/hoaxshell.git
git clone https://$token@github.com/optiv/ScareCrow.git
git clone https://$token@github.com/secretsquirrel/SigThief.git
git clone https://$token@github.com/Mr-Un1k0d3r/DKMC.git
git clone https://$token@github.com/phra/PEzor.git
git clone https://$token@github.com/weak1337/Alcatraz.git
git clone https://$token@github.com/rasta-mouse/RuralBishop.git
git clone --recursive https://github.com/klezVirus/inceptor.git

wget -O /opt/Tools/$evation/upx.tar.xz https://github.com/upx/upx/releases/download/v4.0.2/upx-4.0.2-amd64_linux.tar.xz
tar -xvf /opt/Tools/$evation/upx.tar.xz -C /opt/Tools/$evation/ && rm /opt/Tools/$evation/upx.tar.xz;

}


###############################################################################################################################
################################################## exfiltration #################################################################
###############################################################################################################################


exfiltration(){

echo -e "${YELLOW}\nDownload Tools Exfiltration ${NC}"
cd  /opt/Tools/$exfiltration/

git clone https://$token@github.com/epinna/weevely3.git
git clone https://$token@github.com/SECFORCE/Tunna.git
git clone https://$token@github.com/Arno0x/DNSExfiltrator.git
git clone https://$token@github.com/m57/dnsteal.git
git clone https://$token@github.com/IncideDigital/Mistica.git
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

cd /opt/Tools/$WIFI
git clone https://$token@github.com/vanhoefm/krackattacks-scripts.git krackattacks
git clone https://$token@github.com/Telefonica/HomePWN.git
git clone https://$token@github.com/R44wk/bluescan.git
git clone https://$token@github.com/hash3liZer/WiFiBroot.git
git clone https://$token@github.com/FluxionNetwork/fluxion.git

echo -e "${YELLOW}\nInstall BtleJuice Framework${NC}"
apt-get -y install bluetooth bluez libbluetooth-dev libudev-dev
npm install -g btlejuice

}


###############################################################################################################################
######################################################### DoS  ################################################################
###############################################################################################################################

Dos(){

echo -e "${YELLOW}\nInstall Bash-tls-reneg-attack${NC}"
cd  /opt/Tools/$DOS;git clone https://$token@github.com/XDLDCG/bash-tls-reneg-attack.git
cd /opt/Tools/$DOS/bash-tls-reneg-attack; chmod +x tls-reneg.sh

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
cd /opt/Tools/$DOS/zambie; chmod +x Installer.sh

}

###############################################################################################################################
##################################################### Incident ################################################################
###############################################################################################################################

Incident(){

echo -e "${YELLOW}\nInstall Logontracer${NC}"
cd  /opt/Tools/$INCIDENT; git clone https://$token@github.com/JPCERTCC/LogonTracer.git
cd  /opt/Tools/$INCIDENT/LogonTracer;  docker pull jpcertcc/docker-logontracer
}

###############################################################################################################################
##################################################### Framework ###############################################################
###############################################################################################################################
Framework(){

echo -e "${YELLOW}\nInstall MobSF${NC}"
cd /opt/

git clone https://$token@github.com/MobSF/Mobile-Security-Framework-MobSF.git

echo -e "${YELLOW}\nInstall Vectr${NC}"
apt update -y
mkdir -p /opt/vectr
cd /opt/vectr
wget https://github.com/SecurityRiskAdvisors/VECTR/releases/download/ce-8.7.1/sra-vectr-runtime-8.7.1-ce.zip 
unzip sra-vectr-runtime-8.7.1-ce.zip
sudo docker compose up -d

cd /opt/
wget -O arachni.tar.gz https://github.com/Arachni/arachni/releases/download/v1.6.1.3/arachni-1.6.1.3-0.6.1.1-linux-x86_64.tar.gz
tar -xvf arachni.tar.xz && rm /opt/arachni.tar.xz;

}


###############################################################################################################################
#########################################################################################################################
###############################################################################################################################

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
Kali 
system 2>>/home/$DANT/Downloads/CustomKali/errors.txt
reconnaissance 2>>/home/$DANT/Downloads/CustomKali/errors.txt
weaponization 2>>/home/$DANT/Downloads/CustomKali/errors.txt
delivery 2>>/home/$DANT/Downloads/CustomKali/errors.txt
explotation 2>>/home/$DANT/Downloads/CustomKali/errors.txt
evation 2>>/home/$DANT/Downloads/CustomKali/errors.txt
exfiltration  2>>/home/$DANT/Downloads/CustomKali/errors.txt
wifi 2>>/home/$DANT/Downloads/CustomKali/>errors.txt
Dos 2>>/home/$DANT/Downloads/CustomKali/errors.txt
Incident 2>>/home/$DANT/Downloads/CustomKali/errors.txt
Framework 2>>/home/$DANT/Downloads/CustomKali/errors.txt

echo -e "\n"
nordvpn set dns 1.1.1.1 8.8.8.8 2>>errors.txt #set DNS in VPN
echo -e "${BLUE}\nUpdating locate database.${NC}"
updatedb 2>>/home/$DANT/Downloads/CustomKali/errors.txt
sleep 2
source /root/.zshrc 2>>/home/$DANT/Downloads/CustomKali/errors.txt
sleep 5
echo -e "${red}\nDone...${NC}"
exit





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
explotation="Explotation_Scalation_C2"
evation="Defense_Evasion"
exfiltration="Exfiltration"
WIFI="WiFi_BLE"
FRAMEWORK="Framework"
token="3c8d9d9648b52aab168af651d2b43b0782715c34" 
track=$(pwd)



###############################################################################################################################
#create paths
mkdir /opt/Tools;
mkdir /opt/Tools/{$reconnaissance,$weaponization,$delivery,$explotation,$evation,$exfiltration,$WIFI,$FRAMEWORK};

clear;

#Install Hack Nerd Font
echo -e "${BLUE} \n Install fonts. ﯔ ${NC}"
wget -P /usr/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
sleep 2 
unzip /usr/share/fonts/Hack.zip  -d /usr/share/fonts/ && rm /usr/share/fonts/Hack.zip
sleep 4 
mkdir /root/.config
clear

cachyos(){

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
sleep 2
read -p "Enter your username:~# " DANT
#read -p "Enter your APIKey Github:~# " token

echo -e "${BLUE}\n Upgrade Arch-Linux.  ${NC}"
sudo pacman -Syu --noconfirm && sudo pacman -Rns $(pacman -Qdtq 2>/dev/null) --noconfirm 2>/dev/null && sudo pacman -Scc --noconfirm && sudo updatedb
}

###############################################################################################################################
###############################################################################################################################

system(){

sudo pacman -S --needed --noconfirm dkms

echo -e "${BLUE}\n Starship.  ${NC}"
#Install Startship in user
curl -sS https://starship.rs/install.sh | sh;
#Config startship con un tema
cp $track/startship.toml ~/.config/starship.toml;

sleep 2
#Install tmux and Oh myTmux
sudo pacman -S --noconfirm tmux;
cd /home/$DANT/ && git clone https://$token@github.com/gpakosz/.tmux.git;
ln -s -f .tmux/.tmux.conf;
cp .tmux/.tmux.conf.local .;
cp $track/tmux.conf.local /home/$DANT/.tmux.conf.local;


# Install POLYBAR
echo -e "${BLUE}\n Install Polybar.  ${NC}";
sudo pacman -S --noconfirm polybar;
sleep 1
#cp  -r $track/polybar /home/$DANT/.config/  2>>$track/errors.txt;
#chmod 777 /home/$DANT/.config/polybar/launch.sh  2>>$track/errors.txt && 
#cp /home/$DANT/.config/polybar/launch.sh /usr/bin/polybar.sh && ./polybar.sh 2>/dev/null &
#sleep 2
#chmod +x /home/$DANT/.config/polybar/bin/*.sh;
#sleep 4


#Install Expose
pacman -S --noconfirm php;
curl https://github.com/beyondcode/expose/raw/master/builds/expose -L --output /opt/expose;
chmod +x /opt/expose;

#Install Python
sudo pacman -Sy --noconfirm python python-pip;

echo -e "${BLUE}\n Install Headers Kernel.  ${NC}";
kernel=$(uname -r)
if [[ "$kernel" == *cachyos* ]]; then
    sudo pacman -S --needed --noconfirm linux-cachyos-headers
elif [[ "$kernel" == *lts* ]]; then
    sudo pacman -S --needed --noconfirm linux-lts-headers
elif [[ "$kernel" == *zen* ]]; then
    sudo pacman -S --needed --noconfirm linux-zen-headers
else
    sudo pacman -S --needed --noconfirm linux-headers
fi

#========================================================================================================================================================
#                                                                      Misc.
#========================================================================================================================================================

#Install NordVPN
#echo -e "${BLUE}\n Install NordVPN 嬨  ${NC}"
#sh <(wget -qO - https://downloads.nordcdn.com/apps/linux/install.sh) -p nordvpn-gui;

echo -e "${BLUE}\n Trensmission. 褐 ${NC}"
sudo pacman -Sy --noconfirm transmission-gtk;

echo -e "${BLUE}\n Name-that-hash.  ${NC}"
pip3 install  --break-system-packages name-that-hash &&  export PATH="$PATH:/home/r4wk/.local/bin";

echo -e "${BLUE}\n Install Docker.  ${NC}"
sudo pacman -S --noconfirm docker docker-compose;
sudo systemctl enable --now docker;

#Install Penelope Shell Interactive

git clone https://github.com/brightio/penelope.git /usr/bin/penelope;

#Install lsd
echo -e "${BLUE}\n LSD.  ${NC}"
pacman -S --noconfirm lsd

#Install bat
echo -e "${BLUE}\n BAT.  ${NC}"
sudo pacman -S --noconfirm bat

echo -e "${BLUE}\n rlwrap.  ${NC}"
sudo pacman -S --noconfirm rlwrap 

echo -e "${BLUE}\nInstall GIMP. ${NC}"
sudo pacman -S --noconfirm gimp

echo -e "${BLUE}\nInstall Remmina. ${NC}"
sudo pacman -S --noconfirm remmina freerdp vnc

echo -e "${BLUE}\n Speedtest. 陋 ${NC}"
sudo pacman -S --noconfirm speedtest-cli

echo -e "${BLUE}\n Install Tor. 﨩 ${NC}"
sudo pacman -S --noconfirm tor
sudo systemctl enable --now tor

echo -e "${BLUE}\nPull I2P Docker image. ${NC}"
sudo docker pull geti2p/i2p

echo -e "${BLUE}\nInstall virtualenv. ${NC}"
pip install --break-system-packages virtualenv

echo -e "${BLUE}\nInstall Go. ${NC}"
sudo pacman -S --noconfirm go

echo -e "${BLUE}\n Install NSearch.  ${NC}"
git clone https://$token@github.com/jtibaquira/nsearch.git /opt/NSearch;

echo -e "${BLUE}\n SiCat - The useful exploit finder  ${NC}"
git clone https://github.com/justakazh/sicat.git /opt/Sicat

echo -e "${BLUE}\n Install VulnScan.  ${NC}"
git clone https://$token@github.com/scipag/vulscan.git /usr/share/nmap/scripts/vulscan/

cp $track/matrix.sh /bin/matrix.sh; chmod +x /bin/matrix.sh

#Install Proxmark3
echo -e "${YELLOW}\nInstall Proxmark3. ${NC}"
    sudo pacman -S --noconfirm arm-none-eabi-gcc arm-none-eabi-newlib libusb readline pcsclite
    cd /opt && git clone https://$token@github.com/Proxmark/proxmark3.git
    cd proxmark3 && make clean && make all

#Install Debugger
echo -e "${YELLOW}\nInstall PEDA + EDB. ${NC}"
    git clone https://github.com/longld/peda.git ~/peda
    echo "source ~/peda/peda.py" >> ~/.gdbinit
    sudo pacman -S --noconfirm edb-debugger gdb


#Install ADB-Tools Android
echo -e "${YELLOW}\n Install ADB-Tools.  ${NC}"
sudo pacman -S --noconfirm android-tools
}

###############################################################################################################################
###################################################### Reconnaissance ##################################################################
###############################################################################################################################

reconnaissance(){

echo -e "${YELLOW}\nDownload Tools Reconnaissance${NC}"
    cd /opt/Tools/$reconnaissance/ || exit 1

    # Lista de repositorios 
    repos=(
        "https://$token@github.com/stark0de/nginxpwner.git"
        "https://$token@github.com/smackerdodi/403bypasser.git"
        "https://$token@github.com/sense-of-security/ADRecon.git"
        "https://$token@github.com/mattweidner/bucket_finder.git"
        "https://$token@github.com/lobuhi/byp4xx.git"
        "https://$token@github.com/christophetd/cloudflair.git"
        "https://$token@github.com/gwen001/cloudflare-origin-ip"
        "https://$token@github.com/greycatz/CloudUnflare.git"
        "https://$token@github.com/D4Vinci/Cr3dOv3r.git"
        "https://$token@github.com/ThoughtfulDev/EagleEye"
        "https://$token@github.com/mxrch/GHunt.git"
        "https://$token@github.com/liamg/gitjacker.git"
        "https://$token@github.com/FeeiCN/gsil.git"
        "https://$token@github.com/stamparm/identYwaf.git --depth 1"
        "https://$token@github.com/m4ll0k/Infoga.git infoga"
        "https://$token@github.com/adnane-X-tebbaa/Katana.git"
        "https://$token@github.com/adnane-X-tebbaa/GRecon.git"
        "https://$token@github.com/guelfoweb/knock.git"
        "https://$token@github.com/lolwaleet/ReverseIP.git"
        "https://$token@github.com/s4vitar/rpcenum.git"
        "https://$token@github.com/ollypwn/SMBGhost.git"
        "https://$token@github.com/cytopia/smtp-user-enum.git"
        "https://$token@github.com/adityaks/sparty.git"
        "https://$token@github.com/aboul3la/Sublist3r.git"
        "https://$token@github.com/screetsec/Sudomy.git --recursive"
        "https://$token@github.com/drwetter/testssl.sh.git --depth 1"
        "https://$token@github.com/DedSecInside/TorBot.git"
        "https://$token@github.com/m3n0sd0n4ld/uDork"
        "https://$token@github.com/wafpassproject/wafpass.git"
        "https://$token@github.com/Ekultek/WhatBreach.git"
        "https://$token@github.com/Ekultek/WhatWaf.git"
        "https://$token@github.com/iojw/socialscan.git"
        "https://$token@github.com/Dheerajmadhukar/karma_v2.git"
        "https://$token@github.com/BishopFox/GitGot.git"
        "https://$token@github.com/mubix/IOXIDResolver.git"
        "https://$token@github.com/m0rtem/CloudFail.git"
        "https://$token@github.com/ropnop/kerbrute.git"
        "https://$token@github.com/sundowndev/phoneinfoga.git"
        "https://$token@github.com/Greenwolf/social_mapper.git"
        "https://$token@github.com/laramies/metagoofil.git"
        "https://$token@github.com/metac0rtex/GitHarvester.git"
        "https://$token@github.com/cheetz/sslScrape.git"
        "https://$token@github.com/TheRook/subbrute.git"
        "https://$token@github.com/bbb31/slurp.git"
        "https://$token@github.com/nahamsec/HostileSubBruteforcer.git"
        "https://$token@github.com/JordyZomer/autoSubTakeover.git"
        "https://$token@github.com/s0md3v/Photon.git"
        "https://$token@github.com/teknogeek/virtual-host-discovery-py.git"
        "https://$token@github.com/khalilbijjou/WAFNinja.git"
        "https://$token@github.com/absolomb/WindowsEnum.git"
        "https://$token@github.com/jordanpotti/AWSBucketDump.git"
        "https://$token@github.com/0xsha/CloudBrute.git"
        "https://$token@github.com/trufflesecurity/trufflehog.git"
        "https://$token@github.com/michenriksen/gitrob.git"
        "https://$token@github.com/sa7mon/S3Scanner.git"
        "https://$token@github.com/SharonBrizinov/s3viewer.git"
        "https://$token@github.com/IvanGlinkin/Fast-Google-Dorks-Scan.git"
        "https://$token@github.com/NetSPI/MicroBurst.git"
        "https://$token@github.com/R44wk/CloudPeler.git"
        "https://$token@github.com/BishopFox/spoofcheck.git"
        "https://$token@github.com/MattKeeley/Spoofy"
        "https://$token@github.com/vysecurity/LinkedInt.git"
        "https://$token@github.com/megadose/holehe.git"
        "https://$token@github.com/MrpasswordTz/WAFHUNTER.git"
    )

    total=${#repos[@]}
    count=0

    for repo in "${repos[@]}"; do
        ((count++))
        percent=$((count * 100 / total))

        # Extraer URL base para mostrar nombre legible
        name=$(echo "$repo" | cut -d' ' -f1 | sed 's/.*\///; s/\.git$//')

        # Mostrar progreso en la misma línea
        printf "\r${GREEN}[${percent}%%] Cloning: ${name}${NC}"

        # Interpretar argumentos adicionales (--depth, --recursive, etc.)
        if [[ "$repo" == *" --"* ]]; then
            url=$(echo "$repo" | cut -d' ' -f1)
            extra=$(echo "$repo" | cut -d' ' -f2-)
            git clone $extra "$url" 2>/dev/null || true
        elif [[ "$repo" == *" "* ]] && [[ "$repo" != *" --"* ]]; then
            # Caso especial: "url nombre_local"
            url=$(echo "$repo" | awk '{print $1}')
            dir=$(echo "$repo" | awk '{print $2}')
            git clone "$url" "$dir" 2>/dev/null || true
        else
            git clone "$repo" 2>/dev/null || true
        fi
    done

    echo -e "\n${GREEN}✅ Reconnaissance tools cloned successfully!${NC}"

}


###############################################################################################################################
################################################## Weaponization #################################################################
###############################################################################################################################

weaponization(){
cd  /opt/Tools/$weaponization/
echo -e "${YELLOW}\n Download Weaponization.${NC}"



repos=(
    "https://$token@github.com/outflanknl/EvilClippy.git"
    "https://$token@ggithub.com/tokyoneon/chimera"
    "https://$token@github.com/abdulkadir-gungor/JPGtoMalware.git"
    "https://$token@github.com/cheetz/Easy-P.git"
    "https://$token@github.com/byt3bl33d3r/DeathStar.git"
    "https://$token@github.com/Mr-Un1k0d3r/MaliciousMacroGenerator.git"
    "https://$token@github.com/enigma0x3/Generate-Macro.git"
    "https://$token@github.com/Greenwolf/ntlm_theft.git"
    "https://$token@github.com/mdsecactivebreach/SharpShooter.git"
    "https://$token@github.com/infosecn1nja/MaliciousMacroMSBuild.git"
    "https://$token@github.com/TheWover/donut.git"
    "https://$token@github.com/sevagas/macro_pack.git"
    "https://$token@github.com/curi0usJack/luckystrike.git"
    "https://$token@ghttps://github.com/Pepitoh/VBad.git"
    )

    total=${#repos[@]}
    count=0

    for repo in "${repos[@]}"; do
        ((count++))
        percent=$((count * 100 / total))

        # Extraer URL base para mostrar nombre legible
        name=$(echo "$repo" | cut -d' ' -f1 | sed 's/.*\///; s/\.git$//')

        # Mostrar progreso en la misma línea
        printf "\r${GREEN}[${percent}%%] Cloning: ${name}${NC}"

        # Interpretar argumentos adicionales (--depth, --recursive, etc.)
        if [[ "$repo" == *" --"* ]]; then
            url=$(echo "$repo" | cut -d' ' -f1)
            extra=$(echo "$repo" | cut -d' ' -f2-)
            git clone $extra "$url" 2>/dev/null || true
        elif [[ "$repo" == *" "* ]] && [[ "$repo" != *" --"* ]]; then
            # Caso especial: "url nombre_local"
            url=$(echo "$repo" | awk '{print $1}')
            dir=$(echo "$repo" | awk '{print $2}')
            git clone "$url" "$dir" 2>/dev/null || true
        else
            git clone "$repo" 2>/dev/null || true
        fi
    done

echo -e "${YELLOW}\nInstall ZSC${NC}"
cd  /opt/Tools/$FRAMEWORK;git clone https://$token@github.com/OWASP/ZSC.git
echo -e "\n${GREEN}✅ Weaponization tools cloned successfully!${NC}"

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
git clone https://$token@github.com/muraenateam/muraena.git

}



###############################################################################################################################
##################################################### Explotation_Scalation_C&C ##################################################
###############################################################################################################################

explotation(){

echo -e "${YELLOW}\nDownload Tools Explotation_Scalation_C&C. ${NC}"
cd  /opt/Tools/$explotation/

git clone https://$token@github.com/NullArray/AutoSploit.git
git clone https://$token@github.com/Telefonica/ibombshell.git
git clone https://$token@github.com/threat9/routersploit.git
git clone https://$token@github.com/Pepelux/sippts.git
git clone https://$token@github.com/aress31/xmlrpc-bruteforcer.git
git clone https://$token@github.com/trustedsec/unicorn.git
git clone https://$token@github.com/offsecginger/koadic.git
git clone https://$token@github.com/Ne0nd0g/merlin.git
git clone https://$token@github.com/iagox86/dnscat2.git
git clone https://$token@github.com/mandiant/SharPersist.git
git clone https://$token@github.com/Viralmaniar/Powershell-RAT.git
git clone https://$token@github.com/mitre/caldera.git
git clone https://$token@github.com/bdamele/icmpsh.git
git clone https://$token@github.com/dafthack/MailSniper.git
git clone https://$token@github.com/HavocFramework/Havoc.git
git clone https://$token@github.com/p3nt4/Nuages.git

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
git clone https://$token@github.com/xoreaxeaxeax/movfuscator
git clone https://$token@github.com/the-xentropy/xencrypt.git
git clone https://$token@github.com/CCob/SharpBlock.git
git clone https://$token@github.com/danielbohannon/Invoke-Obfuscation.git
git clone https://$token@github.com/hlldz/RefleXXion.git
git clone https://$token@github.com/optiv/Mangle.git
git clone https://$token@github.com/mindcrypt/powerglot.git
wget -O /opt/Tools/$evation/upx.tar.xz https://github.com/upx/upx/releases/download/v4.0.2/upx-4.0.2-amd64_linux.tar.xz
tar -xvf /opt/Tools/$evation/upx.tar.xz -C /opt/Tools/$evation/ && rm /opt/Tools/$evation/upx.tar.xz;
git clone https://$token@github.com/mgeeky/PackMyPayload.git
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


echo -e "${YELLOW}\nDownload WiFi Tools${NC}"
cd /opt/Tools/$WIFI
git clone https://$token@github.com/s4vitar/evilTrust.git
git clone https://$token@github.com/SilentGhostX/HT-WPS-Breaker.git
git clone https://$token@github.com/derv82/wifite2.git
git clone https://$token@github.com/aress31/wirespy.git
git clone https://$token@github.com/vanhoefm/krackattacks-scripts.git krackattacks
git clone https://$token@github.com/Telefonica/HomePWN.git
git clone https://$token@github.com/R44wk/bluescan.git
git clone https://$token@github.com/hash3liZer/WiFiBroot.git
git clone https://$token@github.com/FluxionNetwork/fluxion.git
gri clone https://$token@github.com/D3Ext/WEF.git
git clone https://$token@github.com/ElectronicCats/CatSniffer-Tools.git
echo -e "${YELLOW}\nInstall BtleJuice Framework${NC}"
apt-get -y install bluetooth bluez libbluetooth-dev libudev-dev
npm install -g btlejuice
}



###############################################################################################################################
##################################################### Framework ###############################################################
###############################################################################################################################
Framework(){

echo -e "${YELLOW}\nInstall MobSF${NC}"
cd /opt/

git clone https://$token@github.com/MobSF/Mobile-Security-Framework-MobSF.git

cd /opt/
wget -O arachni.tar.gz https://github.com/Arachni/arachni/releases/download/v1.6.1.3/arachni-1.6.1.3-0.6.1.1-linux-x86_64.tar.gz
tar -xvf arachni.tar.xz && rm /opt/arachni.tar.xz;

}


###############################################################################################################################
#########################################################################################################################
###############################################################################################################################

Banner() {

echo -e "\n\n${BLUE}  █████████                      █████           █████████                      █████                            ${NC}"
sleep 0.10
echo -e "${BLUE}  ███▒▒▒▒▒███                    ▒▒███           ███▒▒▒▒▒███                    ▒▒███                             ${NC}"
 sleep 0.10
echo -e "${BLUE}  ▒███    ▒███  ████████   ██████  ▒███████      ███     ▒▒▒  █████ ████  █████  ███████    ██████  █████████████  ${NC}"
 sleep 0.10
echo -e "${BLUE}  ▒███████████ ▒▒███▒▒███ ███▒▒███ ▒███▒▒███    ▒███         ▒▒███ ▒███  ███▒▒  ▒▒▒███▒    ███▒▒███▒▒███▒▒███▒▒███ ${NC}"
 sleep 0.10
echo -e "${BLUE}  ▒███▒▒▒▒▒███  ▒███ ▒▒▒ ▒███ ▒▒▒  ▒███ ▒███    ▒███          ▒███ ▒███ ▒▒█████   ▒███    ▒███ ▒███ ▒███ ▒███ ▒███ ${NC}"
 sleep 0.10
echo -e "${BLUE}  ▒███    ▒███  ▒███     ▒███  ███ ▒███ ▒███    ▒▒███     ███ ▒███ ▒███  ▒▒▒▒███  ▒███ ███▒███ ▒███ ▒███ ▒███ ▒███ ${NC}"
 sleep 0.10
echo -e "${BLUE}  █████   █████ █████    ▒▒██████  ████ █████    ▒▒█████████  ▒▒████████ ██████   ▒▒█████ ▒▒██████  █████▒███ █████${NC}"
sleep 0.10
echo -e "${BLUE}  ▒▒▒▒▒   ▒▒▒▒▒ ▒▒▒▒▒      ▒▒▒▒▒▒  ▒▒▒▒ ▒▒▒▒▒      ▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒ ▒▒▒▒▒▒     ▒▒▒▒▒   ▒▒▒▒▒▒  ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒ ${NC}"
echo -e "${YELLOW}   
                                                                                                            By R4wk ${white} ${NC}"                                                                                                                   
                                                                                                                  
                                                                                                                

}





Banner 
cachyos 2>>$track/errors.txt 
system 2>>$track/errors.txt
reconnaissance 2>>$track/errors.txt
weaponization 2>>$track/errors.txt
delivery 2>>$track/errors.txt
explotation 2>>$track/errors.txt
evation 2>>$track/errors.txt
exfiltration  2>>$track/errors.txt
wifi 2>>$track/errors.txt
Framework 2>>$track/errors.txt
echo -e "\n"
echo -e "${BLUE}\nUpdating locate database.${NC}"
sudo updatedb 2>>$track/errors.txt
sleep 2
source /home/$DANT/.zshrc 2>>$track/errors.txt
sleep 5
echo -e "${red}\nDone...${NC}"
exit





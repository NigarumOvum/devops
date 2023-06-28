RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"

ENDCOLOR="\e[0m"

echo -e "${RED}Optimizing your system 0/100%${ENDCOLOR}"
sudo apt install preload
sudo apt update
sudo apt upgrade

echo -e "${RED}Optimizing your system 10%/100%${ENDCOLOR}"
# * Show Hidden Startup Apps:
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

echo -e "${RED}Optimizing your system 20%/100%${ENDCOLOR}"
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get install apt-fast

echo -e "${RED}Optimizing your system 30%/100%${ENDCOLOR}"
sudo install flatpak
sudo add-apt-repository ppa:flatpak/stable
sudo apt update
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo -e "${YELLOW}Optimizing your system 40%/100%${ENDCOLOR}"
sudo apt update
sudo apt install tlp tlp-rdw
sudo tlp start

echo -e "${YELLOW}Optimizing your system 50%/100%${ENDCOLOR}"
sudo apt install indicator-cpufreq

echo -e "${YELLOW}Optimizing your system 60%/100%${ENDCOLOR}"
sudo add-apt-repository ppa:oguzhaninan/stacer
sudo apt-get update
sudo apt-get install stacer

echo -e "${YELLOW}Optimizing your system  70%/100%${ENDCOLOR}"
sudo apt purge snapd -y

echo -e "${YELLOW}Optimizing your system 80%/100%${ENDCOLOR}"
sudo apt autoremove

echo -e "${GREEN}Optimizing your system 90%/100%${ENDCOLOR}"
sudo dpkg --configure -a
sudo apt install -f

echo -e "${GREEN}Optimizing your system  100%/100% ${ENDCOLOR}"
echo 'Look the script for next manual steps'

# * Change Swappiness Value
# cat /proc/sys/vm/swappiness
# (default value in Ubuntu for swappiness is 60)
# sudo gedit /etc/sysctl.conf
# vm.swappiness=10

# sudo gedit /etc/default/grub &
# GRUB_TIMEOUT=10 to GRUB_TIMEOUT=2.
# sudo update-grub

# sudo gedit /etc/apt/apt.conf.d/00aptitude
# Acquire::Languages "none";

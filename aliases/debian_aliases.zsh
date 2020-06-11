# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias poweroff='sudo poweroff'
    alias install='sudo apt-get -y install'
    alias update='sudo apt update && sudo apt upgrade'
    alias install='apt install'
fi

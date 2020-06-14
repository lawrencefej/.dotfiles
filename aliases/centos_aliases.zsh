# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias poweroff='sudo poweroff'
    alias update='sudo dnf update'
    alias install='sudo dnf install'
    alias nmtui='sudo nmtui'
fi

# Firewalld
alias fwall='sudo firewall-cmd --list-all'
alias fwservices='sudo firewall-cmd --list-services'
alias fwports='sudo firewall-cmd --list-ports'

# Functions
function to open Firewalld port
openport () {
    sudo firewall-cmd --permanent --add-port="$1"/"$2"
    sudo firewall-cmd --reload
    return
}
#export -f openport


# function to close Firewalld port
closeport () {
    sudo firewall-cmd --permanent --remove-port="$1"/"$2"
    sudo firewall-cmd --reload
    return
}
#export -f closeport

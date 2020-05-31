# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions


alias cls='clear'
alias df='df -h'
alias pings='ping -c 5'
alias ip='ip -c'
alias nanos='sudo nano'

# handy short cuts #
alias h='history'
alias j='jobs -l'
alias ports='netstat -tulanp'

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .4='cd ../../../../' 
alias .5='cd ../../../../..'

# Do not wait interval 1 second, go fast #
alias pingfast='ping -c 100 -s.2'

alias ls='ls -lha --color=auto --group-directories-first'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##


# Functions

# function to start service

start () {
    sudo systemctl start $1
    return
}

export -f start

# function to restart service

restart () {
    sudo systemctl restart $1
    return
}

export -f restart

# function to enable service

enable () {
    sudo systemctl enable $1
    return
}

export -f enable

# function to check service status

appstatus () {
    sudo systemctl status $1
    return
}

export -f appstatus

# function to stop service

stop () {
    sudo systemctl stop $1
    return
}

export -f stop

# function to disable service
disable () {
    sudo systemctl disable $1
    return
}

export -f disable


# Centos
alias update='dnf update'
alias updatey='dnf -y update'
alias install='dnf -y install'
alias suinstall='sudo dnf -y install'
alias nmtui='sudo nmtui'


# Firewalld
alias fwall='sudo firewall-cmd --list-all'
alias fwservices='sudo firewall-cmd --list-services'
alias fwports='sudo firewall-cmd --list-ports'

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias poweroff='sudo poweroff'
    alias update='sudo dnf update'
    alias install='sudo dnf install'
fi



# Functions

# function to open Firewalld port

openport () {
    sudo firewall-cmd --permanent --add-port="$1"/"$2"
    sudo firewall-cmd --reload
    return
}

export -f openport


# function to close Firewalld port

closeport () {
    sudo firewall-cmd --permanent --remove-port="$1"/"$2"
    sudo firewall-cmd --reload
    return
}

export -f closeport

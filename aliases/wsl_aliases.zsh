#export DISPLAY=172.30.236.199:0.0
export DISPLAY=192.168.10.150:0.0
export GDK_SCALE=2
export LIBGL_ALWAYS_INDIRECT=1

# function to start service
start () {
    sudo service $1 start
    return
}

export -f start

# function to restart service
restart () {
    sudo service $1 restart
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
    sudo service $1 status
    return
}

export -f appstatus

# function to stop service
stop () {
    sudo service $1 stop
    return
}

export -f stop

# function to disable service
disable () {
    sudo systemctl disable $1
    return
}

export -f disable

# function to list service
servicelist () {
    sudo service --status-all
    return
}

export -f servicelist
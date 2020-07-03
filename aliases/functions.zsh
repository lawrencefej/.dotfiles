# function to start service
start () {
    sudo systemctl start $1
    return
}

# function to restart service
restart () {
    sudo systemctl restart $1
    return
}

# function to enable service
enable () {
    sudo systemctl enable $1
    return
}

# function to check service status
appstatus () {
    sudo systemctl status $1
    return
}

# function to stop service
stop () {
    sudo systemctl stop $1
    return
}

# function to disable service
disable () {
    sudo systemctl disable $1
    return
}

# Create and cd into dir
mkcd() {
    mkdir -p $1 && cd $1
}
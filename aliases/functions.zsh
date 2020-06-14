# function to start service
start () {
    sudo systemctl start $1
    return
}

#export -f start

# function to restart service
restart () {
    sudo systemctl restart $1
    return
}

#export -f restart

# function to enable service
enable () {
    sudo systemctl enable $1
    return
}

#export -f enable

# function to check service status
appstatus () {
    sudo systemctl status $1
    return
}

#export -f appstatus

# function to stop service
stop () {
    sudo systemctl stop $1
    return
}

#export -f stop

# function to disable service
disable () {
    sudo systemctl disable $1
    return
}

#export -f disable
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

# Run ansible-playbook with Infisical-provided environment variables.
iap() {
    local infisical_paths="${ANSIBLE_INFISICAL_PATHS:-${ANSIBLE_INFISICAL_PATH:-/ansible}}"
    local project_config_dir="${ANSIBLE_INFISICAL_PROJECT_CONFIG_DIR:-ansible/playbooks/dev}"
    local ansible_command="ansible-playbook"
    local infisical_args=()
    local infisical_path

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --inventory-command|--ansible-inventory)
                ansible_command="ansible-inventory"
                shift
                ;;
            --command)
                ansible_command="$2"
                shift 2
                ;;
            --command=*)
                ansible_command="${1#--command=}"
                shift
                ;;
            --path)
                infisical_paths="$2"
                shift 2
                ;;
            --path=*)
                infisical_paths="${1#--path=}"
                shift
                ;;
            --project-config-dir)
                project_config_dir="$2"
                shift 2
                ;;
            --project-config-dir=*)
                project_config_dir="${1#--project-config-dir=}"
                shift
                ;;
            --)
                shift
                break
                ;;
            *)
                break
                ;;
        esac
    done

    if [[ "$1" == "ansible-playbook" || "$1" == "ansible-inventory" ]]; then
        ansible_command="$1"
        shift
    fi

    for infisical_path in ${(s.:.)infisical_paths}; do
        infisical_args+=(--path="$infisical_path")
    done

    infisical run "${infisical_args[@]}" --project-config-dir="$project_config_dir" -- "$ansible_command" "$@"
}

iai() {
    iap --inventory-command "$@"
}

_wp_infisical() {
    local environment="$1"
    shift

    infisical run \
        --domain="${WOODPECKER_INFISICAL_DOMAIN:-https://infisical.home.lawrencefej.com}" \
        --projectId="${WOODPECKER_INFISICAL_PROJECT_ID:-35b3bbf0-1e2d-4d09-b163-b463eeab488b}" \
        --env="$environment" \
        --path="${WOODPECKER_INFISICAL_PATH:-/woodpecker}" \
        -- woodpecker-cli "$@"
}

wp-prod() {
    _wp_infisical prod "$@"
}

wp-dev() {
    _wp_infisical dev "$@"
}

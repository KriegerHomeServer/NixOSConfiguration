#!/bin/bash

MSG_USAGE="NAME
    install-cluster-node.sh - Install a k3s cluster node

SYNOPSIS
    install-cluster-node.sh [--address ADDRESS] [--platform PLATFORM] [OPTIONS]

DESCRIPTION
    Install a k3s cluster node on the specified machine.

    Required:
        --address ADDRESS
            The address of the remote machine to install on. REQUIRED.
        --platform PLATFORM
            The platform to install on. Either \"hyper-v-guest\" or \"raspberry-pi-5\"

    Options:
        --user USER
            The user to login as on the remote machine. Defaults to \"installer\".
        --password PASSWORD
            The password to use when logging in to the remote machine. If not provided, the user will be prompted.
        --role ROLE
            The role of the machine in the k3s cluster. Either \"server\" or \"agent\". Defaults to \"server\".
        --retrieve-hardware-config
            Retrieving hardware configuration from the remote machine. Useful for first
        --help
            Display this help message.
";

ARG_ADDRESS="";
ARG_PLATFORM="";
ARG_USER="installer";
ARG_PASSWORD="";
ARG_ROLE="server";
ARG_RETRIEVE_HARDWARE_CONFIG=false;
ARG_HELP=false;


function print_usage() {
    echo "${MSG_USAGE}";
    exit 0;
}

function check_dependencies() {

    local FAILURE=0;

    hash "nix" 2> "/dev/null" || { echo "ERROR: nix is required to run this script."; FAILURE=1; }

    hash "ssh" 2> "/dev/null" || { echo "ERROR: ssh is required to run this script."; FAILURE=1; }

    hash "sshpass" 2> "/dev/null" || { echo "ERROR: sshpass is required to run this script."; FAILURE=1; }

    if [[ ${FAILURE} -eq 1 ]]; then
        exit 1;
    fi

}

function parse_args() {

    while [[ ${#} -gt 0 ]]; do

        case ${1} in

            --address)
                ARG_ADDRESS=${2};
                shift 2;
                ;;

            --platform)
                ARG_PLATFORM=${2};
                shift 2;
                ;;

            --user)
                ARG_USER=${2};
                shift 2;
                ;;

            --password)
                ARG_PASSWORD=${2};
                shift 2;
                ;;

            --role)
                ARG_ROLE=${2};
                shift 2;
                ;;

            --retrieve-hardware-config)
                ARG_RETRIEVE_HARDWARE_CONFIG=true;
                shift;
                ;;

            --help)
                ARG_HELP=true;
                shift;
                ;;
            
        esac

    done

}

function validate_args() {
    
        if [[ -z ${ARG_ADDRESS} ]]; then
            echo "ERROR: --address is required.";
            print_usage;
        fi
    
        if [[ -z ${ARG_PLATFORM} ]]; then
            echo "ERROR: --platform is required.";
            print_usage;
        fi
    
        if [[ ${ARG_PLATFORM} != "hyper-v-guest" ]] && [[ ${ARG_PLATFORM} != "raspberry-pi-5" ]]; then
            echo "ERROR: --platform must be either \"hyper-v-guest\" or \"raspberry-pi-5\".";
            print_usage;
        fi
    
        if [[ ${ARG_ROLE} != "server" ]] && [[ ${ARG_ROLE} != "agent" ]]; then
            echo "ERROR: --role must be either \"server\" or \"agent\".";
            print_usage;
        fi
        
}

function retrieve_hardware_config() {

    local EXTRA_ARGS="";

    if [[ ${ARG_RETRIEVE_HARDWARE_CONFIG} == false ]]; then
        return;
    fi

    echo "Retrieving hardware configuration from ${ARG_ADDRESS}...";

    set +x;

    if [[ ! -z ${ARG_PASSWORD} ]]; then

        export SSHPASS=${ARG_PASSWORD};

        sshpass "-e" "ssh" "${ARG_USER}@${ARG_ADDRESS}" "-t" "sudo nixos-generate-config";

        sshpass "-e" "ssh" "${ARG_USER}@${ARG_ADDRESS}" "-t" "cat /etc/nixos/hardware-configuration.nix";

    else

        ssh "${ARG_USER}@${ARG_ADDRESS}" "-t" "sudo nixos-generate-config";

        ssh "${ARG_USER}@${ARG_ADDRESS}" "-t" "cat /etc/nixos/hardware-configuration.nix";

    fi

    set -x;

    read -p "Modify your hardware configuration and press any key to continue installation...";

}

function perform_installation() {

    if [[ ${ARG_HELP} == true ]]; then
        print_usage;
    fi

    echo "Performing installation on ${ARG_ADDRESS}...";

    if [[ ! -z ${ARG_PASSWORD} ]]; then

        export SSHPASS=${ARG_PASSWORD};

        nix "run" "github:nix-community/nixos-anywhere" "--" "--build-on-remote" "--env-password" "--flake" "../configurations/k3s-cluster-node/#${ARG_ROLE}-${ARG_PLATFORM}" "${ARG_USER}@${ARG_ADDRESS}";

    else

        nix "run" "github:nix-community/nixos-anywhere" "--" "--build-on-remote" "--flake" "../configurations/k3s-cluster-node/#${ARG_ROLE}-${ARG_PLATFORM}" "${ARG_USER}@${ARG_ADDRESS}";

    fi

}

check_dependencies;

parse_args ${@};

validate_args;

retrieve_hardware_config;

perform_installation;
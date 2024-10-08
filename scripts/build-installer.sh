#!/bin/bash

MSG_USAGE="NAME
    build-installer.sh - Build the simple installer image

SYNOPSIS
    build-installer.sh [OPTIONS]

DESCRIPTION
    Install a k3s cluster node on the specified machine.

    Options:
        --help
            Display this help message.
";

ARG_HELP=false;

function check_dependencies() {

    local FAILURE=0;

    hash "nix" 2> "/dev/null" || { echo "ERROR: nix is required to run this script."; FAILURE=1; }

    if [[ ${FAILURE} -eq 1 ]]; then
        exit 1;
    fi

}

function parse_args() {

    while [[ ${#} -gt 0 ]]; do

        case ${1} in

            --help)
                ARG_HELP=true;
                shift;
                ;;
            
        esac

    done

}

function print_help() {

    if [[ ${ARG_HELP} == true ]]; then

        echo "${MSG_USAGE}";
        exit 0;
    
    fi

}

function perform_build() {

    echo "Building Simple Installer ISO...";

    nix build ../configurations/simple-installer/#simple-installer;

    rm -r ../dist;

    mkdir -p ../dist;

    cp ./result/iso/nixos-*.iso ../dist/nixos-simple-installer.iso;

}

check_dependencies;

parse_args ${@};

print_help;

perform_build;
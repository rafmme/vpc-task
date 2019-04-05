#!/usr/bin/env bash

# to ensure the script terminate immediately it encounters an error
set -o pipefail

BLUE=`tput setaf 2`
GREEN=`tput setaf 4`
RESET=`tput sgr0`

source .env

# a function to display a message of what action is going on
function display_message() {
    echo "        "
    echo -e "${1} ## ${2} ## ${RESET}"
    echo "        "
}

# a function to display completion message when an action is complete
function display_success_message() {
    echo "        "
    echo -e "${GREEN} *** ${1} *** ${RESET}"
    echo "        "
}

# function to destroy infrastrures created with terraform
function destroy() {
    display_message $BLUE "DESTROYING"

    # this change directory to the terraform folder containing the terraform script
    cd terraform

    # terraform command to start the destruction
    terraform destroy -auto-approve -lock=false
    display_success_message "DONE"
}

# the script starting point
function main () {
    destroy
}


main

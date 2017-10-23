#!/bin/sh

LEAPP_HOME=$HOME/leapp
RCFILE=$HOME/\.$(basename $SHELL)rc


function find_in_path() {
    local STRING_OF_PATHS=$1
    local PATTERN=$2

    local SPLITTED_PATHS=()

    IFS=':' read -r -a SPLITTED_PATHS <<< "$STRING_OF_PATHS"
    for i in ${SPLITTED_PATHS[@]}; do
        if [[ $i == $PATTERN ]]; then
            return 0
        fi
    done

    return 1
}

function print_setup_section() {
    echo $1
    echo "================================================================================"
}

function setup_go_env() {
    print_setup_section "Setting up GO"

    if [ -z $GOPATH ]; then
        sudo dnf -y install go
        find_in_path $GOPATH $HOME/go || echo "export GOPATH=$HOME/go" >> $RCFILE
        export GOPATH=$HOME/go
    fi
}

function setup_prerequisities() {
    print_setup_section "Setting up prerequisities"

    sudo dnf -y install git tito

    for i in python2-pip python-pip; do
        sudo dnf search $i | grep $i && sudo dnf -y install $i
    done

    sudo dnf -y copr enable evilissimo/leapp
    mkdir -p $LEAPP_HOME
}

function setup_snactor_library() {
    print_setup_section "Setting up Snactor library"

    cd $LEAPP_HOME

    sudo dnf -y install ansible

    git clone https://github.com/leapp-to/snactor.git snactor

    cd snactor
    sudo dnf -y builddep python-snactor.spec
    tito build --install --verbose --rpm --test
}

function setup_snactor_library_test() {
    print_setup_section "Setting up Snactor library tests"

    cd $LEAPP_HOME/snactor
    pip install --user -r requirements-tests.txt

    sudo dnf -y install tox libffi libffi-devel openssl openssl-devel

    return
}

function setup_leapp_daemon() {
    print_setup_section "Setting up LeApp daemon"

    mkdir -p $GOPATH/src/github.com/leapp-to
    go get github.com/leapp-to/leapp-go

    cd $LEAPP_HOME
    ln -sf $GOPATH/src/github.com/leapp-to/leapp-go

    cd leapp-go
    make install-deps 
    make build
}

function setup_leapp_daemon_test() {
    print_setup_section "Setting up LeApp daemon tests"

    cd $LEAPP_HOME/leapp-go

    sudo dnf -y install golang-googlecode-tools-goimports golint
}

function setup_leapp() {
    print_setup_section "Setting up LeApp tool"

    cd $LEAPP_HOME

    sudo dnf -y install docker cockpit nmap python2-argcomplete python2-nmap python2-psutil rsync

    git clone https://github.com/leapp-to/leapp.git leapp
    cd leapp
    sudo dnf -y builddep leapp.spec
    tito build --install --verbose --rpm --test
}

function setup_leapp_test() {
    print_setup_section "Setting up LeApp tool tests"

    cd $LEAPP_HOME/leapp

    sudo dnf -y install pipsi docker vagrant vagrant-libvirt
    find_in_path $PATH $HOME/.local/bin || echo "export PATH=$PATH:$HOME/.local/bin" >> $RCFILE
    export PATH=$PATH:$HOME/.local/bin

    pipsi install pew
    pipsi install pipenv

    pipenv --three
    pipenv install --dev
}

function setup_leappctl() {
    print_setup_section "Setting up LeApp control tool"

    cd $LEAPP_HOME

    sudo dnf -y install python2-click python2-requests

    git clone https://github.com/leapp-to/leappctl.git leappctl

    cd leappctl
    sudo make install
}

function setup_leappctl_test() {
    print_setup_section "Setting up LeApp control tool tests"
    return
}

function setup_actors_repo() {
    print_setup_section "Setting up actor repository"

    cd $LEAPP_HOME

    git clone https://github.com/leapp-to/leapp-actors.git leapp-actors
}

function setup_actors_repo_test() {
    print_setup_section "Setting up actor repository tests"
    return
}



setup_prerequisities
setup_go_env

setup_snactor_library
setup_snactor_library_test
setup_leapp_daemon
setup_leapp_daemon_test
setup_leapp
setup_leapp_test

if [ "$1" != "minimal" ]; then
    setup_leappctl
    setup_leappctl_test
    setup_actors_repo
    setup_actors_repo_test
fi

echo -e "\nPlease run:\n\n\texec $SHELL\n\nor logout & login to finish the setup."

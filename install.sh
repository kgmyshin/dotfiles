#!/bin/bash

DOT_DIR="$HOME/dotfiles"

has() {
    type "$1" > /dev/null 2>&1
}

if [ ! -d ${DOT_DIR} ]; then
    if has "git"; then
        # install zinit
        ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
        mkdir -p "$(dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
        # install my dotfiles
        git clone https://github.com/kgmyshin/dotfiles.git ${DOT_DIR}
    else
        echo "git required"
        exit 1
    fi

    cd ${DOT_DIR}
    make install
    chmod +x ./etc/init/common/install.sh
    ./etc/init/common/install.sh
else
    echo "dotfiles already exists"
    exit 1
fi

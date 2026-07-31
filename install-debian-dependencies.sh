#!/bin/bash -e

apt_pkgs=( \
        build-essential \
        clang \
        curl \
        fd-find \
        fzf \
        gdu \
        git \
        golang \
        libc6-dev \
        libclang-dev \
        luarocks \
        pkg-config \
        python3-pip \
        python3-pynvim \
        python3-venv \
        ripgrep \
        silversearcher-ag \
        unzip \
        wget \
    )

npm_pkgs=( \
        neovim \
    )

binpath="$HOME/.local/bin"
mkdir -p "$binpath"

install_lazygit() {
    local version="0.61.1"
    local name="lazygit"
    local installpath="$HOME/.local/$name"
    local tarfile="${name}_${version}_linux_x86_64.tar.gz"
    local url="https://github.com/jesseduffield/$name/releases/download/v$version/$tarfile"

    if [[ ! -f ./$tarfile ]]; then
        wget "$url"
        tar -xzvf "$tarfile" "$name"
        rm "$tarfile"
    fi

    mv ./$name "$binpath/$name"
}

install_nodejs() {
    local version="v25.9.0"
    local dirname="node-$version-linux-x64"
    local installpath="$HOME/.local/$dirname"
    local tarfile="$dirname.tar.xz"
    local url="https://nodejs.org/dist/$version/$tarfile"

    if [[ ! -f ./$tarfile ]] && [[ ! -d ./$dirname ]]; then
        wget "$url"
        tar -xvf "$tarfile"
        rm "$tarfile"
    fi

    mv "$dirname" "$installpath"
    ln -srf "$installpath/bin/"* "$binpath"
}

install_cargo() {
    if command -v cargo >/dev/null; then
        return
    fi
    curl https://sh.rustup.rs -sSf | sh
    rustup component add rust-analyzer
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Running apt-get update quietly"
    sudo apt-get update

    echo "Running apt-get install quietly"
    sudo apt-get install -y "${apt_pkgs[@]}"

    if ! command -v npm > /dev/null; then
        echo "nodejs not found, installing."
        install_nodejs
    fi

    echo "Running npm install quietly"
    sudo env PATH="$PATH" npm install -g "${npm_pkgs[@]}" > /dev/null

    install_cargo
    install_lazygit
fi

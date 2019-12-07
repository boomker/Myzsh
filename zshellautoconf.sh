#!/bin/env bash
# *************************************************
#
#       Filename: zshellautoconf.sh
#         Author: Shingo
#          Email: gmboomker@gmail.com
#         Create: 2018-03-30 12:06:37
#       Description: -
#
# *************************************************


# os type judge
cd ~
mkdir ~/gitrepos
source /etc/os-release
case $ID in
    ubuntu)
        apt-get update
        apt -y install git tree tar unzip wget zsh  gcc cmake dstat htop jq multitail shellcheck python3-pip
        # apt -y install software-properties-common && add-apt-repository ppa:jonathonf/vim && apt update && apt -y install vim
        pip3 install --upgrade pip || pip install --upgrade pip
        python3 -m pip install ptipython pip-tools jedi autopep8 flake8 PrettyPrinter psutil mhsize icdiff
        # \ httpie ngxtop future frozendict
        cp .vimrc ~/
        cd && curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

        # nodejs npm
        curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
        sudo apt-get install -y nodejs
        sudo apt-get install -y build-essential
        sudo npm install -g npm

        #noevim
        NvimApp_uri=$(curl -sL https://github.com/neovim/neovim/releases/latest |awk -F'[ =]+' '/href.*\.appimage"/{print $4}')
	    echo "https://github.com"$(echo $NvimApp_uri |tr -d '"') |xargs curl -sLO
	    ./nvim.appimage --appimage-extract
        cp -r ./squashfs-root/usr/bin/nvim /usr/local/bin/nvim
	    chmod +x /usr/local/bin/nvim
        ;;
    centos|rhel)
        yum -y install yum-utils epel-release.noarch || \
            rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
        # yum -y install centos-release-scl https://centos7.iuscommunity.org/ius-release.rpm
        ping mirrors.aliyuns.com -c 3 >/dev/null && {
            mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
            curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
        }
        # sed -i -re '/\[epel\]/,/^enabled/{s/(enabled)=[0,1]$/\1=1/g}' /etc/yum.repos.d/epel.repo && yum -y update
        yum makecache && yum -y update
        yum -y install --nogpgcheck git tree tar unzip wget zsh gcc cmake  dstat ncdu htop \
            lsof strace socat jq multitail mtr noevim shellcheck bind-utils lrzsz
        sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
        sudo yum install ripgrep

        # Python3
        LatestPy="$(yum search python3|awk -F'[.,-]+' '/^python3[6,6u,7,7u]/{print $1}' |sort -u |tail -1)"
        LPyV="$(echo "${LatestPy}" |sed 's/[a-zA-Z]//g'|awk 'BEGIN{FS="";OFS="."}{NF++;print $1,$2}')"
        yum -y install --nogpgcheck ${LatestPy} ||yum -y install --nogpgcheck python36u
        yum -y install --nogpgcheck ${LatestPy}-devel ||yum -y install --nogpgcheck python36u-devel
        yum -y install --nogpgcheck ${LatestPy}-pip ||{
            yum -y install --nogpgcheck python36u-pip ||curl -fsSL https://bootstrap.pypa.io/get-pip.py |${LatestPy} -
        }
        ln -sv "/usr/bin/pip${LPyV}" /usr/bin/pip3 ||ln -sv /usr/bin/pip3.6 /usr/bin/pip3
        ln -sv "/usr/bin/python${LPyV}" /usr/bin/python3 ||ln -sv /usr/bin/python3.6 /usr/bin/python3
        ln -sv "/usr/bin/python${LPyV}-config" /usr/bin/python3-config ||ln -sv /usr/bin/python3.6-config /usr/bin/python3-config
        ln -sv "/usr/lib64/python${LPyV}/config-${LPyV}m-x86_64-linux-gnu" "/usr/lib64/python${LPyV}/config"
        pip3 install --upgrade pip || pip install --upgrade pip
        pip install ptipython pip-tools jedi autopep8 flake8 PrettyPrinter psutil mhsize  httpie ngxtop icdiff neovim
        cd && curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer |bash

        # nodejs npm
        curl -sL https://rpm.nodesource.com/setup_11.x | bash -
        sudo yum install -y nodejs
        curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
        sudo yum install yarn
        sudo npm install -g npm

        #noevim
        NvimApp_uri=$(curl -sL https://github.com/neovim/neovim/releases/latest |awk -F'[ =]+' '/href.*\.appimage"/{print $4}')
	    echo "https://github.com"$(echo $NvimApp_uri |tr -d '"') |xargs curl -sLO
	    ./nvim.appimage --appimage-extract
        cp -r ./squashfs-root/usr/bin/nvim /usr/local/bin/nvim
	    chmod +x /usr/local/bin/nvim

        # vim
        cd ~/gitrepos && git clone https://github.com/boomker/Myvimrc.git
        cd ./Myvimrc
        # tic xterm-256color-italic.terminfo
        mv ~/.vimrc{,.bak} 2>/dev/null
        ln -sv ${PWD}/.vimrc ~/.vimrc
        ;;
    *)
        exit 1
        ;;
esac


# git Myself zshell conf repo:
git clone https://github.com/boomker/Myzshrc.git ~/gitrepos && cd ~/gitrepos/Myzshrc
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" && {
    # setopt EXTENDED_GLOB
    # for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
        mv "${HOME}"/.zshrc{,.bak}
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
}
# source ./oh-my-zsh_install.sh
cp ./zpreztorc "${HOME}"/.zpreztorc
ln -sv "${PWD}"/.zshrc ~/.zshrc

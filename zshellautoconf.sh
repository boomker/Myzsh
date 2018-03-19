#!/bin/bash
# Description:
# Author: boomker
# Mail: 15800545854@139.com

# os type judge
source /etc/os-release
case $ID in
    ubuntu)
        apt install vim git tree tar unzip wget zsh
        ;;
    centos)
        yum -y install vim git tree tar unzip wget zsh
        yum -y install yum-utils &&yum -y install https://centos7.iuscommunity.org/ius-release.rpm
        yum -y install python36u && yum -y install python36u-pip &&yum -y install python36u-devel
        ln -sv /usr/bin/pip3.6 /usr/bin/pip3 &&ln -sv /usr/bin/python3.6 /usr/bin/python3
        ln -sv /usr/bin/python3.6-config /usr/bin/python3-config
        ;;
    *)
        exit 1
        ;;
esac


# git Myself zshell conf repo:
cd $HOME
mkdir gitrepo
cd gitrepo
git clone --depth 1 https://github.com/junegunn/fzf.git
git clone https://github.com/boomker/Myzshrc.git
cd Myzshrc
bash oh-my-zsh_install.sh
mv $HOME/.zshr{,bak}
cp .zshrc $HOME
cp alias.zsh $HOME/.oh-my-zsh/custom
cp bullet-train.zsh-theme $HOME/.oh-my-zsh/themes
cp zsh-autosuggestions.plugin.zsh $HOME/.oh-my-zsh/plugins
cp zsh-syntax-highlighting.zsh $HOME/.oh-my-zsh/plugins
cd ../fzf
bash install
sleep 2
echo -n "y\n"
sleep 1
echo -n "y\n"
sleep 1
echo -n "y\n"


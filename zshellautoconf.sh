#!/bin/bash
# Description:
# Author: boomker
# Mail: 15800545854@139.com

# os type judge
source /etc/os-release
case $ID in
    ubuntu)
        apt -y install vim git tree tar unzip wget zsh silversearcher-ag
        ;;
    centos)
        yum -y install vim git tree tar unzip wget zsh
        yum install epel-release.noarch the_silver_searcher -y
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
source ./oh-my-zsh_install.sh
mv $HOME/.zshrc{,.bak}
cp $HOME/gitrepo/Myzshrc/.zshrc $HOME
cp alias.zsh $HOME/.oh-my-zsh/custom
cp bullet-train.zsh-theme $HOME/.oh-my-zsh/themes
cd ../fzf
bash install



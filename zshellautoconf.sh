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
source /etc/os-release
case $ID in
    ubuntu)
        apt-get update
        apt -y install git tree tar unzip wget zsh silversearcher-ag gcc cmake
        ;;
    centos)
        yum -y update
        yum -y install git tree tar unzip wget zsh gcc camke epel-release.noarch the_silver_searcher

        # Python3
        yum -y install yum-utils &&yum -y install https://centos7.iuscommunity.org/ius-release.rpm
        LatestPy="$(yum search python3|awk -F'[.,-]+' '/^python3[6u,7,7u]/{print $1}' |sort -u |tail -1)"
        LPyV="$(echo "${LatestPy}" |sed 's/[a-zA-Z]//g'|awk 'BEGIN{FS="";OFS="."}{NF++;print $1,$2}')"
        yum -y install ${LatestPy} ||yum -y install python36u
        yum -y install ${LatestPy}-pip ||yum -y install python36u-pip
        yum -y install ${LatestPy}-devel ||yum -y install python36u-devel
        ln -sv "/usr/bin/pip${LPyV}" /usr/bin/pip3 ||ln -sv /usr/bin/pip3.6 /usr/bin/pip3
        ln -sv "/usr/bin/python${LPyV}" /usr/bin/python3 ||ln -sv /usr/bin/python3.6 /usr/bin/python3
        ln -sv "/usr/bin/python${LPyV}-config" /usr/bin/python3-config ||ln -sv /usr/bin/python3.6-config /usr/bin/python3-config
        ln -sv "/usr/lib64/python${LPyV}/config-${LPyV}m-x86_64-linux-gnu" "/usr/lib64/python${LPyV}/config"

        # Vim8.0
        yum -y remove vim-filesystem vim-minimal vim-common vim-enhanced
        yum install -y ruby ruby-devel lua lua-devel luajit \
        luajit-devel ctags git python python-devel \
        python3 python3-devel tcl-devel \
        perl perl-devel perl-ExtUtils-ParseXS \
        perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
        perl-ExtUtils-Embed centos-release-scl devtoolset-3-toolchain gcc-c++ ncurses-devel \
        scl enable devtoolset-3 bash
        cd ~/gitrepo
        git clone https://github.com/vim/vim.git
        cd ./vim
        ./configure --with-features=huge \
                    --enable-multibyte \
                    --enable-rubyinterp=yes \
                    --enable-pythoninterp=yes \
                    --with-python-config-dir=/usr/lib64/python2.7/config \
                    --enable-python3interp=yes \
                    --with-python3-config-dir="/usr/lib64/python${LPyV}/config" \
                    --enable-perlinterp=yes \
                    --enable-luainterp=yes \
                    --enable-gui=gtk2 \
                    --enable-cscope \
                    --prefix=/usr/local
        make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
        sudo make install
        update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
        update-alternatives --set editor /usr/local/bin/vim
        export VIMRUNTIME=/usr/local/share/vim/vim80
        cd ../ && git clone https://github.com/boomker/Myvimrc.git
        curl -fLo "${VIMRUNTIME}/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        cd ./Myvimrc && cp solarized8_flat.vim "${VIMRUNTIMEDIR}/colors/"
        cp .vimrc ~/
        ;;
    *)
        exit 1
        ;;
esac


# git Myself zshell conf repo:
cd "$HOME"
mkdir gitrepo
cd gitrepo
# git clone --depth 1 https://github.com/junegunn/fzf.git
git clone https://github.com/boomker/Myzshrc.git
cd Myzshrc
mv "${HOME}"/.zshrc{,.bak}
source ./oh-my-zsh_install.sh
# cp alias.zsh "${HOME}"/.oh-my-zsh/custom
# cp bullet-train.zsh-theme "${HOME}"/.oh-my-zsh/themes
cp -f "${HOME}"/gitrepo/Myzshrc/.zshrc "${HOME}"
# cd ../fzf && ./install
cd "${HOME}" && source ./.zshrc

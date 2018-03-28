# alias config:
if [[ $(uname -s) == "Darwin" ]]; then
    # alias for MacOS_Darwin
    alias aliconf="vim ${HOME}/gitrepo/Myzshrc/alias.zsh"
    # alias zshreload='source ~/.zshrc'
    # alias piua="for i in $(pip3 list --outdate |gawk 'NR>2{print $1}');do pip3 install --upgrade $i;done"
    # alias piua="for i in $(pip3 list --outdate |gawk 'NR>2{print $1}');do pip3 install --upgrade $i;done"
    alias zshconfig="vim ${HOME}/gitrepo/Myzshrc/.zshrc"
    alias vimconfig="vim ${HOME}/gitrepo/Myvimrc/.vimrc"
    alias tmuxconfig="vim ${HOME}/gitrepo/Mytmuxconf/.tmux.conf"
    alias brin='brew install '
    alias brci='brew cask install '
    alias cp='gcp -f -u'
    alias mv='gmv -f -u'
    alias rmaf="rm -rf"
    alias ls='gls -p --width=80 --color=auto'
    alias ll='ls -rtlh'
    alias nl="gnl"
    alias find="gfind"
    alias xargs="gxargs"
    alias locate="glocate"
    alias updatedb="gupdatedb"
    alias grep='ggrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
    alias sed='gsed'
    alias awk='gawk'
    alias wcl="wc -l"
    alias duhl='du -ah --max-depth=1 '
    alias trel='tree -L 1 '
    alias gcl="git clone "
    alias ips="ptipython"
    alias dfh='df -Th'
    alias piu="pip3 uninstall "
    alias pii="pip3 install "
    alias pus="pip3 install --upgrade pip"
    alias adl='aria2c -x6 -c '
    alias ffw='proxychains4 '
    alias ffww='proxychains4 wget '
    alias ffwa='proxychains4 aria2c -x6 -c '
    alias -s gz='tar xf'
    alias -s xz='tar xf'
    alias -s bz2='tar xf'
    alias -s tgz='tar xf'
    alias -s zip='unzip'
    alias -s 7z='p7zip -d'
    alias -s rpm='rpm -ivh'
    alias -s py='python3'
    alias -s md='less'
else
    alias shasconf='vim ${ZSH_CUSTOM}/alias.zsh'
    alias ss='ss -tnlp |column -t'
    alias kill='kill -9 '
    alias ls='ls -p --width=80 --color=auto'
    alias ll='ls -rtlh'
    alias wcl="wc -l"
    alias sedi='sed -i '
    alias mmi="make -j2&&make install"
    alias duhl='du -ah --max-depth=1 '
    alias trel='tree -L 1 '
    alias zshreload='source ~/.zshrc'
    alias zshconfig="vim ~/.zshrc"
    alias vimconfig='vim ~/.vimrc'
    alias tmuxconfig='vim ~/.tmux.conf'
    alias dstat="dstat -cdlmnpsy"
    alias gcl="git clone "
    alias dfh='df -Th'
    alias piu="pip3 uninstall "
    alias pii="pip3 install "
    alias adl='aria2c -x6 -c '
    alias ffw='proxychains4 '
    alias ffww='proxychains4 wget '
    alias ffwa='proxychains4 aria2c -x6 -c '
    alias -s gz='tar xf'
    alias -s xz='tar xf'
    alias -s bz2='tar xf'
    alias -s tgz='tar xf'
    alias -s zip='unzip'
    alias -s 7z='p7zip -d'
    alias -s rpm='rpm -ivh'
    alias -s py='python3'
    alias -s md='less'
fi

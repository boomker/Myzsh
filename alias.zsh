# alias config:
if [[ $(uname -s) == "Darwin" ]]; then
    # alias for MacOS_Darwin
    alias brin='brew install '
    alias brci='brew cask install '
    alias gcp='gcp -f -u'
    alias gmv='gmv -f -u'
    alias rmaf="rm -rf"
    alias gls='gls -p --width=80 --color=auto'
    alias ll='ls -rtlh'
    alias wcl="wc -l"
    alias sedi='sed -i '
    #alias mmi="make -j2&&make install"
    alias duhl='du -ah --max-depth=1 '
    alias trel='teer -L 1 '
    alias zshreload='source ~/.zshrc'
    alias zshconfig="vim ~/.zshrc"
    alias vimconfig='vim ~/.vimrc'
    alias tmuxconfig='vim ~/.tmux.conf'
    alias gcl="git clone "
    alias ips="/usr/bin/ipython"
    alias dfh='df -Th'
    alias piu="pip3 uninstall "
    alias pii="pip3 install "
    #alias piua="for i in $(pip3 list --outdate |gawk 'NR>2{print $1}');do pip3 install --upgrade $i;done"
    #alias jpnb='cd;jupyter notebook >$HOME/.jupyter/jupyter_notebook_running.log 2>&1 &'
    alias axcdl='aria2c -x6 -c '
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
    alias ls='ls -p --width=80 --color=auto'
    alias ll='ls -rtlh'
    alias wcl="wc -l"
    alias sedi='sed -i '
    alias mmi="make -j2&&make install"
    alias duhl='du -ah --max-depth=1 '
    alias trel='teer -L 1 '
    alias zshreload='source ~/.zshrc'
    alias zshconfig="vim ~/.zshrc"
    alias vimconfig='vim ~/.vimrc'
    alias tmuxconfig='vim ~/.tmux.conf'
    alias dstat="dstat -cdlmnpsy"
    alias gcl="git clone "
    alias ips="/usr/bin/ipython"
    alias dfh='df -Th'
    alias piu="pip3 uninstall "
    alias pii="pip3 install "
    #alias piua="for i in $(pip3 list --outdate |gawk 'NR>2{print $1}');do pip3 install --upgrade $i;done"
    #alias jpnb='cd;jupyter notebook >$HOME/.jupyter/jupyter_notebook_running.log 2>&1 &'
    alias axcdl='aria2c -x6 -c '
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


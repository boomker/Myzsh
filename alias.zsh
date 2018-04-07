## alias config:
#
# common func
function mvb { mv $1 $1.bak  }
function cpb { cp $1 $1.bak  }
function nlo { nl $1 |lolcat  }
function tca { tar -czvf $1.tar.gz $1  }
function psa { ps -ef |ag "$1" |ag -vw "ag"  }


# common alias:
    # alias piua="for i in $(pip3 list --outdate |awk 'NR>2{print $1}');do pip3 install --upgrade $i;done" # make lanch zsh too slow
    # jpnb='cd;jupyter notebook >$HOME/.jupyter/jupyter_notebook_running.log 2>&1 & # the reason is same prevalias
    alias -g L=' |less'
    alias -g NL=' |nl |lolcat'
    alias -g CT=' |column -t'
    alias -g J=' |jq'
    alias -g A=' |ag'
    alias -g G=' |egrep -i'
    alias -g H=' |head'
    alias -g E=' |tail'
    alias -g X=' |xargs'
    alias -g U=' |uniq'
    alias -g S=' |sort'
    alias -g T=' |tee'
    alias -g W=' |wc -l'
    alias ips="ptipython"
    alias idf="icdiff -r -N"
    # 可以递归对比两目录的差异，包括文件内容的差异
    alias auq="awk '!U[\$0]++' "
    # awk 去重+合并文件内容(相当于两文件的并集，两文件去重后再合并)，而且能保证文件内容顺序
    alias lc='lolcat'
    alias l="exa -abghl --git --color=automatic"
    alias ls='ls -p --width=80 --color=auto'
    alias ll='ls -rtlh'
    alias wl="wc -l"
    alias sei='sed -i '
    alias sen='sed -n '
    # alias rmaf="rm -rf"
    alias cp="cp -f -u"
    alias mv='mv -f -u'
    alias gcl="git clone "
    alias gaa="git add ."
    alias gcm="git commit -m "
    alias gpo="git push origin"
    alias gfu="git fetch upstream"
    alias gmu="git merge upstream/master"
    alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
    alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
    alias dfh='df -Th'
    alias duhl='du -ah --max-depth=1 '
    alias trel='tree -L 1 '
    alias pip3='python3 -m pip'
    alias piu="python3 -m pip uninstall "
    alias pii="python3 -m pip install "
    alias pus="pip3 install --upgrade pip"
    alias adl='aria2c -x6 -c '
    alias ffw='proxychains4 '
    alias ffww='proxychains4 wget '
    alias ffwa='proxychains4 aria2c -x6 -c '
    alias aliconf="vim ${HOME}/gitrepo/Myzshrc/alias.zsh"
    # alias zshreload='source ~/.zshrc' # conflict with tmux
    alias zshconfig="vim ${HOME}/gitrepo/Myzshrc/.zshrc"
    alias vimconfig="vim ${HOME}/gitrepo/Myvimrc/.vimrc"
    alias tmuxconfig="vim ${HOME}/gitrepo/Mytmuxconf/.tmux.conf"


# for different OS of alias conf:
#     # alias for MacOS_Darwin
if [[ $(uname -s) == "Darwin" ]]; then
    alias tq="tianqi"
    alias mzshconfig="vim ${HOME}/gitrepo/Myzshrc/.zshrc_mac"
    alias brin='brew install '
    alias brci='brew cask install '
    alias cp='gcp -f -u'
    alias mv='gmv -f -u'
    alias ls='gls -p --width=80 --color=auto'
    alias nl="gnl"
    alias find="gfind"
    alias xargs="gxargs"
    alias locate="glocate"
    # alias updatedb="gupdatedb"
    alias grep='ggrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
    alias sed='gsed'
    alias sort='gsort'
    alias uniq='guniq'
    alias awk='gawk'
else
    # alias for *unix
    alias open=xdg-open
    alias free='free -mht'
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    alias ss='ss -tnlp |column -t'
    alias mmi="make -j2&&make install"
    alias dstat="dstat -cdlmnpsy"
fi

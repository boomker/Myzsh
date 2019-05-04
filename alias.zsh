## alias config:

# common func
    function aama() {
        ansible all -b -m "$1" -a "$2"
    }

    function cpb()  {
        cp "$1" "$1-$(date +%F_%H_%M_%S).bak"
    }

    function mvb()  {
        mv "$1" "$1-$(date +%F_%H_%M_%S).bak"
    }

    function mdac() {
        mkdir "$1" && cd "$1"
    }

    function rmcd() {
        _CDN="$(basename $PWD)";cd "$(dirname $PWD)";rm -rf "$_CDN"
    }

    function mkdf() {
        _Fn="$(basename $1)";_Dn="$(dirname $1)";mkdir -p "$_Dn" && touch "${_Dn}"/"${_Fn}"
    }

    function nlc()  {
        nl "$1" |lolcat
    }

    function tca()  {
        tar -czvf "$1.tar.gz" "$1"
    }

    function psa()  {
        ps -ef |rg "$1" |rg -vw "rg"
    }

    function hles() {
        highlight -O xterm256 "$1" |less -R -N
    }

    function gvbc() {
        egrep -v "^(#|$)" "$1"
    }

# export LESS=" -R"
# export LESSOPEN="|highlight -O truecolor %s"
# export LESS_TERMCAP_mb=$'\E[01;31m'
# export LESS_TERMCAP_md=$'\E[01;31m'
# export LESS_TERMCAP_me=$'\E[0m'
# export LESS_TERMCAP_se=$'\E[0m'
# export LESS_TERMCAP_so=$'\E[01;44;33m'
# export LESS_TERMCAP_ue=$'\E[0m'
# export LESS_TERMCAP_us=$'\E[01;32m'

z_replacement()
{
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf-tmux +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

vg() {
    local file

    file="$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1}')"

    if [[ -n $file ]]
    then
        nvim $file
    fi
}

fo() {
    local out file key
    IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
    key=$(head -1 <<< "$out")
    file=$(head -2 <<< "$out" | tail -1)
    if [ -n "$file" ]; then
        [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
    fi
}

fjpane() {
    local panes current_window current_pane target target_window target_pane
    panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
    current_pane=$(tmux display-message -p '#I:#P')
    current_window=$(tmux display-message -p '#I')

    target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

    target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
    target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

    if [[ $current_window -eq $target_window ]]; then
        tmux select-pane -t ${target_window}.${target_pane}
    else
        tmux select-pane -t ${target_window}.${target_pane} &&
        tmux select-window -t $target_window
    fi
}

ftc() {
    dirname=$(dirname "$1")
    filename=$(basename "$1")
    cd ${dirname}
    dir=$(pwd)
    osascript -e 'tell app "Finder" to set the clipboard to ( POSIX file "'${dir}/${filename}'" )'
    cd -
    # osascript -e 'tell app "Finder" to set the clipboard to ( POSIX file "'$1'" )'
}

# common alias:
    # alias piua="for i in $(pip3 list --outdate |awk 'NR>2{print $1}');do pip3 install --upgrade $i;done" # make lanch zsh too slow
    # jpnb='cd;jupyter notebook >$HOME/.jupyter/jupyter_notebook_running.log 2>&1 & # the reason is same prevalias
    alias -g NL=" |nl |lolcat"
    alias -g CT=" |column -t"
    alias -g PC=" |pbcopy"
    alias -g A=" |ag"
    alias -g R=" |rg"
    alias -g G=" |egrep -i"
    alias -g H=" |head"
    alias -g T=" |tail"
    alias -g L=" |less"
    alias -g J=" |jq"
    alias -g X=" |xargs"
    alias -g P=" |parallel"
    alias -g U=" |uniq"
    alias -g S=" |sort"
    alias -g Y=" |tee"
    alias -g W=" |wc -l"
    alias afk="ag --nobreak --nonumbers --noheading . | fzf"
    alias z="z_replacement"
    alias zip="zip -r "
    alias pps="ptipython3"
    alias ips="ipython3"
    alias tm="tmux"
    alias idf="icdiff -r -N"
    # 可以递归对比两目录的差异，包括文件内容的差异
    alias auq="awk '!U[\$0]++' "
    # awk 去重+合并文件内容(相当于两文件的并集，两文件去重后再合并)，而且能保证文件内容顺序
    alias l.="ls -d .* --color=auto"
    alias lc="lolcat"
    alias ls="ls -p --width=80 --color=auto"
    alias ll="ls -rtlh"
    alias wl="wc -l"
    alias sei="sed -i "
    alias sen="sed -n "
    alias tssh="TERM=xterm-256color ssh"
    # alias rmaf="rm -rf"
    alias cpf="cp -f "
    alias cpr="cp -r "
    alias mv="mv -f "
    alias timep="/usr/local/bin/time -p"
    alias gcl="git clone "
    alias gaa="git add ."
    alias gcm="git commit -m "
    alias gpo="git push origin ||git push -u origin"
    alias gidf="git-icdiff"
    alias gco="git checkout "
    alias gcom="git checkout master"
    alias gfu="git fetch upstream"
    alias gmu="git merge upstream/master"
    alias grep="grep -i --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
    alias egrep="egrep -i --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
    alias dfh="df -Th"
    alias duhl="du -ah --max-depth=1 "
    alias trel="tree -L 1 "
    # alias pip3="python3 -m pip"
    # alias piu="python3 -m pip uninstall "
    alias piu="pip3 uninstall "
    alias pii="pip3 install "
    # alias pii="python3 -m pip install "
    alias pus="pip3 install --upgrade pip"
    # alias pypi="/usr/local/opt/pypy3/bin/pip"
    alias adl="aria2c -x6 -c "
    alias ffw="proxychains4 "
    alias ffww="proxychains4 wget "
    alias ffwa="proxychains4 aria2c -x6 -c "
    alias sshconf="nvim ${HOME}/.ssh/config"
    alias aliconf="nvim ${HOME}/gitrepos/Myzshrc/alias.zsh"
    alias zshreload="source ~/.zshrc" # conflict with tmux
    alias zshconfig="nvim ${HOME}/gitrepos/Myzshrc/.zshrc"
    alias vimconfig="nvim ${HOME}/gitrepos/Myvimrc/.vimrc"
    alias tmuxconfig="nvim ${HOME}/gitrepos/Mytmuxconf/.tmux.conf"


# for different OS of alias conf:
#     # alias for MacOS_Darwin
if [[ $(uname -s) == "Darwin" ]] ; then
    alias -g C=" |pbcopy"
    alias vim="nvim"
    alias mzshconfig="nvim ${HOME}/gitrepos/Myzshrc/.zshrc_mac"
    alias brin="brew install "
    alias brci="brew cask install "
    alias cpf="gcp -f "
    alias cpr="gcp -ar "
    alias mv="gmv -f "
    alias l="exa -abghl --git --color=automatic"
    alias ls="gls -p -w 80 --color=auto"
    alias nl="gnl"
    alias du="gdu"
    alias duts="du -ch |tail -1"
    alias find="gfind"
    alias xargs="gxargs"
    alias locate="glocate"
    # alias updatedb="gupdatedb"
    alias grep="ggrep -i --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
    # alias grep="rg"
    alias date="gdate"
    alias cut="gcut"
    alias sed="gsed"
    alias sort="gsort"
    alias stat="gstat"
    alias uniq="guniq"
    alias awk="gawk"
    alias df="gdf"
    alias tr="gtr"
    alias mdsum="gmd5sum"
    alias netstat="netstat -nptcp"
    alias pps="$(which ptipython3)"
    alias ips="$(which ipython3)"
else
    # alias for *unix
    alias open="xdg-open"
    alias free="free -mh"
    alias pc="xsel --clipboard --input"
    alias pp="xsel --clipboard --output"
    alias mmi="make -j2&&make install"
    alias dstat="dstat -cdlmnpsy"
fi

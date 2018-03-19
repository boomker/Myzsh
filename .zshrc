# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=9

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup. tmux thefuck history-substring-search osx pip python web-search

plugins=(colored-man-pages extract ssh-agent zsh-autosuggestions zsh-syntax-highlighting)

# User configuration
# eval $(thefuck --alias fuck)

# less hightlight
# export LESSOPEN="| /usr/local/Cellar/source-highlight/3.1.8_7/bin/source-highlight-esc.sh %s"
# export LESSOPEN="| /usr/local/Cellar/source-highlight/3.1.8_7/bin/src-hilite-lesspip3e.sh %s"
# export LESS=" -R"

# pyenv &&pyenv-virtualenv configuration:
export PYENV_ROOT="/usr/local/opt/pyenv"
export VIRTUALENV_ROOT="/usr/local/opt/pyenv-virtualenv"
export PATH="$PYENV_ROOT/bin:$VIRTUALENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# git more speed conf:
# git config --global http.useragent https://github.com.proxy http://127.0.0.1:8090
# git config --global http.proxy 'socks5://127.0.0.1:1086
# git config --global https.proxy 'socks5://127.0.0.1:1086

# export HOMEBREW_BOTTLE_DOMAIN=http://7xkcej.dl1.z0.glb.clouddn.com
#export HOMEBREW_GITHUB_API_TOKEN=""
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export PATH="/bin:/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# catalog varpath conf:
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

## ssh
 if [[ -d ~/.ssh ]]; then
    export SSH_KEY_PATH="~/.ssh/dsa_id"
else
    mkdir ~/.ssh
    export SSH_KEY_PATH="~/.ssh/dsa_id"
fi

## default editor config Vim or neovim(nvim):
if [[ -e /bin/vim ]]; then
    export EDITOR="/bin/vim"
else
    export EDITOR="/bin/nvim"
    # alias vim="/bin/nvim"
fi
if [[ $(uname -s) == "Linux" ]]; then
    export VIM="/usr/share/vim" # for Linux
    export VIMRUNTIME="/usr/share/vim/vim74" # for Linux
else
    # export VIM="/usr/local/opt/neovim/share/nvim" # for MacOS_Darwin
    export VIM="/Applications/MacVim.app/Contents/Resources/vim"
    # export VIMRUNTIME="/usr/local/opt/neovim/share/nvim/runtime" # for MacOS_Darwin
    export VIMRUNTIME="/Applications/MacVim.app/Contents/Resources/vim/runtime"
fi

# Tomcat Path
# export JAVA_HOME=/usr/lib/jvm/jdk
# export TOMCAT_HOME=/opt/tomcat8
# export CATALINA_HOME=$TOMCAT_HOME
# export CLASSPATH=.:${JAVA_HOME}/lib:${CATALINA_HOME}/lib
# export PATH=${JAVA_HOME}/bin:$PATH

# export CHEATCOLORS=true
# export PAGER=most

# autoload colors
# colors

## other zsh plugins
# iterm2_shell_integration.zsh
# test -e "${HOME}/.iterm2_shell_integration.zsh" && mv "${HOME}/.iterm2_shell_integration.zsh" ${ZSH_CUSTOM}/plugins
# test -e "${ZSH_CUSTOM}/plugins/.iterm2_shell_integration.zsh" && source "${ZSH_CUSTOM}/plugins/.iterm2_shell_integration.zsh"

# incr func:实时自动tab
# [ -d $HOME/.oh-my-zsh/plugins/incr ] || {
    # mkdir $HOME/.oh-my-zsh/plugins/incr
    # wget http://mimosa-pudica.net/src/incr-0.2.zsh -O .oh-my-zsh/plugins/incr/incr.plugin.zsh
# }

# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone git://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# alias for MacOS_Darwin

if [[ $(uname -s) == "Linux" ]]; then
    alias ls='ls -p --width=80 --color=auto'
    alias sedi='sed -i '
    alias rmaf="rm -rf"
fi

function mvb { mv $1 $1.bak }
function cpb { cp $1 $1.bak }
function cph { cp $1 $HOME }
function txh { tar xf $1 -C $HOME }
function tca { tar -czvf $1.tar.gz $1 }
function uzh { unzip -d $HOME $1 }
function psa { ps -ef |ag "$1" |ag -vw "ag" }
function hels { find $HOME/.tldrc/tldr-master/pages -name "$1*";tldr $1 }
function fmusic { find /Volumes/document/视音频资料/CloudMusic -iname "*$1*.mp3" }

# ##############################################
## 关于历史纪录的配置
## 历史纪录条目数量
export HISTSIZE=10000

## 注销后保存的历史纪录条目数量
export SAVEHIST=10000

## 历史纪录文件
export HISTFILE=~/.zhistory

## 以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY

## 如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS

## 为历史纪录中的命令添加时间戳
setopt EXTENDED_HISTORY

##启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD

##相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS

## 每个目录使用独立的历史纪录
cd() {
builtin cd "$@"                         # do actual cd
fc -W                                   # write current history  file
local HISTDIR="$HOME/zsh_history$PWD"   # use nested folders for history
if  [ ! -d "$HISTDIR" ] ; then          # create folder if needed
mkdir -p "$HISTDIR"
fi
export HISTFILE="$HISTDIR/zhistory"     # set new history file
touch $HISTFILE
local ohistsize=$HISTSIZE
HISTSIZE=0                              # Discard previous dir's history
HISTSIZE=$ohistsize                     # Prepare for new dir's history
fc -R                                   # read from current histfile
}
mkdir -p $HOME/zsh_history$PWD
export HISTFILE="$HOME/zsh_history$PWD/zhistory"
## 历史命令 history top10
alias hist10='print -l ${(o)history%% *} |uniq -c |sort -nr |head -n 10'
alias histail='history |tail'
alias histls='history |tail -100 |ag '

## 扩展路径
# /v/c/p/p => /var/cache/pacman/pkg
setopt complete_in_word

##  禁用 core dumps
limit coredumpsize 1

## Emacs风格 键绑定
bindkey -e

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

## 自动补全功能 {{{
setopt AUTO_LIST
setopt AUTO_MENU
# setopt AUTO_CD

## 开启此选项，补全时会直接选中菜单项
setopt MENU_COMPLETE
autoload -U compinit &&compinit

## 自动补全选项
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*' menu select
# zstyle ':completion:*:*:default' force-list always
# zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'

# zstyle ':completion:*:match:*' original only
# zstyle ':completion::prefix-1:*' completer _complete
# zstyle ':completion:predict:*' completer _complete
# zstyle ':completion:incremental:*' completer _complete _correct
# zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

## 路径补全
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

## 彩色补全菜单
[[ $(uname -s) == "Linux" ]] && eval $(dircolors -b) || eval $(gdircolors -b)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

## 修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

## 错误校正
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

## 补全类型提示分组
    zstyle ':completion:*:matches' group 'yes'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*:options' description 'yes'
    zstyle ':completion:*:options' auto-description '%d'
    zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
    zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
    zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
    zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'

## cd ~ 补全顺序
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'

# Tab complete cd
user-complete(){
    if [[ -n $BUFFER ]];then
        zle expand-or-complete
    else
        BUFFER="cd"
        zle end-of-line
        zle expand-or-complete
    fi
}

zle -N user-complete
bindkey "\t" user-complete

# [Esc][h] man 当前命令时，显示简短说明
alias run-help >&/dev/null && unalias run-help
autoload run-help

# 路径别名进入相应的路径时只要 cd ~xxx
hash -d ci="/usr/local/"

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## tmux auto attach
TPC=`ps -ef |ag -w "tmux" |ag -vw "ag"|wc -l`
if [[ $TPC == 0 ]]; then
    #tmux
elif [[ $TPC == 1 ]]; then
    tmux attach
    # tmux attach -t 0
# else
    # tmux list-windows
fi


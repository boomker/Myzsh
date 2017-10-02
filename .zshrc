# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
#ZSH_THEME="macovsky-ruby"
ZSH_THEME="bullet-train-mod"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=3

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
# HIST_STAMPS="mm/dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup. tmux thefuck archlinux history-substring-search osx

plugins=(autojump colored-man-pages git pip python ssh-agent zsh-autosuggestions zsh-syntax-highlighting)
autoload -U compinit && compinit

# User configuration
# eval $(thefuck --alias fuck)

## other zsh plugins
# iterm2_shell_integration.zsh
# test -e "${HOME}/.iterm2_shell_integration.zsh" && mv "${HOME}/.iterm2_shell_integration.zsh" ${ZSH_CUSTOM}/plugins
# test -e "${ZSH_CUSTOM}/plugins/.iterm2_shell_integration.zsh" && source "${ZSH_CUSTOM}/plugins/.iterm2_shell_integration.zsh"

# incr func:实时自动tab
# wget http://mimosa-pudica.net/src/incr-0.2.zsh -O .oh-my-zsh/plugins/incr.zsh
source .oh-my-zsh/plugins/incr.zsh
source $ZSH/oh-my-zsh.sh
# source /usr/local/etc/profile.d/autojump.sh

# export HOMEBREW_BOTTLE_DOMAIN=http://7xkcej.dl1.z0.glb.clouddn.com
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export PATH="/bin:/sbin/:/usr/local/bin:/usr/sbin:/usr/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/man:/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

## ssh
 if [[ -d ~/.ssh ]]; then
    export SSH_KEY_PATH="~/.ssh/dsa_id"
else
    mkdir ~/.ssh
    export SSH_KEY_PATH="~/.ssh/dsa_id"
fi

## Vim
if [[ $(uname -s) == "Linux" ]]; then
    export VIM="/usr/share/vim" # for Linux
    export VIMRUNTIME="/usr/share/vim/vim74" # for Linux
else
    export vim="/usr/local/opt/vim/share/vim" # for MacOS_Darwin
    export VIMRUNTIME="/usr/local/opt/vim/share/vim/vim80" # for MacOS_Darwin
fi
# export NVIM="/usr/local/share/nvim"

## Tomcat Path
# export JAVA_HOME=/usr/lib/jvm/jdk
# export TOMCAT_HOME=/opt/tomcat8
# export CATALINA_HOME=$TOMCAT_HOME
# export CLASSPATH=.:${JAVA_HOME}/lib:${CATALINA_HOME}/lib
# export PATH=${JAVA_HOME}/bin:$PATH

export CHEATCOLORS=true
# export PAGER=most

autoload colors
colors

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# alias for MacOS_Darwin
    alias cp='cp -i'
    alias mv='mv -i'
    alias sedi='gsed -i '
    alias raf="ranger"
    alias rm='rm-p'
    alias rmaf="rm -rf"
    alias lockrmf="protect "
    alias lockrmd="protect -R "
    alias gfd="gfind"
    alias wcl="wc -l"
    alias ls='gls -p --width=80 --color=auto'
    alias ll='ls -rtlh'
    alias lla="ll -h|ag "
    alias llg="ll -h|grep "
    alias agv="ag -v "
    alias grep='grep -i --color=auto'
    alias egrep='egrep -i --color=auto'
    alias mmi="make -j2&&make install"
    alias duhl='du -ah --max-depth=1 '
    alias trel='teer -L 1 '
    alias zshreload='source ~/.zshrc'
    alias zshconfig="vim ~/.zshrc"
    alias vimconfig='vim ~/.vimrc'
    alias tmuxconfig='vim ~/.tmux.conf'
    alias tmuxreload='tmux source-file ~/.tmux.conf'
    alias tmuath='tmux attach'
    alias hp='htop'
    alias dstat="dstat -cdlmnpsy"
    alias pss="ps -ef |ag "
    alias gcl="git clone "
    alias ips="ipython"
    alias dfh='df -Th'
    alias piu="pip uninstall "
    alias pii="pip install "
    alias eai="easy_install "
    alias axcdl='aria2c -x6 -c '
    alias pcwget='proxychains wget '
    alias pcaxcdl='proxychains aria2c -x6 -c '
    alias -s gz='tar xf'
    alias -s xz='tar xf'
    alias -s bz2='tar xf'
    alias -s tgz='tar xf'
    alias -s zip='unzip'
    alias -s 7z='p7zip -d'
    alias -s rpm='rpm -ivh'
    alias -s html='vim'
    alias -s php='vim'
    alias -s py='python'
    alias -s md='less'

if [[ $(uname -s) == "Linux" ]]; then
    alias ls='ls -p --width=80 --color=auto'
    alias sedi='sed -i '
    alias rmaf="rm -rf"
    unalias rm
    unalias lockrmf
    unalias lockrmd
fi

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

function mvb { mv $1 $1.bak }
function cpb { cp $1 $1.bak }
function cph { cp $1 $HOME }
function finf { gfind "$1" -name "$2" }
function txh { tar xf $1 -C $HOME }
function tca { tar -czvf $1.tar.gz $1 }
function uzh { unzip -d $HOME $1 }
function allhistory { cat $(find $HOME/zsh_history -name zhistory) }
function convhistory {
sort $1 | uniq |
sed 's/^:\([ 0-9]*\):[0-9]*;\(.*\)/\1::::::\2/' |
awk -F"::::::" '{ $1=strftime("%Y-%m-%d %T",$1) "|"; print }'
}

## 使用 histall 命令查看全部历史纪录
function histall { convhistory =(allhistory) |
sed '/^.\{20\} *cd/i\\' }

## 使用 hist 查看当前目录历史纪录
function hist { convhistory $HISTFILE }

## 全部历史纪录 top50
function hist50 { allhistory | awk -F':[ 0-9]*:[0-9]*;' '{ $1="" ; print }' | sed 's/ /\n/g' | sed '/^$/d' | sort | uniq -c | sort -nr | head -n 50 }

## 历史命令 history top10
alias hist10='print -l  ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

## 扩展路径
# /v/c/p/p => /var/cache/pacman/pkg
setopt complete_in_word

##  禁用 core dumps
limit coredumpsize 1

## Emacs风格 键绑定
bindkey -e
# bindkey -v
# bindkey jj vi-cmd-mode

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

## 自动补全功能 {{{
setopt AUTO_LIST
setopt AUTO_MENU
# setopt AUTO_CD

## 开启此选项，补全时会直接选中菜单项
# setopt MENU_COMPLETE
# autoload -U compinit &&compinit

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

## Tab complete cd
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

#[Esc][h] man 当前命令时，显示简短说明
alias run-help >&/dev/null && unalias run-help
autoload run-help

#路径别名 {{{
##进入相应的路径时只要 cd ~xxx
hash -d ci="/usr/local/"
##}}}


# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
export ZSH_CUSTOM=${ZSH}/custom
ZSH_THEME="powerlevel10k/powerlevel10k"
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
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
HIST_STAMPS="mm/dd/yyyy"

plugins=(colored-man-pages docker extract ssh-agent z zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

## --------------User configuration--------------
# You may need to manually set your language environment
export LANG=en_US.UTF-8

[[ $(echo $SHELL 2>/dev/null) == "/bin/bash" ]] && chsh -s /usr/bin/zsh 2>/dev/null

# pyenv conf:
     if [ -n $(command -v pyenv 2>/dev/null) ]
     then
         export PATH="${HOME}/.pyenv/bin:$PATH"
         eval "$(pyenv init -)"
         eval "$(pyenv virtualenv-init -)"
     fi
     export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# pypi mirror repo conf:
    [ ! -d ~/.pip ] && mkdir ~/.pip
    [[ -z $(grep "aliyun" ~/.pip/pip.conf) ]] && {
        cat >> ~/.pip/pip.conf <<-'EOF'
        [global]
        trusted-host =  mirrors.aliyun.com
        index-url = http://mirrors.aliyun.com/pypi/simple

        [list]
        format=columns
EOF
}

# compdef pipenv
    _pipenv() {
        eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE=complete-zsh  pipenv)
    }
    if [[ "$(basename -- ${(%):-%x})" != "_pipenv"  ]]; then
        autoload -U compinit && compinit
        compdef _pipenv pipenv
    fi

# npm mirror repo conf:
    [[ -n $(command -v npm 2>/dev/null) && -z $(grep "taobao" ~/.npmrc) ]] && {
        npm config set registry https://registry.npm.taobao.org
        npm install -g cnpm --registry=https://registry.npm.taobao.org
}

# docker config:
# curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
    [[ -d /etc/docker ]] || {
        mkdir -p /etc/docker
        tee /etc/docker/daemon.json <<-'EOF'
        {
            "registry-mirrors": ["https://arrn62bl.mirror.aliyuncs.com"]
        }
EOF
}
    [[ -n $(command -v docker 2>/dev/null) ]] && {
        systemctl daemon-reload
        systemctl enable docker
        systemctl restart docker
    }

## proxy conf: {{{
if [[ -z $(lsof -nP -i :1087 -a -i :1080 2>/dev/null) ]]
then
    git config --global http.proxy socks5://0.0.0.0:1080
    # git proxy config
    git config --global https.proxy socks5://0.0.0.0:1080
    export GOPROXY="0.0.0.0:1080"
else
    # golang proxy conf
    export GOPROXY="https://goproxy.io"
fi
# }}}

    # rust
    # curl https://sh.rustup.rs -sSf | sh
    # cargo install bat ripgrep
    # https://github.com/universal-ctags/ctags

# thefuck conf:
# if [[ -z $(command -v thefuck 2>/dev/null) ]]
# then
    # [[ -z $(command -v gcc 2>/dev/null) ]] && break
    # pip3 install --upgrade pip
    # pip3 install thefuck
# else
    # eval $(thefuck --alias fff)
# fi

# alias.zsh conf:
if [[ -e ${HOME}/gitrepos/Myzshrc/alias.zsh ]]
then
    [[ ! -e ${ZSH_CUSTOM}/alias.zsh ]] && ln -sv ${HOME}/gitrepos/Myzshrc/alias.zsh  ${ZSH_CUSTOM}/alias.zsh
    # source ${ZSH_CUSTOM}/alias.zsh
fi

## ssh
 if [ -d ~/.ssh ]; then
    export SSH_KEY_PATH="~/.ssh/id_rsa"
else
    mkdir ~/.ssh
    export SSH_KEY_PATH="~/.ssh/id_rsa"
fi

# ## VIM relevance var conf:
# # default editor Vim or neovim(nvim):
if [ -n $(command -v nvim 2>/dev/null) ]; then
    [[ -n $(find /usr/local -type d -name "nvim") ]] && VIMRD=$(find /usr/local/nvim -type d -name "runtime")
    [[ -n $(find /usr/share -type d -name "nvim") ]] && VIMRD=$(find /usr/share/nvim -type d -name "runtime")
    export VIM="$(dirname ${VIMRD})"
    export VIMRUNTIME=${VIMRD}
    export EDITOR="$(command -v nvim)"
else
    export EDITOR="$(command -v vim)"
fi

export VIMFILES="${HOME}/.vim/vimfiles"
# move vim colorstheme:
    # [[ ! -e ${VIMRUNTIME}/colors/solarized8_dark_flat.vim ]] && cp ${VIMFILES}/bundle/vim-colorschemes/colors/solar* ${VIMRUNTIME}/colors/
    [[ -d ${VIMFILES}/bundle/onedark.vim ]] && {
        cp -ar ${VIMFILES}/bundle/onedark.vim/colors/*   ${VIMRUNTIME}/colors/
        cp -ar ${VIMFILES}/bundle/onedark.vim/autoload/* ${VIMRUNTIME}/autoload/
    }

# Golang path setting
    GoRoot="/usr/local/go"
    PATH=$PATH:${GoRoot}/bin

# Tomcat Path
    # export JAVA_HOME=/usr/lib/jvm/jdk
    # export TOMCAT_HOME=/opt/tomcat8
    # export CATALINA_HOME=${TOMCAT_HOME}
    # export CLASSPATH=.:${JAVA_HOME}/lib:${CATALINA_HOME}/lib
    # export PATH=${JAVA_HOME}/bin:${PATH}

## other zsh plugins
# if [[ ! -e ${ZSH_CUSTOM}/themes/bullet-train.zsh-theme ]]
# then
#     [[ ! -d ${ZSH_CUSTOM}/themes ]] && mkdir -p ${ZSH_CUSTOM}/themes
#     rm -rf ${ZSH_CUSTOM}/themes/*
#     git clone https://github.com/caiogondim/bullet-train.zsh.git ${ZSH_CUSTOM}/themes/
# fi

# powerful plugins like fish
if [[ ! -d ${ZSH_CUSTOM}/plugins/zsh-autosuggestions ]] || [[ ! -d ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting ]]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
fi

# fzf.zsh
if [[ -z $(command -v fzf 2>/dev/null) ]]
then
    [[ -d ${HOME}/gitrepos/fzf ]] && {
        bash ~/gitrepos/fzf/install --all
        ln -sv ~/gitrepos/fzf/bin/fzf /usr/bin/fzf
    } ||git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/gitrepos/fzf
else
    [[ -e ${HOME}/.fzf.zsh ]] && mv ${HOME}/.fzf.zsh ${ZSH_CUSTOM}/
fi

# nvm config:
# git clone https://github.com/nvm-sh/nvm.git .nvm
export NVM_DIR="/usr/local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# ##############################################
## 关于历史纪录的配置
# 历史纪录条目数量
export HISTSIZE=10000
# 注销后保存的历史纪录条目数量
export SAVEHIST=10000
## 历史纪录文件
export HISTFILE=~/.zshistory
# 以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY
# 如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS
# 为历史纪录中的命令添加时间戳
setopt EXTENDED_HISTORY
#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS

# ## 每个目录使用独立的历史纪录
# cd() {
# builtin cd "$@"                        # do actual cd
# fc -W                                  # write current history  file
# local HISTDIR="${HOME}/zsh_history"    # use nested folders for history
# if  [ ! -d "${HISTDIR}" ] ; then       # create folder if needed
# mkdir -p "${HISTDIR}"
# fi
# export HISTFILE="${HISTDIR}/zshistory" # set new history file
# touch ${HISTFILE}
# local ohistsize=${HISTSIZE}
# HISTSIZE=0                             # Discard previous dir's history
# HISTSIZE=${ohistsize}                  # Prepare for new dir's history
# fc -R                                  # read from current histfile
# }

# mkdir -p ${HOME}/zsh_history
# export HISTFILE="${HOME}/zsh_history/zshistory"
# ## 历史命令 history top10
# alias hist10='print -l ${(o)history%% *} |uniq -c |sort -nr |head -10'
# alias histail='history |tail'
# alias histls='history |tail -100 |ag '

## Emacs风格 键绑定
bindkey -e
bindkey '^u' backward-kill-line

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

## 开启此选项，补全时会直接选中菜单项
setopt MENU_COMPLETE

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

# add this configuration to ~/.zshrc
# export HH_CONFIG=hicolor        # get more colors
source ${ZSH}/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ${ZSH_CUSTOM}/plugins/.p10k.zsh
export BAT_THEME="TwoDark"

# ------fzf configuration----------
    source ${HOME}/.oh-my-zsh/custom/plugins/.fzf.zsh
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color= \
        always {} ||highlight -O ansi -l {} || cat {}) 2> /dev/null | head -100'"
    export FZF_DEFAULT_OPTS='--height 70% --reverse --border'

# ---------proxy config----------
    # nohup goflyway -up=cf://go.wallbroken.xyz:8880 -k=BWFW#cf-0924 -l=:8100 &
    # nohup goflyway -up=cf://go.wallbroken.xyz:2905 -k=VGWF-km#2019 -l=:8100 &

# 设置使用代理
# setproxy="export https_proxy=http://127.0.0.1:1087; \
    # export http_proxy=http://127.0.0.1:1087; \
    # export all_proxy=socks5://127.0.0.1:1080"

# 设置取消使用代理
    # unsetproxy="unset http_proxy; unset https_proxy; \
    # unset all_proxy; echo 'Unset proxy successfully'"

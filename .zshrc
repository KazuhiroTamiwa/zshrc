# vagrantのboxファイルの場所
export VAGRANT_HOME=/Volumes/Transcend/vagrant/.vagrant.d
export PATH=$VAGRANT_HOME:$PATH

# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    # tmux対応
    for D in `\ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/bin:$PATH"
    done
fi

# memory解放
alias remem='du -sx / &> /dev/null & sleep 25 && kill $!'

# developにマージ済みのローカルブランチを全て削除
alias gitbrm="git branch --merged develop | grep -vE '^\*|master$|develop$' | xargs -I % git branch -d %"

# docker ps -a
alias dps='docker ps -a'

# php
#export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
#export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# phalcon
export PTOOLSPATH=/Users/Kazuhiro/phalcon/phalcon-devtools/
export PATH=$PATH:/Users/Kazuhiro/phalcon/phalcon-devtools

# java version change
alias java1.6='export JAVA_HOME=`/usr/libexec/java_home -v 1.6.0`'
alias java1.7='export JAVA_HOME=`/usr/libexec/java_home -v 1.7.0`'
alias java1.8='export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`'
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`

# Golangの設定
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/golang
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Rustの設定
export PATH="$HOME/.multirust/toolchains/1.7.0/cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.multirust/toolchains/1.7.0/src"

# python
export PYTHONPATH=~/xgboost/python-package

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# android
export PATH=$PATH:/Users/Kazuhiro/Library/Android/sdk/platform-tools

# コマンドラインからvscodeを実行する
vscode () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

##### zsh settings #####
##セットした場合、ファイル名の補間に失敗してもエラーとせずコマンドを起動する
setopt nonomatch

## 色を使う
setopt prompt_subst
autoload -Uz colors
colors

## 補完候補一覧でファイルの種別をマーク表示
setopt list_types

## TAB で順に補完候補を切り替える
setopt auto_menu

## ディレクトリ名だけで cd
setopt auto_cd

## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

## 補完機能の強化
autoload -Uz compinit
compinit

## 補完候補を一覧表示
setopt auto_list

## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

## 補完候補を詰めて表示
setopt list_packed

# 履歴をファイルに保存する
HISTFILE=~/.zsh_history

# メモリ内の履歴の数
HISTSIZE=500

# 保存される履歴の数
SAVEHIST=500

# 履歴ファイルに時刻を記録          
setopt extended_history

# 全履歴の一覧を出力する
function history-all { history -E 1 }

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

#lsの色付け
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls='ls -aG'

zstyle ':completion:*' list-colors di=34 ln=35 ex=31
zstyle ':completion:*:kill:*' list-colors \
   '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'

# その他とりあえずいるもの
export LANG=ja_JP.UTF-8
setopt print_eight_bit   # 日本語ファイル名を表示可能にする
setopt no_flow_control   # フローコントロールを無効にする
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/apr/bin:$PATH"
export PATH="/usr/local/opt/apr-util/bin:$PATH"
export PATH="/usr/local/opt/qt5/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Kazuhiro/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/Kazuhiro/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Kazuhiro/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/Kazuhiro/google-cloud-sdk/completion.zsh.inc'; fi

# gooleapp engine
export PATH="$HOME/google-cloud-sdk/platform/google_appengine:$PATH"

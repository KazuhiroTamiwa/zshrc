#vagrantのboxファイルの場所
export VAGRANT_HOME=/Volumes/Transcend/vagrant/.vagrant.d
export PATH=$VAGRANT_HOME:$PATH

# rbenv設定
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# pyenvの設定
export PYENV_ROOT="${HOME}/.pyenv"
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"

alias remem='du -sx / &> /dev/null & sleep 25 && kill $!'

# java version change
alias java1.7='export JAVA_HOME=`/usr/libexec/java_home -v 1.7.0`'
alias java1.8='export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`'
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`

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

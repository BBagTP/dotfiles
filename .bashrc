# mjk's .bashrc

export TERM='xterm-256color'

MYHOST=$HOSTNAME
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If SSHing to a remote host, start a tmux session. If one exists, connect
# to it
#if [ -z $STY ] && [ -z $TMUX ] && [[ $- == *i* ]]; then
#  if [ "$DISPLAY" ]; then
#    # graphical session specific settings
#    :
#  fi
#  if [ `hostname -s` != $MYHOST ]; then
#    export MOZ_NO_REMOTE=1
#    if hash tmux 2> /dev/null; then
#      echo -en "\033]0;[tmux] $HOSTNAME\007"
#      if tmux has; then
#        tmux attach-session
#      else
#        tmux
#      fi
#    elif hash screen 2> /dev/null; then
#      echo -en "\033]0;[screen] $HOSTNAME\007"
#      screen -dRR
#    fi
#  fi
#fi

eval `dircolors ~/.dir_colors`
alias ls="ls -a --color=always"
alias la="ls -al --color=always"
alias gs="git status"
alias gl="git log"
alias push="git push origin"
alias pull="git pull"

export PATH=~/bin:$PATH

unset LANG

function status_color {
  if [[ $2 == 000 ]]; then echo -ne '\e[93m';
  elif [[ $1 == 0 ]]; then echo -ne '\e[32m';
  elif [[ $1 == 1 ]]; then echo -ne '\e[31m';
  elif [[ $1 == 2 || $1 == 126 || $1 == 127 || $1 == 128 || $1 == 255 ]]; then echo -ne '\e[91m';
  elif [[ $1 == 148 || $1 == 147 ]]; then echo -ne '\e[95m';
  elif [[ $1 > 128 && $1 < 144 ]]; then echo -ne '\e[35m';
  else echo -ne '\e[33m'; 
  fi;
}

if hash bc 2> /dev/null; then
  function friendly_time {
    if [[ $1 == 000 ]]; then 
      echo "      ";
    elif [[ $(echo "$b >= 0.01 && $b < 1000000" | bc -l) == 1 ]]; then 
      echo $b | sed "s/\([0-9\.]\{6\}\).*/\1/g"| sed "s/\([0-9]\{5\}\)\./0\1/g"
    else 
      printf %0.2e $b | sed -e "s/e\(-\|+\)0/\1/g" | sed -e "s/+/↑/g" | sed -e "s/-/↓/g"
    fi
  }
else
  function friendly_time {
    echo ???
  }
fi;

# COLOR VARS
COLOR_RED="\033[31m"
COLOR_GREEN="\033[32m"
COLOR_YELLOW="\033[33m"
COLOR_BLUE="\033[34m"
COLOR_MAGENTA="\033[35m"
COLOR_CYAN="\033[36m"
COLOR_WHITE="\033[37m"
COLOR_DARK_GRAY="\033[90m"
COLOR_LIGHT_RED="\033[91m"
COLOR_LIGHT_GREEN="\033[92m"
COLOR_LIGHT_YELLOW="\033[93m"
COLOR_LIGHT_BLUE="\033[94m"
COLOR_LIGHT_MAGENTA="\033[95m"
COLOR_LIGHT_CYAN="\033[96m"
COLOR_RESET="\033[0m"
COLOR_OCHRE="\033[38;5;95m"

## GIT BRANCH AND STATUS DISPLAY ##
function git_color {
  local git_repo_status="$(git status 2> /dev/null)"

  if [[ ! $git_repo_status =~ "working tree clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_repo_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_repo_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo " ($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo " ($commit)"
  fi
}

_dir_chomp () {
    local p=${1/#$HOME/\~} b s
    s=${#p}
    while [[ $p != "${p//\/}" ]]&&(($s>$2))
    do
        p=${p#/}
        [[ $p =~ \.?. ]]
        b=$b/${BASH_REMATCH[0]}
        p=${p#*/}
        ((s=${#b}+${#p}))
    done
    echo ${b/\/~/\~}${b+/}$p
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Underlined
#PS1='\[\e[4m\]\[\033[32m\][\A] \[\e[36m\]\u@\h \[\033[32m\]$(_dir_chomp "$(pwd)" 20)\[\033[33m\]\[$(git_color)\]$(git_branch)\[\033[00m\]\[\e[36m\] $ \[\033[00m\]'

# Not underlined
#PS1='\[\033[32m\][\A] \[\e[36m\]\u@\h \[\033[32m\]$(_dir_chomp "$(pwd)" 25)\[\033[33m\]\[$(git_color)\]$(git_branch)\[\033[00m\]\[\e[36m\] $ \[\033[00m\]' # Turquoise uname@host, green $cwd
#PS1='\[\033[32m\][\A] \[\033[0;33m\]\u@\h \[\033[32m\]$(_dir_chomp "$(pwd)" 25)\[\033[33m\]\[$(git_color)\]$(git_branch)\[\033[00m\]\[\e[36m\] $ \[\033[00m\]' # Yellow uname@host, green $cwd
#PS1='\[\033[32m\][\A] \[\033[0;33m\]\u@\h \[\e[36m\]$(_dir_chomp "$(pwd)" 25)\[\033[33m\]\[$(git_color)\]$(git_branch)\[\033[00m\]\[\e[36m\] $ \[\033[00m\]' # Yellow uname@host, turquoise $cwd
#PS1='\[\033[32m\][\A] \[\033[0;33m\]\u@\h \[\e[35m\]$(_dir_chomp "$(pwd)" 25)\[$(git_color)\]$(git_branch) \[\033[00m\]\[\e[36m\]$ \[\033[00m\]' # Yellow uname@host, magenta $cwd
PS1='\[\033[32m\][\A] \[\033[0;33m\]\u@\h \[\e[37m\]$(_dir_chomp "$(pwd)" 25)\[$(git_color)\]$(git_branch) \[\033[00m\]\[\e[36m\]$ \[\033[00m\]' # Yellow uname@host, light gray $cwd

function simple_prompt {
    PS1='\[\033[32m\][\A] \[\033[0;33m\]\u@\h \[\033[37m\]$(_dir_chomp "$(pwd)" 25)\[\033[00m\]\[\e[36m\] $ \[\033[00m\]' # Yellow uname@host, light gray $cwd
}
#if [[ $- == *i* ]]; then
#  # colored response codes with no-command detection
#  export DIDCMD_FILE=/dev/shm/`whoami`-shm-didcmd-$RANDOM
#  export LASTCMD_FILE=/dev/shm/`whoami`-shm-lastcmd-$RANDOM
#
#  # benchmark date
#  a=0
#  n=20
#  for ((i=0; i<$n; i++)); do 
#    b=`date +%s.%N` 
#    c=`date +%s.%N` 
#    a=`echo | awk "{ print $a + $c - $b }"`
#  done
#  export DATE_RUNTIME=`echo | awk "{ printf \"%0.9f\", $a / $n }"`
#
#  # set PS1 and traps
#  PS1='\[\033]0;\u@\h:\W\007\]'
#  PS1=$PS1'\[\e[0m$(a=$?; if [ -f  $DIDCMD_FILE ]; then b=$(echo | awk "{ printf \"%0.9f\", `date +%s.%N` - `cat $DIDCMD_FILE` - $DATE_RUNTIME }"); echo "$b\n$a" | cat $DIDCMD_FILE - >> $LASTCMD_FILE; rm -f $DIDCMD_FILE; else b=000; fi; '
#  PS1=$PS1'status_color $a $b;'
#  PS1=$PS1'echo -ne \e[4m\];'
#  PS1=$PS1'friendly_time $b;'
#  PS1=$PS1')\[\e[24m\]'
#  PS1+="\[\$(git_color)\]"        # colors git status
#  PS1+="\$(git_branch)"           # prints current branch
#  PS1=$PS1'\[\e[0m\] \[\e[4m\e[36m\]\u@\h:\W\[\e[24m\] $\[\e[0m\] \[\e[92m\]'
#  PS1=$PS1'\[\e[0m\] \[\e[4m\e[36m\]\u@\h:\w\[\e[24m\] '
#  PS1=$PS1'\[\e[0m\] \[\e[4m\e[36m\]\u@\h:\[\e[92m\]$(_dir_chomp "$(pwd)" 20)\[\e[24m\] '
#  PS1+="\[\$(git_color)\]"        # colors git status
#  PS1+="\$(git_branch) "           # prints current branch
#  PS1=$PS1'$\[\e[0m\] \[\e[92m\]'
#  trap 'a=$?; echo -ne "\e[0m"; if [[ $BASH_COMMAND != "printf \"\\033]0;"* ]]; then echo $BASH_COMMAND > $LASTCMD_FILE; date +%s.%N > $DIDCMD_FILE; elif [ -f $LASTCMD_FILE ] && [ ! -f $DIDCMD_FILE ]; then plc.py $LASTCMD_FILE $a; fi' DEBUG
#  trap 'rm -f $LASTCMD_FILE > /dev/null' EXIT
#  unset PROMPT_COMMAND
#fi

# append to the history file, don't overwrite it
shopt -s histappend
# make bash case insensitive
shopt -s nocasematch

function clippy(){
  xclip -i -selection clipboard
  echo "Clipped!"
}

function db64() {
 if [ $# = 1 ]; then
  if [ -f $1 ]; then
    openssl enc -base64 -d -in "$1"
  else
   echo -n "$1" | base64 -d
  fi
 else
   echo "Need one argument!"
   return 1
 fi
}

function test-exit-code {
  return $1
}

export MC_SKIN=~/.mc/solarized.ini

rm -f $DIDCMD_FILE $LASTCMD_FILE

# Everything after this line only works in interactive shells (doesn't affect how bash works in scripts)
[ -z "$PS1" ] && return

function cd {
    builtin cd "$@" && ls
}

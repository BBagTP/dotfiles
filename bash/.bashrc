# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM='xterm-256color'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PROJECT_HOME=$HOME/git
export VISUAL=vim
export EDITOR=vim
export BROWSER=firefox
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=~/venvs
    . /usr/local/bin/virtualenvwrapper.sh
elif [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=~/venvs
    . /usr/bin/virtualenvwrapper.sh
fi
export VAGRANT_DEFAULT_PROVIDER=libvirt

# Ensure history is written on the fly and appended each time.
# No more lost history from closing multiple windows / panes!!
shopt -s histappend
PROMPT_COMMAND='$PROMPT_COMMMAND; history -a; history -n'
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL="ignoredups"
HISTIGNORE='ls:clear:history:pwd:git status'
shopt -s cmdhist
HISTTIMEFORMAT='%F %T '

#########################################
#
#       COLOURS FOR MAN PAGES
#---------------------------------------#
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1   		# For Konsole and Gnome-terminal
#export LESS_TERMCAP_mb=$'\e[0;33m'
#export LESS_TERMCAP_md=$'\e[0;35m'
#export LESS_TERMCAP_me=$'\e[0m'
#export LESS_TERMCAP_se=$'\e[0m'
#export LESS_TERMCAP_so=$'\e[1;34;33m'
#export LESS_TERMCAP_ue=$'\e[0m'
#export LESS_TERMCAP_us=$'\e[1;31m'
# Add support to Less as well
export LESS="--RAW-CONTROL-CHARS"

unset LANG

#########################
#       ALIASES
#-----------------------#
if [[ -f ~/.alias ]]; then
	. ~/.alias
fi

# Fix for VTE issue under TILIX, if being used
# See: https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID  ] || [ $VTE_VERSION  ]; then
    source /etc/profile.d/vte.sh
fi

#########################
#       PROMPT
#-----------------------#

# Syntactic sugar for ANSI escape sequences
txtblk='\[\e[0;30m\]'           # Black - Regular
txtred='\[\e[0;31m\]'           # Red
txtgrn='\[\e[0;32m\]'           # Green
txtylw='\[\e[0;33m\]'           # Yellow
txtblu='\[\e[0;34m\]'           # Blue
txtpur='\[\e[0;35m\]'           # Purple
txtcyn='\[\e[0;36m\]'           # Cyan
txtwht='\[\e[0;37m\]'           # White
txtocr='\[\e[38;5;95m\]'        # Ochre
bldblk='\[\e[1;30m\]'           # Black - Bold
bldred='\[\e[1;31m\]'           # Red
bldgrn='\[\e[1;32m\]'           # Green
bldylw='\[\e[1;33m\]'           # Yellow
bldblu='\[\e[1;34m\]'           # Blue
bldpur='\[\e[1;35m\]'           # Purple
bldcyn='\[\e[1;36m\]'           # Cyan
bldwht='\[\e[1;37m\]'           # White
unkblk='\[\e[4;30m\]'           # Black - Underline
undred='\[\e[4;31m\]'           # Red
undgrn='\[\e[4;32m\]'           # Green
undylw='\[\e[4;33m\]'           # Yellow
undblu='\[\e[4;34m\]'           # Blue
undpur='\[\e[4;35m\]'           # Purple
undcyn='\[\e[4;36m\]'           # Cyan
undwht='\[\e[4;37m\]'           # White
bakblk='\[\e[40m\]'             # Black - Background
bakred='\[\e[41m\]'             # Red
badgrn='\[\e[42m\]'             # Green
bakylw='\[\e[43m\]'             # Yellow
bakblu='\[\e[44m\]'             # Blue
bakpur='\[\e[45m\]'             # Purple
bakcyn='\[\e[46m\]'             # Cyan
bakwht='\[\e[47m\]'             # White
txtrst='\[\e[0m\]'              # Text Reset

if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

GIT_PS1_SHOWCOLORHINTS=1

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

PS1='\[\033[32m\][\A] \[\033[0;33m\]\u@\h \[\e[37m\]$(_dir_chomp "$(pwd)" 25)\[$(git_color)\]$(git_branch) \[\033[00m\]\[\e[36m\]$ \[\033[00m\]' # Yellow uname@host, light gray $cwd

function simple_prompt {
    PS1='\[\033[32m\][\A] \[\033[0;33m\]\u@\h \[\033[37m\]$(_dir_chomp "$(pwd)" 25)\[\033[00m\]\[\e[36m\] $ \[\033[00m\]' # Yellow uname@host, light gray $cwd
}

eval `dircolors ~/.dir_colors`

export PATH=~/.local/bin:~/bin:$PATH

export MC_SKIN=~/.mc/solarized.ini


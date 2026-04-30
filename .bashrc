HISTFILESIZE=1000000000
HISTSIZE=1000000

function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.\{1,20\}\).*/(\1)/'
}

function proml {
   local       BLACK="\[\033[0;30m\]"
   local        BLUE="\[\033[0;34m\]"
   local         RED="\[\033[0;31m\]"
   local   LIGHT_RED="\[\033[1;31m\]"
   local       GREEN="\[\033[0;32m\]"
   local LIGHT_GREEN="\[\033[1;32m\]"
   local       WHITE="\[\033[1;37m\]"
   local     DEFAULT="\[\033[0;39m\]"
   case $TERM in
     xterm*)
     TITLEBAR='\[\033]0;\w\007\]'
     ;;
     *)
     TITLEBAR=""
     ;;
   esac

   ## Command Prompt ##
   local PROMPT_COLOR=$LIGHT_GREEN
   if [ ${USER} == "root" ];then
       local PROMPT_COLOR=$RED
   fi

   if [ ${USER} == "josh" ];then
       local PROMPT_COLOR=$WHITE
   fi

PS1="${TITLEBAR}\
$DEFAULT\$(date +%H:%M)\
$WHITE \W$LIGHT_GREEN\$(parse_git_branch)\
$PROMPT_COLOR\$ $WHITE"
PS2='> '
PS4='+ '
}
proml

# colors for misc things
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='mt=1;32'
export CLICOLOR=1

# Set colors
export LS_COLORS='di=1;36:fi=0:ln=4;31:pi=5:so=4;5:bd=5:cd=5:or=4;91:mi=4;92:ex=35:*.rb=1;34'

## Aliases ##
# bash commands
alias ..="cd .."
alias ...="cd .. ; cd .."
alias ....="cd .. ; cd .. ; cd .."
alias l="ls -G" # list
alias la="ls -Ga" # list all, includes dot files
alias ll="ls -Glh" # long list, excludes dot files
alias lla="ls -Glah" # long list all, includes dot files
alias g="git"
alias gs="git status"
alias gf="git df"
alias h="heroku"
alias hl="heroku logs -t"
alias hc="heroku run rails console"
alias hr="heroku run"
alias hrr="heroku run rake"
alias hm="heroku run rake db:migrate"
alias hp="heroku ps"
alias hs="heroku addons:open scheduler"
alias nr="heroku addons:open newrelic"
alias b="bundle"
alias c="rails console"
alias s="rails server -b 127.0.0.1"
alias :e="vim"
alias pg="ping google.com"
alias tcl="rlwrap tclsh"
alias y="yadm"

source "$HOME/.bashrc_local"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
cd . # Activate rvm to use .ruby_version when opening a new terminal window directly in the project directory

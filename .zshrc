# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/flower/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export TERM="xterm-256color"
# POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MODE='nerdfont-complete'
DISABLE_AUTO_TITLE="true"

zsh_internet_signal(){
  #Try to ping google DNS to see if you have internet
  local net=$(ping -c 1 8.8.8.8 | grep transmitted | awk '{print $6}' | grep 0)
  local color='%F{red}'
  local symbol="\uf127"
  if [[ ! -z "$net" ]] ;
  then color='%F{green}' ; symbol="\uf1e6" ;
  fi

  echo -n "%{$color%}$symbol" # \f1eb is wifi bars
}

zsh_custom_ip(){
 local ip=$(sudo ifconfig "eth0" | grep Bcast | awk '{print $2}' | cut -f2 -d ':')
 local color="%F{green}"
 echo -n "%{$color%}$ip"
}

pomodoro() {
	local pstatus="$(~/bin/pt ss)"
  if [[ "$pstatus" =~ "^[]" ]]; then
   local color="%F{blue}"
   echo -e "$color$pstatus"
  fi
  if [[ "$pstatus" =~ "^" ]]; then
   local color="%F{green}"
   echo -e "$color$pstatus"
  fi
  if [[ "$pstatus" =~ "^" ]]; then
   local color="%F{blue}"
   echo -e "$color$pstatus"
  fi
  if [[ "$pstatus" =~ "^" ]]; then
   local color="%F{red}"
   echo -e "$color$pstatus"
  fi
  if [[ "$pstatus" =~ "^" ]]; then
   local color="%F{yellow}"
   echo -e "$color$pstatus "
  fi
}

# Custom
POWERLEVEL9K_CUSTOM_POMODORO="pomodoro"
POWERLEVEL9K_CUSTOM_POMODORO_BACKGROUND="clear"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL_BACKGROUND="clear"
POWERLEVEL9K_CUSTOM_IP="zsh_custom_ip"
POWERLEVEL9K_CUSTOM_IP_BACKGROUND="clear"

# Time
POWERLEVEL9K_TIME_FOREGROUND='magenta'
POWERLEVEL9K_TIME_BACKGROUND='clear'
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M}"

# DIR
POWERLEVEL9K_DIR_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="blue"
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

# VCS Status
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="clear"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="red"
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

# Backgounds
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="clear"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="clear"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="clear"
POWERLEVEL9K_OS_ICON_BACKGROUND="clear"
POWERLEVEL9K_STATUS_BACKGROUND="clear"
POWERLEVEL9K_CONTEXT_BACKGROUND="clear"
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="clear"
POWERLEVEL9K_BATTERY_BACKGROUND="clear"
POWERLEVEL9K_DISK_USAGE_BACKGROUND="clear"
POWERLEVEL9K_HISTORY_BACKGROUND="clear"
POWERLEVEL9K_HOST_BACKGROUND="clear"
POWERLEVEL9K_IP_BACKGROUND="clear"
POWERLEVEL9K_VPN_BACKGROUND="clear"
POWERLEVEL9K_PUBLIC_IP_BACKGROUND="clear"
POWERLEVEL9K_LOAD_BACKGROUND="clear"
POWERLEVEL9K_RAM_BACKGROUND="clear"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="clear"
POWERLEVEL9K_SWAP_BACKGROUND="clear"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_USER_BACKGROUND="clear"
POWERLEVEL9K_SSH_BACKGROUND="clear"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='clear'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='clear'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='teal'

# Status
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_pomodoro time context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_internet_signal custom_ip os_icon)
export DEFAULT_USER="$USER"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras github osx common-aliases encode64 gulp history jira jsontools vi-mode emoji scala sbt zsh-syntax-highlighting history-substring-search zsh-syntax-highlighting git-open stime docker)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='bold'

ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,bold'

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Exports
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled"
export PATH=~/bin:$PATH
export EDITOR="vim"
export VISUAL="vim"
export TERM="xterm-256color"
export LANG=en_UK.UTF-8
export LC_CTYPE=en_UK.UTF-8
export LC_ALL=en_UK.UTF-8
export CLICOLOR=1

# Source
source /home/flower/.oh-my-zsh/oh-my-zsh.sh
source /home/flower/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh

# Aliases
function saw { ssh-add -D && ssh-add /Volumes/Lavender/Work/github }
function sad { ssh-add -D }
function gb() { printf "$(git branch | grep \* | cut -d ' ' -f2- 2> /dev/null)" }
function gp() { echo "On $(gb), pulling from origin $(gb)" && git pull origin $(gb) }
function gpu() { echo "On $(gb), pushing to origin $(gb)" && git push origin $(gb) }
function gc() { echo "On $(gb), commiting $(gb)" && git commit -e -m $(gb) }
alias gup="git fetch upstream && git checkout master && git merge upstream/master"
alias gentags="ctags -R -f ./.git/tags . && sbt gen-ctags"
alias vi="vim"
eval "$(hub alias -s zsh)"

# Key binding
zmodload zsh/terminfo
bindkey -M vicmd k history-substring-search-up
bindkey -M vicmd j history-substring-search-down

autoload -U promptinit; promptinit

# Exports
export SBT_OPTS="-Xmx1024m -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=1024m -Xss1M  -Duser.timezone=GMT"
export PATH=~/bin:$PATH
export EDITOR="vim"
export VISUAL="vim"
export TERM="xterm-256color"
export LANG=en_UK.UTF-8
export LC_CTYPE=en_UK.UTF-8
export LC_ALL=en_UK.UTF-8
export CLICOLOR=1
export WORKSPACE=/home/flower/dev/
export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

# Source
source /home/flower/.oh-my-zsh/oh-my-zsh.sh
source /home/flower/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh

# Aliases
function saw { ssh-add -D && ssh-add ~/.ssh/github }
function sad { ssh-add -D }
function gb() { printf "$(git branch | grep \* | cut -d ' ' -f2- 2> /dev/null)" }
function gp() { echo "On $(gb), pulling from origin $(gb)" && git pull origin $(gb) }
function gpu() { echo "On $(gb), pushing to origin $(gb)" && git push origin $(gb) }
function gc() { echo "On $(gb), commiting $(gb)" && git commit -e -m $(gb) }
alias gup="git fetch upstream && git checkout master && git merge upstream/master"
alias gentags="ctags -R -f ./.git/tags . && sbt gen-ctags"
alias vi="vim"
alias todo="todotxt-machine --config ~/.todotxt-machinerc"
alias config='/usr/bin/git --git-dir=/home/flower/.dotfiles/ --work-tree=/home/flower'
alias uppowerlevel='cd ~ && config subtree pull --prefix .oh-my-zsh/custom/themes/powerlevel9k powerlevel9k master'
alias upzsh='cd ~ && config subtree pull --prefix .oh-my-zsh oh-my-zsh master'

# Key binding
zmodload zsh/terminfo
bindkey -M vicmd k history-substring-search-up
bindkey -M vicmd j history-substring-search-down

autoload -U promptinit; promptinit
rm -f .zcompdump*
sudo apk upgrade
sudo pip install --upgrade pip

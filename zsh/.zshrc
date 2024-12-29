export ZSH="/Users/ramus/.oh-my-zsh"

ZSH_THEME="cobalt2"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
HISTFILE=~/.zh
SAVEHIST=100000     
HISTSIZE=100

setopt APPEND_HISTORY          # Append new history items to the history file, not overwrite
setopt SHARE_HISTORY           # Share history across all sessions
#setopt HIST_IGNORE_DUPS        # Don’t record duplicate entries
setopt HIST_IGNORE_ALL_DUPS    # Remove all old duplicated entries when saving history
setopt HIST_SAVE_NO_DUPS       # Don't write duplicates to the history file
#setopt HIST_REDUCE_BLANKS      # Remove extra blanks in commands before saving

COMPLETION_WAITING_DOTS="true"

plugins=( git tmux )

source $ZSH/oh-my-zsh.sh
# source <(fzf --zsh)

#export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="/Applications/MATLAB_R2024a.app/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/texlive/2024/bin/universal-darwin:$PATH"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


alias y="yazi"
alias v="nvim"
alias p="ping -c 5 8.8.8.8"
alias h="cd ~/"
alias timecube="ssh timecube"
alias m="cmatrix -sbu8 -C blue"
alias crimson="ssh ramus@192.168.1.114"
alias holy="ssh holymountain"
alias :q="exit" 
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias osu='nvim ~/Documents/OSU/Winter2025/' 
alias config='nvim ~/.config'
alias osuid='cat ~/Documents/LaTeX/snippets/studentid | cowsay -f stimpy | lolcat && echo "934570558" | pbcopy'
alias engr='kitten ssh ramusj@access.engr.oregonstate.edu'
alias skool='cd ~/Documents/OSU/Winter2025/'
alias pfsense='ssh admin@192.168.1.1'
# Check if SSH agent is already running, and start it silently if not
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s > /dev/null 2>&1)"
fi

fastfetch 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm#}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#function yy() {
#	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
#	yazi "$@" --cwd-file="$tmp"
#	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#		cd -- "$cwd"
#	fi
#	rm -f -- "$tmp"

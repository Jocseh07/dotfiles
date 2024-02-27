# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/completions"
plug "zap-zsh/sudo"
plug "zap-zsh/fzf"
plug "chivalryq/zsh-autojump"
plug "MichaelAquilina/zsh-you-should-use"
plug "wintermi/zsh-starship"
plug "atoftegaard-git/zsh-omz-autocomplete"

# Load and initialise completion system
autoload -Uz compinit
eval "$(starship init zsh)"

# Changing "ls" to "eza"
alias l='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ls='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

alias yoo='paru -S --needed --noconfirm'
alias noo='paru -Rns'
alias myclone='git clone '

[[ -s /home/muturi/.autojump/etc/profile.d/autojump.sh ]] && source /home/muturi/.autojump/etc/profile.d/autojump.sh

	autoload -U compinit && compinit -u

PATH=~/.console-ninja/.bin:$PATH

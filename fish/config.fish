alias vim='nvim'
alias vi='nvim'

alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
alias update-arch='sudo pacman'
alias update-mirrors='sudo reflector --verbose --score 100 --latest 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syyu'
alias clean-arch='sudo pacman -Sc && sudo pacman -c'

# Changing "ls" to "eza"
alias l='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ls='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'

alias more='git add . && git commit -m "more changes" && git push'

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

alias yoo='sudo dnf5 install'
# alias yoo='sudo pacman -S --needed --noconfirm'
alias noo='sudo dnf5 remove'
# alias noo='sudo pacman -Rns'
alias myclone='git clone '

if test -f /home/muturi/.autojump/share/autojump/autojump.fish; . /home/muturi/.autojump/share/autojump/autojump.fish; end

starship init fish | source
zoxide init fish | source

function lazyg
    if test (count $argv) -eq 0
        echo "Please provide a commit name."
        return 1
    end

    git add .
    git commit -m $argv
    git push
end

function mkdirg
    if test (count $argv) -eq 0
        echo "Please provide a directory name."
        return 1
    end

    mkdir -p $argv
    cd $argv
    ls
end

function cd
    builtin cd $argv
    ls
end

alias vim='nvim'
alias c='clear'
alias yap='sudo dnf5 update'
# alias yap='sudo pacman -Syu --noconfirm'


alias web='cd /var/www/html'
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias vi='nvim'
alias vim='nvim'
alias vis='nvim "+set si"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '


# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "


# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

function sudo
    if test "$argv[1]" = "dnf"
        set argv[1] dnf5
    end
    command sudo $argv
end

alias pm="pnpm"
# pnpm
set -gx PNPM_HOME "/home/muturi/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

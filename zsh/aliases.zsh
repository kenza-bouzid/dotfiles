alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Pretty print the path (https://github.com/jeffcole/dotfiles/blob/master/aliases)
alias path='echo $PATH | tr -s ":" "\n"'

alias pl='print -l'

# Improve less
alias less='less -MN'

# Directories size
alias diru='du -sh * | gsort -hr'
alias dirua='du -sh * .* | gsort -hr'

# Recent history
rhist() {
  fc -l -"$1"
}

# For the dotfiles repo
alias gtree='git ls-tree -r master --name-only'

# Open man pages as PDF (https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
function manpdf() {
 man -t "${1}" | open -f -a /Applications/Preview.app/
}

# Python HTTP server
alias server='python3 -m http.server'

# 3D Slicer
alias slicer='/Applications/Slicer.app/Contents/MacOS/Slicer'

# crontab (http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place)
alias crontab="VIM_CRONTAB=true crontab"

# Get public IP
alias ip="curl ifconfig.me"

# Open
alias op="open"

# Free space
alias free="conda clean --all -y && brew cleanup && pip cache purge"

alias clc="clear"

alias ffmpeg='ffmpeg -hide_banner -loglevel warning'
alias ffprobe='ffprobe -hide_banner'

# Better man pages
alias man="tldr"

alias c="code"
alias z="exec zsh"
alias cz="code ~/.zshrc"
alias vz="vim ~/.zshrc"

alias gai="gh copilot suggest"
alias gaig="gh copilot suggest -t git"
alias gais="gh copilot suggest -t shell"

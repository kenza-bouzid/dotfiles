alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Pretty print the path (https://github.com/jeffcole/dotfiles/blob/master/aliases)
alias path='echo $PATH | tr -s ":" "\n"'

alias pl='print -l'

# Improve less
alias less='less -MN'

# Directories size
alias diru='du -sh * | sort -hr'

# Recent history
rhist() {
  fc -l -"$1"
}

# mkdir and cd inside
mc() {
  mkdir "$1"
  cd "$1"
}

# For the dotfiles repo
alias gtree='git ls-tree -r master --name-only'

# (De)activate conda envs
alias act='source activate'
alias dact='source deactivate'

# Open man pages as PDF (https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
function manpdf() {
 man -t "${1}" | open -f -a /Applications/Preview.app/
}

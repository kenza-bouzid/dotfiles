# Default editor
export EDITOR="code -w"

# Custom bin
PATH=$PATH:$HOME/bin

# Local bin
PATH=$PATH:$HOME/.local/bin

# N4ITK
PATH=$PATH:/Applications/Slicer.app/Contents/lib/Slicer-4.11/cli-modules

# Export path
export PATH=$PATH

export NIFTYREG_INSTALL=/Users/fernando/git/niftyreg/install
PATH=${NIFTYREG_INSTALL}/bin:$PATH
LD_LIBRARY_PATH={NIFTYREG_INSTALL}/lib:${LD_LIBRARY_PATH}
export PATH
export LD_LIBRARY_PATH

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs battery command_execution_time time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

export PATH=/Users/fernando/Qt/5.4/clang_64/bin:$PATH

# https://superuser.com/a/610025
unsetopt correct_all
setopt correct

# https://www.soberkoder.com/better-zsh-history/
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000


LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R '

export PATH=$PATH:$HOME/git/morpheme-privat/vt/build/bin

export BRAINSTEM_ROOT_DIR="/Users/fernando/brian"

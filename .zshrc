# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/fernando/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

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


##
# Your previous /Users/fernando/.bash_profile file was backed up as /Users/fernando/.bash_profile.macports-saved_2016-03-07_at_22:37:03
##

# MacPorts Installer addition on 2016-03-07_at_22:37:03: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# added by Anaconda2 4.0.0 installer
export PATH="/Users/fernando/anaconda/bin:$PATH"

#export PYTHONPATH=/Library/Python/2.7/site-packages:$PYTHONPATH

export SPOTIPY_CLIENT_ID='6568a56648c94e5a973c65d1b4d77c22'
export SPOTIPY_CLIENT_SECRET='a280784d2a1f459e91098ea08a862b4c'
export SPOTIPY_REDIRECT_URI='https://example.com/callback'


# NiftyReg
export NIFTYREG_INSTALL=/usr/local/nifty_reg/install
PATH=${PATH}:${NIFTYREG_INSTALL}/bin
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${NIFTYREG_INSTALL}/lib
export PATH
export LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=LD_LIBRARY_PATH

# added by Anaconda2 4.3.0 installer
export PATH="/Users/fernando/anaconda/bin:$PATH"


# FSL

if [ -z "$DISPLAY" -a "X$TERM_PROGRAM" = "XApple_Terminal" ]; then
	  X11_FOLDER=/tmp/.X11-unix
	    currentUser=`id -u`
	      userX11folder=`find $X11_FOLDER -name 'X*' -user $currentUser -print 2>&1 | tail -n 1`
	        if [ -n "$userX11folder" ]; then
			    displaynumber=`basename ${userX11folder} | grep -o '[[:digit:]]\+'`
			        if [ -n "$displaynumber" ]; then
					      DISPLAY=localhost:${displaynumber}
					            export DISPLAY
						        else
								      echo "Warning: DISPLAY not configured as X11 is not running"
								          fi
									    else
										        echo "Warning: DISPLAY not configured as X11 is not running"
											  fi
										  fi

FSLDIR=/Users/fernando/fsl
. ${FSLDIR}/etc/fslconf/fsl.sh
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH


export PATH=$PATH:/Users/fernando/git/niftyreg/build/reg-apps

. /Users/fernando/git/torch/install/bin/torch-activate

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/git/morpheme-privat/vt/build/bin

source $HOME/dotfiles/myconfig

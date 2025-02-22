export HISTFILE="$HOME/.zsh_history"
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export HOMEBREW_NO_AUTO_UPDATE=1
fi

export PATH=$PATH:$HOME/.local/bin

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code -w'
fi

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
export COMPLETION_WAITING_DOTS="true"

# Uncomment the following line to enable command auto-correction.
export ENABLE_CORRECTION="false"

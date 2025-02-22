@install_mise:
    curl https://mise.run | sh

# https://brew.sh/
@install_homebrew:
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

@install_antidote:
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote

@install_tpm:
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

@install_zsh_apt:
    sudo apt install zsh
    sudo chsh -s $(which zsh)

@install_stow:
    sudo apt install stow

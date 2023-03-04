cd
ln -s /tmp
mkdir -p git

# [Download compatible version of Xcode, decompress and drag to Applications]
# [Accept Xcode license]
sudo xcodebuild -license

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# It looks like brew would have installed the CLI tools, so maybe this should have been the first step
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

brew install --cask cheatsheet
brew install --cask docker
brew install --cask dropbox
brew install --cask expressvpn
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask itk-snap
brew install --cask keka
brew install --cask mactex
brew install --cask slicer
brew install --cask spectacle
brew install --cask spotify
brew install --cask skype
brew install --cask slack
brew install --cask vlc
brew install --cask visual-studio-code
brew install --cask zotero

# poppler includes pdf2images
brew install \
  cmake \
  ffmpeg \
  htop \
  imagemagick \
  poppler \
  tldr \
  tmux \
  tree \
  wget

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should -use.git $ZSH_CUSTOM/plugins/you-should-use
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

telephone='+00 0000 000000'
email='fepegar@gmail.com'
sudo -S defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Email: ${email}\nTel: ${telephone}"

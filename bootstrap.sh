cd

# Install dotfiles
git clone https://github.com/fepegar/dotfiles.git
ln -s dotfiles/.* .
rm .git

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Apps
# brew install vim
# brew install git
# brew install wget
brew cask install atom
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install spotify
brew cask install sublime-text3
brew cask install virtualbox
brew cask install vlc

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=” “

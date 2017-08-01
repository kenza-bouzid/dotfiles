# Oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install dotfiles
cd
ln -s dotfiles/.* .
rm -rf .git


# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions


# Apps
brew install vim
brew install wget

brew cask install atom
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install spotify
brew cask install sublime-text
brew cask install virtualbox
brew cask install vlc

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

apm stars --install

wget https://repo.continuum.io/archive/Anaconda3-4.4.0-MacOSX-x86_64.sh -O ~/anaconda.sh
bash ~/anaconda.sh -b -p $HOME/anaconda
rm ~/anaconda.sh
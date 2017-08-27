#!/usr/bin/env bash

sudo -v

# Oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install dotfiles
cd
ln -s dotfiles/.* .
rm -rf .git


# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew tap caskroom/cask
# brew install brew-cask

brew tap caskroom/versions  # homebrew-versions
brew tap eddieantonio/eddieantonio  # for imgcat

# Apps
brew install cmake
brew install duti
brew install ffmpeg
brew install googler
brew install htop  # an interactive process viewer for Unix
brew install imagemagick
brew install imgcat
brew install tree
brew install vim
brew install wget

brew cask install anaconda
brew cask install atom
brew cask install dropbox
brew cask install evernote
brew cask install firefox
brew cask install gimp
brew cask install google-chrome
brew cask install iterm2
brew cask install itk-snap
brew cask install keka
brew cask install meld
brew cask install musixmatch
brew cask install openoffice
brew cask install processing
brew cask install pycharm-ce
brew cask install skype
brew cask install slack
brew cask install slicer-nightly
brew cask install spectacle
brew cask install spotify
brew cask install sublime-text
brew cask install telegram
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install vlc
brew cask install zotero

# qlplugins
brew cask install betterzipql
brew cask install qlmarkdown
brew cask install qlcolorcode
brew cask install qlimagesize
brew cask install qlstephen
brew cask install quicklook-json

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Use columns view in all Finder windows by default
# Four-letter codes for the other view modes: 'icnv', 'Nlsv', 'Flwv'
defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Stop iTunes from responding to keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

# Extensions
for ext in {aac,avi,f4v,flac,m4a,m4b,mkv,mov,mp3,mp4,mpeg,mpg,part,wav,webm}; do duti -s io.mpv "${ext}" all; done # media
for ext in {7z,bz2,gz,rar,tar,tgz,zip}; do duti -s com.aone.keka "${ext}" all; done # archives
for ext in {css,js,json,md,php,pug,py,rb,sh,txt}; do duti -s com.github.atom "${ext}" all; done # code

# Atom packages
apm stars --install

# Conda
conda install -c conda-forge nibabel -y
conda install -c simpleitk simpleitk -y
conda install -c anaconda vtk -y
conda create -n py2 python=2 anaconda -y

git config --global user.name "Fernando"
git config --global user.email fepegar@gmail.com

# https://stackoverflow.com/questions/7773181/git-keeps-prompting-me-for-password
git config --global credential.helper osxkeychain
mkdir ~/.ssh
echo "Host *
   AddKeysToAgent yes
   UseKeychain yes
   IdentityFile ~/.ssh/id_rsa" > ~/.ssh/config

# Temp dir
ln -s /tmp ~

# FSL (needs to be modified to work with zsh)
brew cask install xquartz
wget https://fsl.fmrib.ox.ac.uk/fsldownloads/fslinstaller.py --directory-prefix /tmp/
/usr/bin/python /tmp/fslinstaller.py -D ~

# zsh syntax highlighting
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

# Custom ZSH theme
ln -s ~/dotfiles/fer.zsh-theme ~/.oh-my-zsh/themes/

# Install Powerline fonts
# clone
cd ~/git
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# Relaunch
zsh

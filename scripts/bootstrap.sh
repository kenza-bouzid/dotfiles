#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# xcode command line tools
xcode-select --install

# Oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install dotfiles
cd
ln -s dotfiles/.* .
ln -s dotfiles/zsh/.* .


# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/versions  # homebrew-versions
brew tap eddieantonio/eddieantonio  # for imgcat

# Apps
brew install \
  cmake \
  duti \
  ffmpeg \
  googler \
  htop \  # an interactive process viewer for Unix
  imagemagick \
  imgcat \
  tree \
  vim \
  ack \
  wget

brew cask install \
  anaconda \
  android-file-transfer \
  atom \
  cheatsheet \
  dropbox \
  evernote \
  firefox \
  gimp \
  google-chrome \
  iterm2 \
  itk-snap \
  keka \
  meld \
  musixmatch \
  openoffice \
  processing \
  pycharm-ce \
  skype \
  slack \
  slicer-nightly \
  spectacle \
  spotify \
  sublime-text \
  telegram \
  virtualbox \
  visual-studio-code \
  vlc \
  zotero

# qlplugins
brew cask install \
  betterzipql \
  qlmarkdown \
  qlcolorcode \
  qlimagesize  \
  qlstephen \
  quicklook-json


## OS setup ##

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

# http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Check for software updates daily, not just once per week.
defaults write com.assple.SoftwareUpdate ScheduleFrequency -int 1

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Require password immediately after sleep or screen saver.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots in PNG
defaults write com.apple.screencapture type -string "png"

# Always open everything in Finder's column view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show hidden files and file extensions by default
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing file extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Allow text-selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Enable remote login
sudo systemsetup -setremotelogin on

# Add contact info to lock screen
telephone='+00 0000 000000'
email='fernando.garcia.17@ucl.ac.uk'
sudo -S defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Email: ${email}\nTel: ${telephone}"

# Install VLC subtitles extension
wget https://raw.githubusercontent.com/exebetche/vlsub/master/vlsub.lua -P /Applications/VLC.app/Contents/MacOS/share/lua/extensions

# Extensions
for ext in {aac,avi,f4v,flac,m4a,m4b,mkv,mov,mp3,mp4,mpeg,mpg,part,wav,webm}; do duti -s io.mpv "${ext}" all; done # media
for ext in {7z,bz2,gz,rar,tar,tgz,zip}; do duti -s com.aone.keka "${ext}" all; done # archives
for ext in {css,js,json,m,md,php,pug,py,rb,sh,txt}; do duti -s com.github.atom "${ext}" all; done # code

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
ln -s ~/dotfiles/zsh/fer.zsh-theme ~/.oh-my-zsh/themes/
ln -s ~/dotfiles/utils/batcharge.py ~/bin

# aliases
ln -s ~/dotfiles/zsh/aliases.zsh $ZSH_CUSTOM

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

# See if the user wants to reboot.
function reboot() {
  read -p "Do you want to reboot your computer now? (y/N)" choice
  case "$choice" in
    y | Yes | yes ) echo "Yes"; exit;; # If y | yes, reboot
    n | N | No | no) echo "No"; exit;; # If n | no, exit
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}

# Call on the function
if [[ "Yes" == $(reboot) ]]
then
  echo "Rebooting."
  sudo reboot
  exit 0
else
  exit 1
fi

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
brew tap buo/cask-upgrade
brew tap eddieantonio/eddieantonio  # for imgcat

# Apps
brew install cmake
brew install ffmpeg
brew install htop
brew install imagemagick
brew install imgcat
brew install vim
brew install wget

brew cask install anaconda
brew cask install dropbox
brew cask install evernote
brew cask install firefox
brew cask install gimp
brew cask install google-chrome
brew cask install iterm2
brew cask install keka
brew cask install meld
brew cask install microsoft-office
brew cask install openoffice
brew cask install processing
brew cask install pycharm-ce
brew cask install slack
brew cask install spotify
brew cask install sublime-text
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install vlc
brew cask install zotero

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Atom
brew cask install atom
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

# To update Slicer
cd
mkdir ~/git
cd git
git clone https://github.com/fepegar/slicer-update.git
mkdir ~/bin

# Temp dir
ln -s /tmp ~

# FSL (needs to be modified to work with zsh)
brew cask install xquartz
wget https://fsl.fmrib.ox.ac.uk/fsldownloads/fslinstaller.py --directory-prefix /tmp/
/usr/bin/python /tmp/fslinstaller.py -D ~

# zsh syntax highlighting
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' ~/.zshrc

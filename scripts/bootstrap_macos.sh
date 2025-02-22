ln -s /tmp ~
mkdir ~/git

# [Download compatible version of Xcode, decompress and drag to Applications]
# [Accept Xcode license]
sudo xcodebuild -license

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# It looks like brew would have installed the CLI tools, so maybe this should have been the first step
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

brew install --cask $(cat homebrew_casks.txt)
brew install $(cat homebrew_packages.txt)

telephone='+00 0000 000000'
email='fepegar@gmail.com'
sudo -S defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Email: ${email}\nTel: ${telephone}"

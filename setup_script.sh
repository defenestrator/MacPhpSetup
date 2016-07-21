#!/usr/bin/env bash
# pretty colors
red=$'\e[31m'
grn=$'\e[32m'
red_bold=$'\e[1;31m'
yel=$'\e[33m'
blu=$'\e[34m'
mag=$'\e[35m'
cyn=$'\e[36m'
end=$'\e[0m'

# A shell script to help folks set up their Mac PHP development environment.
# An attempt to shorten the cycle between new-hire and useful asset.
# You should manually install XCode
# before running this script.
# Cheers to all,
# Jeremy

# Interactively set values before execution
######################################################
echo -en "
        ${blu}This script will attempt to automate the installation and configuration
        of as many pre-requisites to starting your new job as a developer
        at${end} ${red}Port One Five${end} ${blu}as is presently possible.${end}

        ${red_bold}Requirements:${end}
        ${blu}Mac OS X Mavericks (10.9) or higher.${end}
        ${blu}You should manually install XCode before running this script.
        press CMD+X to abort at any time. ${end} "

echo -n "${grn}Enter your PASSWORD and press${end} [ENTER]: "
read -s PASSWORD

# Create setup.log
###############################################################################
touch ./setup.log &&
LOG="setup.log" &&

# Accept XCode License Agreement (or else!)
###############################################################################
echo ${PASSWORD} | sudo -S /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -license accept ||
echo "XCode license agreement NOT accepted. Try accepting license manually" >> ${LOG};

# Install Essential Dependencies
###############################################################################
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" brew update && brew doctor ||
    echo "Homebrew installation FAILED, exiting script, try installing Homebrew again manually, see http://brew.sh" >> ${LOG} && exit;
else
brew update && brew doctor
fi
brew install git || echo "Failed Git install is fail." >> ${LOG};
brew cask install virtualbox || echo "Failed to download VirtualBox." >> ${LOG};
brew cask install vagrant || echo "Failed to download Vagrant." >> ${LOG};
brew cask install vagrant-manager || echo "Failed to download Vagrant Manager." >> ${LOG};
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php || echo Failed to download Composer. >> ${LOG};
php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === 'fd26ce67e3b237fffd5e5544b45b0d92c41a4afe3e3f778e942e43ce6be197b9cdc7c251dcde6e2a52297ea269370680') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); }"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer || echo Failed to install Composer. >> ${LOG};
php -r "unlink('composer-setup.php');" || echo Failed to unlink Composer. >> ${LOG};
brew install node || echo "Node JS failed to install, try it manually: https://nodejs.org/en/#download" >> ${LOG};

# Configure $PATH variable
###############################################################################
export PATH=/"/usr/local/bin:/usr/local/sbin:~/bin:$PATH" >> ~/.bash_profile || echo 'failed to write new path paths to $PATH' >> ${LOG};

# Generate SSH Key
###############################################################################
ssh-keygen -t rsa -N ""
mv ./.zshrc ~/.zshrc || echo "failed to write .zshrc to your home directory" >> ${LOG} ;
mv ./.gitignore_global ~/.gitignore_global || echo "failed to write .gitignore_global to your home directory" >> ${LOG} ;
mv ./.gitconfig ~/.gitconfig || echo "failed to write .gitconfig to your home directory" >> ${LOG} ;
echo "HERE IS YOUR GLOBAL GIT CONFIG:" >> ${LOG} && git config --global --list >> ${LOG} ;
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || echo "failed to install oh-my-zsh" >> ${LOG} ;
exit

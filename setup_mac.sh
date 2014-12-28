echo 'Brewfile making...'
echo '
# Add repositories
tap homebrew/versions 
tap caskroom/cask     
tap caskroom/versions 

# Update Homebrew
update 

# Install formulae
install brew-cask 

# Install others...
install wget      
install tree
install jq
install ssh-copy-id

# gnu
install coreutils
install gnu-sed
install gawk

# vim
install autoconf
install readline
install lua
install vim

# rbenv
install openssh
install zlib 
install libyaml
install ruby-build

# Middleware
install jenkins
install postgresql

# -----------------------
# Install Cask formulae
cask install google-chrome 
cask install iterm2

# Java
cask install java
cask install java7

# IDE
cask install eclipse-ide
cask install sourcetree
install gcc gdb

# VM
cask install virtualbox
cask install vagrant
cask install boot2docker
' > Brewfile

echo '
===========================
You must exec:
---------------------------
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
$ brew update
$ brew bundle
$ echo "JAVA_HOME=$(/usr/libexec/java_home -v 1.8)" > ~/.bash_profile

$ sudo port install gcc49 gdb
$ sudo port select --set gcc mp-gcc49
$ port select --list gcc
---------------------------
note:
http://tech.basicinc.jp/Mac/2014/04/20/mac_app_engineer/
===========================
'


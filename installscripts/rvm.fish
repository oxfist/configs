#!/opt/homebrew/bin/fish

set PAPIS_PUB_KEY "409B6B1796C275462A1703113804BB82D39DC0E3"
set KUZCYNSKI_PUB_KEY "7D2BAF1CF37B13E2069D6956105BD0E739499BDB"

# 1. Register GPG keys from Michal Papis and Piotr Kuczynski
gpg --keyserver hkp://pgp.mit.edu --recv-keys $PAPIS_PUB_KEY $KUZCYNSKI_PUB_KEY

# 2. Install rvm via curl
curl -sSL https://get.rvm.io | bash

# 3. Install rvm-fish config via curl
curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish

echo "rvm default" >> ~/.config/fish/config.fish
rvm install 2.7

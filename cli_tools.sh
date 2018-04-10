# set basic permissions and groups for npm:
npm groupadd npm
usermod -a -G npm,staff $USER

# update ubuntu packages
apt-get update
apt-get upgrade

# essential packages with simple install
apt-get -y install curl postgresql libpq-dev default-jre build-essential libssl-dev phantom.js

# essential CLI tools and version control
apt-get install -y vim-athena git tree tmux openssh-server

# download the .dotfiles
cd $HOME 
git clone https://github.com/WilliamBarela/.dotfiles.git
bash .dotfiles/copy_dotfiles.sh
bash .dotfiles/first_run_dotfiles.sh

# installing nvm to make Node.js and npm easy
# for the latest nvm, go to: https://github.com/creationix/nvm
# This is a good basic tutorial for installation and usage: 
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
mkdir $HOME/tmp
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o $HOME/tmp/install_nvm.sh
# the last step is going to change your ~/.bashrc or ~/.profile, let's back them up
cp $HOME/.bashrc $HOME/.bashrc.bak
cp $HOME/.profile $HOME/.profile.bak
# ok, now we can do this
bash $HOME/tmp/install_nvm.sh
source $HOME/.bashrc

# now that you have nvm and you sourced the ~/.bashrc, run:
nvm ls-remote
echo "This is a list of Node.js versions. You have just installed nvm successfully"
echo "Please install one of the LTS verions of node"
echo "You can do this by running: nvm install 8.9.11, for example"

# now for the difficult one, RVM
# get the key from: https://rvm.io/rvm/install
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# install with a stable Ruby
\curl -sSL https://get.rvm.io | bash -s stable --ruby


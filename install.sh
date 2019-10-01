YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)
APT_CMD=$(which apt)
BREW_CMD=$(which brew)

echo "Attempting to install packages"
if [[ ! -z $YUM_CMD ]]; then
  sudo yum install zsh -y
  sudo yum install wget -y
elif [[ ! -z $APT_GET_CMD ]]; then
  sudo apt-get install zsh -y
  sudo apt-get install wget -y
elif [[ ! -z $APT_CMD ]]; then
  sudo apt install zsh -y
  sudo apt install wget -y
elif [[ ! -z $APT_BREW ]]; then
  brew install zsh
  brew install wget
else
  echo "error can't install package $PACKAGE"
  exit 1;
fi

echo "Installing oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

echo "Setting $USER's shell to zsh"
chsh -s /bin/zsh $USER

echo "Installing plugins"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-256color
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Apply the template to ~/.zshrc"
cp ./zshrc_template ~/.zshrc

echo "Source it"
source ~/.zshrc
sudo yum install zsh -y
sudo chsh -s /bin/zsh $USER
sudo yum install wget -y
sudo wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
source ~/.zshrc
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-256color
cp ./zshrc_template ~/.zshrc

# ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
# ln -sf ~/dotfiles/.bashrc ~/.bashrc
# ln -sf ~/dotfiles/.inputrc ~/.inputrc
# ln -sf ~/dotfiles/.minttyrc ~/.minttyrc
# ln -sf ~/dotfiles/.profile ~/.profile

# 再帰的にドットファイルだけln -sしたい [fix]
find . -name ".*" ! -name ".git"
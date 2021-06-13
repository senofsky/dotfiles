#!bin/bash -e

sudo apt update -y
sudo apt install exuberant-ctags -y

# Install pip modules for Neovim within the virtual environment created
source ./env/bin/activate
pip3 install neovim==0.2.6 jedi psutil setproctitle yapf
deactivate

# Install vim-plug plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


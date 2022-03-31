#!/bin/sh
mkdir -p ~/.vim/autoload ~/.vim/bundle
mkdir -p ~/.vim/colors
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/maximbaz/lightline-ale ~/.vim/bundle/lightline-ale
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline
git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/
git clone https://github.com/editorconfig/editorconfig-vim.git ~/.vim/bundle/
git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
git clone https://github.com/ryanoasis/vim-devicons ~/.vim/bundle/vim-devicons
git clone https://github.com/airblade/vim-gitgutter ~/.vim/bundle/vim-gitgutter
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/dense-analysis/ale.git ~/.vim/bundle/ale

wget https://raw.githubusercontent.com/Reewr/vim-monokai-phoenix/master/colors/monokai-phoenix.vim -O ~/.vim/colors/monokai-phoenix.vim 
yay -S aur/nerd-fonts-complete

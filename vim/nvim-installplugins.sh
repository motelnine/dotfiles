#!/bin/sh
# Create NeoVim config directories
mkdir -p ~/.config/nvim/autoload
mkdir -p ~/.config/nvim/bundle
mkdir -p ~/.config/nvim/colors

# Install vim-plug (modern alternative to pathogen for NeoVim)
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download plugins
git clone https://github.com/maximbaz/lightline-ale ~/.config/nvim/bundle/lightline-ale
git clone https://github.com/itchyny/lightline.vim ~/.config/nvim/bundle/lightline
git clone https://github.com/scrooloose/nerdtree ~/.config/nvim/bundle/nerdtree
git clone https://github.com/VundleVim/Vundle.vim ~/.config/nvim/bundle/Vundle.vim
git clone https://github.com/editorconfig/editorconfig-vim.git ~/.config/nvim/bundle/editorconfig-vim
git clone https://github.com/mxw/vim-jsx.git ~/.config/nvim/bundle/vim-jsx
git clone https://github.com/ryanoasis/vim-devicons ~/.config/nvim/bundle/vim-devicons
git clone https://github.com/airblade/vim-gitgutter ~/.config/nvim/bundle/vim-gitgutter
git clone https://github.com/fatih/vim-go.git ~/.config/nvim/bundle/vim-go
git clone https://github.com/dense-analysis/ale.git ~/.config/nvim/bundle/ale
git clone https://github.com/isRuslan/vim-es6.git ~/.config/nvim/bundle/vim-es6
#git clone https://github.com/wfxr/minimap.vim ~/.config/nvim/bundle/minimap

# Download colorscheme
wget https://raw.githubusercontent.com/Reewr/vim-monokai-phoenix/master/colors/monokai-phoenix.vim -O ~/.config/nvim/colors/monokai-phoenix.vim 

# Create initial config file with plugin setup
cat ~/.vimrc | grep -v 'pathogen' > ~/.config/nvim/init.vim << 'EOL'
" Load plugins with vim-plug
call plug#begin('~/.config/nvim/bundle')
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'VundleVim/Vundle.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
Plug 'isRuslan/vim-es6'
Plug 'mfussenegger/nvim-lint'
"Plug 'wfxr/minimap.vim'
call plug#end()

" Set colorscheme
colorscheme monokai-phoenix
EOL

cp init.vim ~/.config/nvim/init.vim

echo "NeoVim configuration has been set up. Run ':PlugInstall' the first time you open NeoVim to install plugins."

#yay -S aur/nerd-fonts-complete
#yay -S code-minimap

#!/bin/sh
# Create NeoVim config directories
mkdir -p ~/.config/nvim/autoload
mkdir -p ~/.config/nvim/bundle
mkdir -p ~/.config/nvim/colors

# Install vim-plug for NeoVim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
"Plug 'wfxr/minimap.vim'
call plug#end()

" Set colorscheme
colorscheme monokai-phoenix
EOL

cp init.vim ~/.config/nvim/init.vim

echo "NeoVim configuration has been set up. Run ':PlugInstall' the first time you open NeoVim to install plugins."

#yay -S aur/nerd-fonts-complete
#yay -S code-minimap

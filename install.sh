cwd=$(pwd)

if [ ! -e $cwd/.bash_profile ]; then
  ln -s $cwd/.bash_profile $HOME
fi

ln -s $cwd/.vim $HOME
ln -s $cwd/.vimrc $HOME

# Install pathogen vim plugin
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Create swapfiles directory
mkdir -p ~/.vim/swapfiles

# Install powerline fonts
mkdir -p ~/source/powerline
git clone https://github.com/powerline/fonts.git ~/source/powerline/fonts
~/source/powerline/fonts/install.sh

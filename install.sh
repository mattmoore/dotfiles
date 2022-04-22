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

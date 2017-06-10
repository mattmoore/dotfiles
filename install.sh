cwd=$(pwd)

if [ ! -e $cwd/.bash_profile ]; then
  ln -s $cwd/.bash_profile $HOME
fi

ln -s $cwd/.vim $HOME
ln -s $cwd/.vimrc $HOME

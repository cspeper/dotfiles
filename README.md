```
export MACHINE_NAME=<whatever you want to call your machine>
sudo scutil --set ComputerName $MACHINE_NAME
sudo scutil --set LocalHostName $MACHINE_NAME
sudo scutil --set HostName $MACHINE_NAME
sudo hostname $MACHINE_NAME

sudo gem install rouge
brew install git neovim bash-completion ctags ripgrep fzf diff-so-fancy
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/cspeper/dotfiles
ln -sf {`pwd`/dotfiles/,~/.}bash_profile
ln -s {`pwd`/dotfiles/,~/.}gitconfig
ln -s {`pwd`/dotfiles/,~/.}inputrc
mkdir -p ~/.config/nvim
ln -s {`pwd`/dotfiles/,~/.config/nvim/}init.vim
ln -s {`pwd`/dotfiles/,~/.}vimrc
ln -s {`pwd`/dotfiles/,~/.}gemrc
ln -s {`pwd`/dotfiles/,~/.}psqlrc
mkdir -p ~/.git_template/hooks
ln -s `pwd`/git_hooks/* ~/.git_template/hooks/
nvim +PluginInstall +qall
```

Install the `Menlo for Powerline` font from [here](https://github.com/abertsch/Menlo-for-Powerline/blob/master/Menlo%20for%20Powerline.ttf) (just click raw, open the downloaded file, and then click "Install Font").

Add your git user details to `~/.gitconfig.local`:

```
[user]
  email = <email>
  name = <name>
```

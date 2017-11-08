```
brew install macvim bash-completion ctags ripgrep fzf
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/BrentWheeldon/dotfiles
ln -sf {`pwd`/dotfiles/,~/.}bash_profile
ln -s {`pwd`/dotfiles/,~/.}gitconfig
ln -s {`pwd`/dotfiles/,~/.}inputrc
ln -s {`pwd`/dotfiles/,~/.}vimrc
ln -s {`pwd`/dotfiles/,~/.}gemrc
ln -s {`pwd`/dotfiles/,~/.}psqlrc
mkdir -p ~/.git_template/hooks
ln -s `pwd`/git_hooks/* ~/.git_template/hooks/
vim -c "PluginInstall" -c "qa"
```

Add your git user details to `~/.gitconfig.local`:

```
[user]
  email = <email>
  name = <name>
```

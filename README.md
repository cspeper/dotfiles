```
$ brew install ack macvim
$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
$ git clone https://github.com/BrentWheeldon/dotfiles
$ ln -sf {`pwd`/dotfiles/,~/.}bash_profile
$ ln -s {`pwd`/dotfiles/,~/.}ackrc
$ ln -s {`pwd`/dotfiles/,~/.}gitconfig
$ ln -s {`pwd`/dotfiles/,~/.}inputrc
$ ln -s {`pwd`/dotfiles/,~/.}vimrc
$ ln -s {`pwd`/dotfiles/,~/.}gemrc
$ ln -s {`pwd`/dotfiles/,~/.}psqlrc
$ vim -c "BundleInstall" -c "qa"
$ cd ~/.vim/bundle/command-t/ruby/command-t
$ make clean
$ /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/bin/ruby extconf.rb
$ make
```

Install the `Menlo for Powerline` font from [here](https://github.com/abertsch/Menlo-for-Powerline/blob/master/Menlo%20for%20Powerline.ttf) (just click raw, open the downloaded file, and then click "Install Font").

Add your git user details to `~/.gitconfig.local`:

```
[user]
  email = <email>
  name = <name>
```

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
export -f parse_git_branch

run_loop() {
  trap "exit" INT
  for i in {1..10}; do $1; done
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source ~/.profile

export CLICOLOR=1
export PS1="\[\e[00;32m\]\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[01;36m\]\W\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;33m\]\$(parse_git_branch)\[\e[0m\]\[\e[00;37m\]\$ \[\e[0m\]"
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=mvim
export HISTCONTROL=ignoredups
export HISTFILESIZE=5000

alias editaliases="vim ~/.bash_profile && reload"
alias fixdb="rake db:drop db:create db:migrate db:seed && rake db:sample_data"
alias gitprune="git remote prune origin && git prune"
alias got=git
alias gpr="git fetch && git rebase origin/master"
alias gtx=gitx
alias gut=git
alias heroky=heroku
alias ht="cd ~/workspace/hightower"
alias rye="cd ~/RailsProjects/RyeCatcher"
alias qtb="cd ~/RailsProjects/QTalkblocks"
alias ll="ls -al"
alias loopy=run_loop
alias reload=". ~/.bash_profile"
alias shutupvim="rm /var/tmp/*.swp"
alias z="zeus rspec"
alias zake="zeus rake"
alias zerver="zeus s"
alias zonsole="zeus c"
alias zspec="zeus rspec"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/.profile ]; then
  . ~/.profile
fi

if [ -f ~/.bash_profile.local ]; then
  . ~/.bash_profile.local
fi

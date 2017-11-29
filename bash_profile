parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
source ~/.profile
export -f parse_git_branch

loopy() {
  for i in {1..10}; do $1; done
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source ~/.profile

export CLICOLOR=1
export EDITOR=nvim
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS='--preview="rougify -t monokai.sublime {}"'
export GPG_TTY=$(tty)
export HISTCONTROL=ignoredups
export HISTFILESIZE=5000
export LSCOLORS=ExFxCxDxBxegedabagacad
export PS1="\[\e[00;32m\]\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[01;36m\]\W\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;33m\]\$(parse_git_branch)\[\e[0m\]\[\e[00;37m\]\$ \[\e[0m\]"
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

alias gitprune="git remote prune origin && git prune"
alias gogogo="gpr && bundle && rake db:migrate db:test:prepare"
alias got=git
alias gpr="git fetch && git rebase origin/master"
alias gtx=gitx
alias gut=git
alias heroky=heroku
alias ll="ls -alh"
alias ws="cd ~/workspace"
alias hpw="cd ~/workspace/homepolish/web"
alias hpm="cd ~/workspace/homepolish/multipass-ns"
alias sw="cd ~/workspace/signal/web"
alias sa="cd ~/workspace/signal/api"
alias nsdeploy="yarn run build && NSPW=correct-horse-battery-staple yarn run deploy"
alias ll="ls -al"
alias ll="ls -alh"
alias loopy=run_loop
alias reload=". ~/.bash_profile"
alias server="foreman start -f Procfile.dev"
alias shutupvim="rm /var/tmp/*.swp"
alias wp="./node_modules/.bin/webpack-dev-server --config config/webpack/development.config.js --content-base frontend --host 0.0.0.0"
alias z="zeus rspec"
alias zake="zeus rake"
alias zerver="zeus s"
alias zonsole="zeus c"
alias zspec="zeus rspec"

if [ -f ~/.profile ]; then
  . ~/.profile
fi

if [ -f ~/.bash_profile.local ]; then
  . ~/.bash_profile.local
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=/usr/local/heroku/bin:$PATH

set_color() {
   local R=$1
   local G=$2
   local B=$3
   /usr/bin/osascript <<EOF
tell application "iTerm"
   tell current session of current window
      set background color to {$(($R*65535/255)), $(($G*65535/255)), $(($B*65535/255))}
   end tell
end tell
EOF
}

reset_colors() {
  set_color 0 0 0
}

heroku(){
  if [[ "$@" =~ 'hightower-prod' ]]; then
    set_color 64 0 0
  fi
  if [[ "$@" =~ '(integrations-sandbox|hightower-training)' ]]; then
    set_color 64 64 0
  fi

  /usr/local/heroku/bin/heroku "$@"
  reset_colors
}
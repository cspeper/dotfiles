parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
source ~/.profile
export -f parse_git_branch

loopy() {
  for i in {1..10}; do $1; done
}

gsr() {
  local current="$(git symbolic-ref --short -q HEAD)"
  git branch --set-upstream-to=origin/"$current" "$current"
}

grb() {
  local current="$(git symbolic-ref --short -q HEAD)"
  git co master
  git pull
  git co "$current"
  git rebase master
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

shopt -s histappend
PROMPT_COMMAND="history -a"

export ERL_AFLAGS="-kernel shell_history enabled"
export CLICOLOR=1
export EDITOR=nvim
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS='--preview="rougify -t monokai.sublime {}"'
export GPG_TTY=$(tty)
export HISTCONTROL=ignoredups
export HISTFILESIZE=50000
export HISTSIZE=50000
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export LSCOLORS=ExFxCxDxBxegedabagacad
export PS1="\[\e[00;32m\]\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[01;36m\]\W\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;33m\]\$(parse_git_branch)\[\e[0m\]\[\e[00;37m\]\$ \[\e[0m\]"
export NVM_DIR=~/.nvm

alias gitprune="git remote prune origin && git prune"
alias dails="docker/run spring rails"
alias dixstructure="git reset db/structure.sql && dails \"db:migrate db:test:prepare\" && git add db/structure.sql && git rebase --continue"
alias dspec="docker/run spring rspec"
alias dododo="gpr && docker/run \"bundle && spring stop && spring rails db:migrate db:test:prepare\""
alias fixit="git add . -A && git commit --amend -CHEAD"
alias fixstructure="git reset db/structure.sql && sails db:migrate db:test:prepare && git add db/structure.sql && git rebase --continue"
alias gogogo="gpr && bundle && spring stop && sails db:migrate db:test:prepare"
alias editaliases="vim ~/.bash_profile && reload"
alias fixdb="rake db:fix"
alias gitprune="git remote prune origin && git prune"
alias gitdelete="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"
alias got=git
alias gpr="git fetch && git rebase origin/master"
alias gtx=gitx
alias gut=git
alias gp="git push origin head --no-verify -f"
alias gpg="git push gigalixir master -f"
alias grc="gigalixir remote_console"
alias source_env="set -a && source .env && set +a"
alias ll="ls -alh"
alias reload=". ~/.bash_profile"
alias server="foreman start -f Procfile.dev"
alias shutupvim="rm /var/tmp/*.swp"
alias sails="spring rails"
alias sspec="spring rspec"
alias wipit="git add . && git commit --no-verify -m wip"
alias ws="cd ~/workspace"
alias df="cd ~/workspace/dotfiles"
alias ll="ls -al"
alias ll="ls -alh"
alias reload=". ~/.bash_profile"
alias server="foreman start -f Procfile.dev"
alias shutupvim="rm /var/tmp/*.swp"
alias wp="./node_modules/.bin/webpack-dev-server --config config/webpack/development.config.js --content-base frontend --host 0.0.0.0"
alias z="zeus rspec"
alias zake="zeus rake"
alias zerver="zeus s"
alias zonsole="zeus c"
alias zspec="zeus rspec"
alias ctags="`brew --prefix`/bin/ctags"

if [ -f ~/.profile ]; then
  . ~/.profile
fi

if [ -f ~/.bash_profile.local ]; then
  . ~/.bash_profile.local
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export GPG_TTY=$(tty)

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
PATH=$PATH:/usr/local/sbin
cd() {      
  builtin cd "$1"
  if [ -f ./.env ]; then
    echo "Sourcing .env"
    set -a && source .env && set +a
  fi
}

removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

armaggedon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

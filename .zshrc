# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/levismith/.oh-my-zsh
# theme 
ZSH_THEME="muse"
DISABLE_AUTO_UPDATE=true


plugins=(git brew bundler dircycle lol osx rails web-search dirpersist)

# User Configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.bin/"


source $ZSH/oh-my-zsh.sh


# files Alias
alias pgra="cd desktop/programming/rails"
alias pg="cd desktop/programming"
alias pgr="cd desktop/programming/ruby"
alias pgrc="cd desktop/programming/ruby/challenges"
alias pgh="cd desktop/programming/html"
alias c="clear"
alias ~="cd ~"
alias pgrl="cd desktop/programming/rails/lifependants"
alias ..="cd .."
alias pgjs="cd desktop/programming/javascript"

mkcd () {
  case "$1" in
    */..|*/../) cd -- "$1";; # that doesn't make any sense unless the directory already exists
    /*/../*) (cd "${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd -- "$1";;
    /*) mkdir -p "$1" && cd "$1";;
    */../*) (cd "./${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd "./$1";;
    ../*) (cd .. && mkdir -p "${1#.}") && cd "$1";;
    *) mkdir -p "./$1" && cd "./$1";;
  esac
}

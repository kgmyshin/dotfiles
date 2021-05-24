## required Android Studio
##   - and required command line launcher setting
## required peco
## required ghq
if [ "$(uname)" = 'Darwin' ]; then
  alias asg='studio $(ghq list --full-path | peco)'
  alias codeg='code $(ghq list --full-path | peco)'
  alias cdg='cd $(ghq list --full-path | peco)'
elif [ "$(uname)" = 'Linux' ]; then
  
  alias cdg='cd $(ghq list --full-path | peco)'
  alias codeg='code $(ghq list --full-path | peco)'

  if [[ "$(uname -r)" = *microsoft* ]]; then
    alias asg='studio $(ghq list --full-path | peco | xargs wslpath -w )'
  else
  	alias asg='studio $(ghq list --full-path | peco)'
  fi
fi
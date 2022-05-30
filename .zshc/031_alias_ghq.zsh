## required Android Studio
##   - and required command line launcher setting
## required peco
## required ghq

alias hubg='hub browse $(ghq list -e | peco | sed -e "s/github.com\///")'

if is_osx ; then
  alias codeg='code $(ghq list --full-path | peco)'
  alias cdg='cd $(ghq list --full-path | peco)'
  alias openg='open $(ghq list --full-path | peco)'
elif is_linux ; then;
  alias codeg='code $(ghq list --full-path | peco)'
  alias cdg='cd $(ghq list --full-path | peco)'
elif is_win ; then;
  alias codeg='code "$(ghq list --full-path | peco | xargs wslpath -w)"'
  alias cdg='cd $(ghq list --full-path | peco)'
  alias openg='open $(ghq list --full-path | peco | xargs wslpath -w )'
fi
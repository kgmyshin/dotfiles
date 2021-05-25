## required Android Studio
##   - and required command line launcher setting
## required peco
## required ghq

if is_osx || is_linux ; then
  alias asg='studio $(ghq list --full-path | peco)'
  alias codeg='code $(ghq list --full-path | peco)'
  alias cdg='cd $(ghq list --full-path | peco)'
elif is_win ; then;
  alias asg='studio $(ghq list --full-path | peco | xargs wslpath -w)'
  alias codeg='code "$(ghq list --full-path | peco | xargs wslpath -w)"'
  alias cdg='cd $(ghq list --full-path | peco)'
fi
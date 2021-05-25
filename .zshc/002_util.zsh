alias is_osx='[ "$(uname)" = "Darwin" ]'
alias is_win='[ "$(uname)" = "Linux" ] && [[ "$(uname -r)" = *microsoft* ]]'
alias is_linux='[ "$(uname)" = "Linux" ] && ! [[ "$(uname -r)" = *microsoft* ]]'
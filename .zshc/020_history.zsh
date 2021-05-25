## required peco

function peco-history-selection() {
    if is_osx ; then
        BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    else
        BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    fi
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
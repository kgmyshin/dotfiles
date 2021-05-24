## required peco

if ! (type "peco" > /dev/null 2>&1) ; then
    echo "pecoをインストールする必要があります"
fi

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
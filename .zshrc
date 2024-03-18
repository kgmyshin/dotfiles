#!/usr/bin/zsh

ZSHC="${HOME}/.zshc"
if [ -d $ZSHC -a -r $ZSHC -a \
     -x $ZSHC ]; then
    for i in $ZSHC/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

[ -f ~/.zshrc.local ] && . ~/.zshrc.local
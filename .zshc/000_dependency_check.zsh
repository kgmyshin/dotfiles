if ! (type "peco" > /dev/null 2>&1) ; then
    echo "pecoをインストールする必要があります"
fi

if ! (type "ghq" > /dev/null 2>&1) ; then
    echo "ghqをインストールする必要があります"
fi

if ! (type "hub" > /dev/null 2>&1) ; then
    echo "hubをインストールする必要があります"
fi

if ! (type "studio" > /dev/null 2>&1) ; then
    echo "Android Studioをインストールする必要があります。" # launcherの設定も必要な旨を書く
fi

if ! (type "exa" > /dev/null 2>&1) ; then
    echo "exaをインストールする必要があります。"
fi

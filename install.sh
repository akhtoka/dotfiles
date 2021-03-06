#!/bin/bash

deploy() {
    #...
    GITHUB_URL=https://github.com/tsumayoji/dotfiles.git
    DOTPATH=~/.dotfiles

    # git が使えるなら git
    if type "git" > /dev/null 2>&1; then
        git clone --recursive "$GITHUB_URL" "$DOTPATH"

    # 使えない場合は curl か wget を使用する
    elif type "curl" > /dev/null 2>&1 || type "wget" > /dev/null 2>&1; then
        tarball="https://github.com/tsumayoji/dotfiles/archive/master.tar.gz"

        # どっちかでダウンロードして，tar に流す
        if type "curl" > /dev/null 2>&1; then
            curl -L "$tarball"

        elif type "wget" > /dev/null 2>&1; then
            wget -O - "$tarball"

        fi | tar xv -

        # 解凍したら，DOTPATH に置く
        mv -f dotfiles-master "$DOTPATH"

    else
        echo "curl or wget required"
        exit 1
    fi

    cd ~/.dotfiles
    if [ $? -ne 0 ]; then
        echo "not found: $DOTPATH"
        exit 1
    fi

    # 移動できたらリンクを実行する
    CURRENT_DIR=`pwd`
    for f in .??*
    do
        [ "$f" = ".git" ] && continue
        [ "$f" = ".DS_Store" ] && continue
        [ "$f" = ".gitignore" ] && continue
        [ "$f" = ".gitkeep" ] && continue
        
        # chmod +rwx "$f"
        ln -s $CURRENT_DIR/$f $HOME/$f
    done
    echo "deploy"
}

initalize() {
    #...
    echo "init"
}

if [ "$1" = "deploy" -o "$1" = "d" ]; then
    deploy
elif [ "$1" = "init" -o "$1" = "i" ]; then
    initalize
fi

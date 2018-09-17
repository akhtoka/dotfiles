#!/bin/bash

deploy() {
    #...
    DOTPATH=~/.dotfiles

    # git が使えるなら git
    if has "git"; then
        git clone --recursive "$GITHUB_URL" "$DOTPATH"

    # 使えない場合は curl か wget を使用する
    elif has "curl" || has "wget"; then
        tarball="https://github.com/tsumayoji/dotfiles/archive/master.tar.gz"

        # どっちかでダウンロードして，tar に流す
        if has "curl"; then
            curl -L "$tarball"

        elif has "wget"; then
            wget -O - "$tarball"

        fi | tar xv -

        # 解凍したら，DOTPATH に置く
        mv -f dotfiles-master "$DOTPATH"

    else
        die "curl or wget required"
    fi

    cd ~/.dotfiles
    if [ $? -ne 0 ]; then
        die "not found: $DOTPATH"
    fi

    # 移動できたらリンクを実行する
    for f in .??*
    do
        [ "$f" = ".git" ] && continue
        [ "$f" = ".DS_Store" ] && continue

        ln -snfv "$f" "$HOME"/"$f"
        ln -snfv ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim
    done
    echo "deploy"
}

initalize() {
    #...
    echo "init"
}

if [ "$1" = "deploy" -o "$1" = "d" ]; then
    deploy
elif [ "$1" = "init" -o "$1" = "i" ; then
    initalize
fi

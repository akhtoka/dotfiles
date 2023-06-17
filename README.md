# dotfiles
mac用の環境構築ファイルたち

```setup.sh
# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install direnv
# see also: https://qiita.com/kompiro/items/5fc46089247a56243a62
brew install direnv

# fish
brew install fish
# set fish default
# see also: https://tech.zeals.co.jp/entry/2019/04/11/150848
sudo vi /etc/shells
# write `/usr/local/bin/fish` on last line
chsh -s /usr/local/bin/fish

# install fisher
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

# python
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
pyenv install 3.8.8

# neovim
# see also: https://castleobj.com/neovim-install/
# see also: https://dev.classmethod.jp/articles/fish_neovim_python_synergy/
brew install neovim
pyenv global 3.8.8
pyenv virtualenv 3.8.8 neovim3 
source ~/.pyenv/versions/neovim3/bin/activate.fish
pip install pynvim
pip install flake8

# install dein.vim
# see also: https://github.com/Shougo/dein.vim/blob/master/README.md#quick-start
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein

# jupyter
pip install --upgrade pip setuptools
pip install numpy scipy matplotlib Pillow ipython[all]
pip install jupyterlab
pip install voila

# setup jupyter
# see also: https://qiita.com/canonrock16/items/d166c93087a4aafd2db4
brew install node
pip install lckr-jupyterlab-variableinspector
pip install jupyterlab_vim
pip install --upgrade jupyterlab-git

# ml packeges
pip install tensorflow tensorboard keras jupyter-tensorboard
# ref: https://pytorch.org/
pip install torch torchvision torchaudio

# others
brew install tmux

# set fish prompt
# ref: https://qiita.com/mom0tomo/items/b593c0e98c1eea70a114
```

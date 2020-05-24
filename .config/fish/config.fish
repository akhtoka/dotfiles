function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end
balias g git


# neovim config dir
set -gx XDG_CONFIG_HOME "$HOME/.config"

# pyenv settings
eval (pyenv init - | source)
eval (pyenv virtualenv-init - | source)
set -x PYENV_ROOT (pyenv root)

# User specific environment and startup programs
set -x PATH $HOME/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $PATH /usr/local/bin
set -x NODEBREW_ROOT /usr/local/var/nodebrew

# basebank PATH
set -x PATH $HOME/work/basebank/bankdev-docker/bin $PATH

# pipenv
set -x PIPENV_VENV_IN_PROJECT 1

# direnv
set -x EDITOR nvim
eval (direnv hook fish)

# set go path
set -x GOPATH $HOME/go $GOPATH
set -x PATH $GOPATH/bin $PATH

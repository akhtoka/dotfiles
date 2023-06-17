function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end
balias g git

# neovim config dir
set -gx XDG_CONFIG_HOME "$HOME/.config"

# pyenv settings
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH:
set -x PATH $PYENV_ROOT/shims $PATH
eval (pyenv init - | source)
eval (pyenv virtualenv-init - | source)

# User specific environment and startup programs
set -x PATH $HOME/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $PATH /usr/local/bin
set -x PATH /usr/local/Cellar/awscli/2.0.30/bin $PATH
set -x PATH $HOME/.config/composer/vendor/bin $PATH

set -x PATH /usr/local/opt/php@7.3/bin $PATH
set -x PATH /usr/local/opt/php@7.3/sbin $PATH



# baseinc PATH
set -x PATH $HOME/src/github.com/baseinc/basedev-docker/bin $PATH

# basebank PATH
set -x PATH $HOME/src/github.com/basebank/bankdev-docker/bin $PATH

# pipenv
set -x PIPENV_VENV_IN_PROJECT 1

# direnv
set -x EDITOR nvim
eval (direnv hook fish)

# set go path
set -x GOPATH $HOME/go $GOPATH
set -x PATH $GOPATH/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/akihitooka/google-cloud-sdk/path.fish.inc' ]; . '/Users/akihitooka/google-cloud-sdk/path.fish.inc'; end

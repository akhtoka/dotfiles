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

source ~/.config/fish/aliases.fish

# https://syapse.atlassian.net/wiki/spaces/SE/pages/10453004/How+to+install+RabbitMQ+On+Mac
# RabbitMQ server scripts are installed into /usr/local/sbin
# Here we modify the $PATH using the `fish` universal variables
set -U fish_user_paths /usr/local/sbin $PATH

# To enable our vi-like keybindings, :remap <ESC> 'kj'
set fish_key_bindings fish_user_key_bindings

# If we make modifications to path, load `virtualfish` after
eval (python -m virtualfish projects auto_activation compat_aliases)

# Custom prompt to display current virtualenv
if set -q VIRTUAL_ENV
  echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end

# set --export VIRTUAL_ENV_DISABLE_PROMPT 1

# This is a function utilizing the events from `virtualfish`
function postactivate --on-event virtualenv_did_activate
  echo "🐍  Postactivate via virtualfish"
  set postactivate "$VIRTUAL_ENV/bin/postactivate"
  test -e $postactivate; and source $postactivate
end

# Do I still need this?
set PROJECT_HOME $HOME/work
set WORKON_HOME $HOME/work
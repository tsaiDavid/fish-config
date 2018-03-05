source ~/.config/fish/aliases.fish

set fish_key_bindings fish_user_key_bindings

# If we make modifications to path, load `virtualfish` after
eval (python -m virtualfish projects auto_activation compat_aliases)

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

set PROJECT_HOME $HOME/work
set WORKON_HOME $HOME/work
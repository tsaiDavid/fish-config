alias ea 'vim ~/.config/fish/aliases.fish'
alias ef 'vim ~/.config/fish/config.fish'
alias ev 'vim ~/.vimrc'

# iTermocil
function showme
  for option in $argv
    switch "$option"
      case -s --syapse
        command itermocil sy_main
      case \*
        printf "Error: Unknown option %s\n" $option
        printf "Consider trying -s [--syapse]"
    end
  end
end

# Git aliases inspired by `oh-my-zsh`
function _current_branch
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

alias ga 'git add'
alias gb 'git branch'
alias gc 'git commit -v'
alias gc! 'git commit -v --amend'
alias gcmsg 'git commit -v'
alias gco 'git checkout'
alias gcp 'git cherry-pick'
alias gcpa 'git cherry-pick --abort'
alias gst 'git status'
alias ggsup 'git branch --set-upstream-to=origin/(_current_branch)'
alias gwch 'git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip 'git add -A; git rm (git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'
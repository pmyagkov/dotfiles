function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

PROMPT='%{$FG[103]%}%n%{$reset_color%}@%{$FG[103]%}$(box_name)%{$reset_color%} in %{$FG[117]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %{$FG[087]%}⌘ %{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$FG[069]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[160]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[160]%}?"


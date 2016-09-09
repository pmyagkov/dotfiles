# print git status for cwd (if we're in git repo)
function __prompt_git_status {
    local cur_dir git_status git_vars
    local git_branch git_staged git_conflicts git_changed git_untracked git_ahead git_behind

    # git prompt elements colors
    local c_branch='magenta'
    local c_conflicts='red'
    local c_staged='green'
    local c_changed='blue'
    local c_untracked='red'
    local c_ahead='yellow'
    local c_behind='magenta'


    local cur_dir=$PWD
    while [[ ! -d "$cur_dir/.git" ]] && [[ ! "$cur_dir" == "/" ]] && [[ ! "$cur_dir" == "~" ]] && [[ ! "$cur_dir" == "" ]]; do cur_dir=${cur_dir%/*}; done
    if [[ -d "$cur_dir/.git" ]]; then
        # 'git repo for dotfiles' fix: show git status only in home dir and other git repos
        if [[ "$cur_dir" != "${HOME}" ]] || [[ "${PWD}" == "${HOME}" ]]; then
            git_status=`python ${ZDOTS_HOME}/prompt-git-status.py`
            git_vars=("${(@f)git_status}")

            if [ -n "$git_vars" ]; then
                git_branch=$git_vars[1]
                git_staged=$git_vars[3]
                git_changed=$git_vars[4]
                git_untracked=$git_vars[5]
                git_conflicts=$git_vars[6]
                git_ahead=$git_vars[7]
                git_behind=$git_vars[8]

                git_status="%F{$c_branch}$git_branch%f"
                if [[ "$git_ahead" -ne "0" ]] || [[ "$git_behind" -ne "0" ]]; then
                    git_status="$git_status"
                    [ "$git_behind" -ne "0" ] && git_status="$git_status %F{$c_behind}↓$git_behind%f"
                    [ "$git_ahead" -ne "0" ]  && git_status="$git_status %F{$c_ahead}↑$git_ahead%f"
                fi
                if [[ "$git_conflicts" -eq "0" ]] && [ "$git_staged" -eq "0" ] && [ "$git_changed" -eq "0" ] && [ "$git_untracked" -eq "0" ]; then
                    git_status="$git_status"
                else
                    [ "$git_conflicts" -ne "0" ]  && git_status="$git_status %F{$c_conflicts}✖$git_conflicts%f"
                    [ "$git_staged" -ne "0" ]     && git_status="$git_status %F{$c_staged}+$git_staged%f"
                    [ "$git_changed" -ne "0" ]    && git_status="$git_status %F{$c_changed}*$git_changed%f"
                    [ "$git_untracked" -ne "0" ]  && git_status="$git_status %F{$c_untracked}…$git_untracked%f"
                fi
                echo -ne $git_status
            fi
        fi
    fi
}


function __build_prompt {
    local prompt_git

    local c_default='black'
    local c_hostname=60
    local c_username=60
    local c_dir='blue'
    local c_arrow='blue'

    # reset colors
    echo -n "%f%b%k%F{$c_default}"

    # username and hostname
    # current working directory
    echo -n "%F{$c_hostname}%n%F{$c_default}@%F{$c_username}%m%F{$c_default} in %F{$c_dir}%~%f "

    # git status
    prompt_git=$(__prompt_git_status)
    [ ! -z "$prompt_git" ] && echo -n "%F{$c_default}on $prompt_git %f"

    # command arrow
    echo -n "%E%f%k\n%F{$c_arrow}⌘ %F{$c_default%}%f "
}



function __build_rprompt {
    local c_default='white'
	# color of right prompt values
    local c_value='cyan'

	# vitrualenv
    [ ! -z "$VIRTUAL_ENV" ] && echo -n "%F{$c_default}env:%f %F{c_value}${VIRTUAL_ENV#$WORKON_HOME}%f"

    # elapsed time
    [ ! -z "$ELAPSED_TIME" ] && echo -n "%F{$c_default}elapsed:%f %F{c_value}$ELAPSED_TIME%f"
    ELAPSED_TIME=

    # exit status
    [ ! -z "$EXIT_CODE" ] && echo -n "%F{$c_default}exit code:%f %F{c_value}$EXIT_CODE%f"
    EXIT_CODE=

}

setopt prompt_subst

export PROMPT=$'$(__build_prompt)'
export RPROMPT=$'$(__build_rprompt)'


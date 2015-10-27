# Source this file from your ~/.bashrc to enable Bash completions for gitsick.

_gitsick_complete() {
    # first argument is a gitsick repo otherwise delegate to git's contrib completion
    if test "$COMP_CWORD" = 1
    then
        GITSICK_DIR="$(git config --global gitsick.dir || true)"
        if [ -z "$GITSICK_DIR" ]; then
            GITSICK_DIR="$HOME/.gitsick"
        fi
        NAMES="$(command ls "$GITSICK_DIR" | command sed 's/\.git$//')"
        COMPREPLY=( $(compgen -W "$NAMES" -- ${COMP_WORDS[COMP_CWORD]}) )
        COMPREPLY="$COMPREPLY "
    else
        ((COMP_CWORD--))
        COMP_WORDS=("${COMP_WORDS[@]:1}")
        _git
    fi
}

complete -o bashdefault -o default -o nospace -F _gitsick_complete gitsick 2>/dev/null \
    || complete -o default -o nospace -F _gitsick_complete gitsick

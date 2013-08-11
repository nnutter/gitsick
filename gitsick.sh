_gitsick_complete() {
    local CUR=${COMP_WORDS[COMP_CWORD]}
    case "$COMP_CWORD" in
        1) # names
            GITSICK_DIR="$(git config --global gitsick.dir || true)"
            if [ -z "$GITSICK_DIR" ]; then
                GITSICK_DIR="$HOME/.gitsick"
            fi
            NAMES="$(\ls "$GITSICK_DIR" | sed 's/\.git$//')"
            COMPREPLY=( $(compgen -W "$NAMES" -- $CUR) )
            ;;
        2) # commands
            COMMANDS="add checkout clone init reset rm"
            COMPREPLY=( $(compgen -W "$COMMANDS" -- $CUR) )
            ;;
        *)
    esac
}
complete -o bashdefault -o default -F _gitsick_complete gitsick

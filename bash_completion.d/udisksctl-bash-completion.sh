
# Check for bash
[ -z "$BASH_VERSION" ] && return

####################################################################################################


__udisksctl() {
    local IFS=$'\n'
    local cur=`_get_cword :`

    local suggestions=$(udisksctl complete "${COMP_LINE}" ${COMP_POINT})
    if [ "$suggestions" = "@FILES@" ] ; then
        _filedir
    else
        COMPREPLY=($(compgen -W "$suggestions" -- "$cur"))
    fi

    # Remove colon-word prefix from COMPREPLY items
    case "$cur" in
        *:*)
            case "$COMP_WORDBREAKS" in
                *:*)
                    local colon_word=${cur%${cur##*:}}
                    local i=${#COMPREPLY[*]}
                    while [ $((--i)) -ge 0 ]; do
                        COMPREPLY[$i]=${COMPREPLY[$i]#"$colon_word"}
                    done
                    ;;
            esac
            ;;
    esac
}

####################################################################################################

complete -o nospace -F __udisksctl udisksctl

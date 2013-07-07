alias ranger='PYTHONOPTIMIZE=2 EDITOR=vim TERMCMD=xfce4-terminal ranger'
[ -n "$RANGER_LEVEL" ] && PS1=[R]"$PS1"
function ranger-cd {
    tempfile='/tmp/chosendir'
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        builtin cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

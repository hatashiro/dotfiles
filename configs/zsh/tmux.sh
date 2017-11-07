# tmux reload alias
alias tmux-reload='tmux source-file ~/.tmux.conf'

# tm
tm() {
    tmux-status
    if (( $? == 0 )); then
        tmux
    fi
}

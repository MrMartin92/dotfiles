if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    pfetch
end

alias config="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
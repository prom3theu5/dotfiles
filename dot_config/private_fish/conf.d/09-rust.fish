if test -d $HOME/.cargo/bin
    set -gx CARGO_HOME "$HOME/.cargo"
    set -gx PATH $CARGO_HOME/bin $PATH
end

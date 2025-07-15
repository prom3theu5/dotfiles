
if test -d $HOME/.bun/bin
    set -gx BUN_INSTALL $HOME/.bun
    set -gx PATH $BUN_INSTALL/bin $PATH
end
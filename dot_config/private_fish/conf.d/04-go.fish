if test -d $HOME/go
    set -gx GOPATH $HOME/go
    set -gx PATH $PATH /usr/local/go/bin $GOPATH/bin
end
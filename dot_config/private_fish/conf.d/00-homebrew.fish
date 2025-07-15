if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
    set -gx HOMEBREW_NO_ENV_HINTS 1
end
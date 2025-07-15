if type -q sops
    set -gx SOPS_AGE_KEY_FILE $HOME/.config/sops/age/keys.txt
end
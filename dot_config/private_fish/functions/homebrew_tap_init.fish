function homebrew_tap_init --description "Initialize a new Homebrew tap repo"
    set -l repo $argv[1]
    if test -z "$repo"
        echo "Usage: homebrew_tap_init <repo-name>"
        return 1
    end
    mkdir -p $repo/Formula
    cd $repo
    git init
    echo "✅ Initialized Homebrew tap: $repo"
end
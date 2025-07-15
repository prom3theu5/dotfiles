function brew_full_update
    set_color cyan
    echo "Updating homebrew and local base of available packages and versions..."
    brew update

    echo "Upgrading outdated homebrew packages..."
    brew upgrade

    echo "Cleaning cache of unfinished downloads..."
    brew cleanup

    echo "Checking for issues..."
    brew doctor
    set_color normal
end
function generate_password
    set default_length 16
    set charset 'A-Za-z0-9!@%+'

    if test (count $argv) -gt 0
        set length $argv[1]
    else
        set length $default_length
    end

    if test $length -lt 8
        echo "Password length must be at least 8 characters."
        return 1
    end

    set base_length (math $length - 4)
    set base (LC_ALL=C tr -dc $charset < /dev/urandom | head -c $base_length)

    set upper (LC_ALL=C tr -dc 'A-Z' < /dev/urandom | head -c1)
    set lower (LC_ALL=C tr -dc 'a-z' < /dev/urandom | head -c1)
    set digit (LC_ALL=C tr -dc '0-9' < /dev/urandom | head -c1)
    set symbol (LC_ALL=C tr -dc '!@%^+' < /dev/urandom | head -c1)

    set combined "$base$upper$lower$digit$symbol"

    set -l chars (string split '' -- $combined)
    set -l shuffled_chars
    while test (count $chars) -gt 0
        set idx (random 1 (count $chars))
        set shuffled_chars $shuffled_chars $chars[$idx]
        set -e chars[$idx]
    end
    set shuffled (string join '' $shuffled_chars)

    echo -n $shuffled | pbcopy
    echo "Password of length $length copied to clipboard: $shuffled"
end
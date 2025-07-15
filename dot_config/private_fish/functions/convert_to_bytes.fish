function convert_to_bytes
    set -l input $argv[1]

    if test -z "$input"
        echo "Invalid input"
        return 1
    end

    # Extract numeric value
    set -l value (string match -r '^[0-9.]+' $input)

    # Extract unit (default to B if no unit found)
    set -l unit (string match -r '[a-zA-Z]+' $input)
    if test -z "$unit"
        set unit B
    end

    switch $unit
        case Gi
            set converted_bytes (math "$value * 1024 * 1024 * 1024")
        case Mi
            set converted_bytes (math "$value * 1024 * 1024")
        case Ki
            set converted_bytes (math "$value * 1024")
        case B
            set converted_bytes $value
        case '*'
            echo "Unsupported unit: $unit"
            return 1
    end

    echo -n $converted_bytes | pbcopy
    echo "Copied to clipboard: $converted_bytes bytes"
end

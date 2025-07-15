if type -q starship
    set -gx STARSHIP_DISTRO ""  # macOS icon

    set device (system_profiler SPHardwareDataType | awk '/Model Name/ {for (i=3; i<=NF; i++) printf $i" "; print ""}' | string trim)

    switch $device
        case "*MacBook*"
            set -gx STARSHIP_DEVICE ""
        case "*mini*"
            set -gx STARSHIP_DEVICE "󰇄"
        case "*"
            set -gx STARSHIP_DEVICE ""
    end

    starship init fish | source
end
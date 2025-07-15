function colormap
    for i in (seq 0 255)
        set_color -b $i
        printf "  "
        set_color normal
        set_color $i
        printf "%03d " $i
        set_color normal

        if test (math "$i % 6") = 3
            echo ""
        end
    end
    echo ""
end

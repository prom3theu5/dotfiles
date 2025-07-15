function code_remote
    if test (count $argv) -lt 2
        echo "Usage: code-remote <user@host> <path>"
        return 1
    end

    set remote $argv[1]
    set path $argv[2]
    code --remote "ssh-remote+$remote" $path
end
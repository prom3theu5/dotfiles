function ssh_with_password
    if test (count $argv) -lt 1
        echo "Usage: ssh_with_password <user@host>"
        return 1
    end

    set remote $argv[1]
    ssh $remote -o StrictHostKeyChecking=no -o PreferredAuthentications=password -o UserKnownHostsFile=/dev/null
end
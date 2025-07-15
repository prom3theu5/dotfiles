function uv_activate_venv
    if test -d ".venv"
        source .venv/bin/activate.fish
        echo "Virtual environment activated."
    else
        echo "No virtual environment found in the current directory."
        return 1  
    end
end
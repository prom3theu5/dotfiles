function homebrew_formula_readme_append --description "Append README.md entry for a tool in a shared Homebrew tap"
    set -l user $argv[1]
    set -l tool $argv[2]
    if test (count $argv) -ne 2
        echo "Usage: homebrew_formula_readme_append <github-user> <tool-name>"
        return 1
    end

    printf '\n---\n### Tool: %s\nRepo: https://github.com/%s/%s\n\nInstall with:\n\n```sh\nbrew tap %s/tap\nbrew install %s\n```\n' $tool $user $tool $user $tool >> README.md

    echo "✅ Appended $tool to README.md"
end
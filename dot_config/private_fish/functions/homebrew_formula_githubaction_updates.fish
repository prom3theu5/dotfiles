function homebrew_formula_githubaction_updates --description "Scaffold GitHub Action to auto-bump formula for a tool"
    set -l user $argv[1]
    set -l tool $argv[2]
    if test (count $argv) -ne 2
        echo "Usage: homebrew_formula_githubaction_updates <github-user> <tool-name>"
        return 1
    end

    mkdir -p .github/workflows
    set -l file .github/workflows/bump-formula-$tool.yml
    set -l lines

    set -a lines "name: Bump Homebrew Formula for $tool"
    set -a lines ""
    set -a lines "on:"
    set -a lines "  repository_dispatch:"
    set -a lines "    types: [bump-formula-$tool]"
    set -a lines ""
    set -a lines "permissions:"
    set -a lines "  contents: write"
    set -a lines ""
    set -a lines "jobs:"
    set -a lines "  bump:"
    set -a lines "    runs-on: ubuntu-latest"
    set -a lines "    steps:"
    set -a lines "      - uses: actions/checkout@v4"
    set -a lines ""
    set -a lines "      - name: Set version and download binaries"
    set -a lines "        run: |"
    set -a lines "          VERSION=\${{ github.event.client_payload.version }}"
    set -a lines "          echo \"VERSION=\$VERSION\" >> \$GITHUB_ENV"
    set -a lines "          curl -fL -o \"\$VERSION-darwin-arm64\" https://github.com/$user/$tool/releases/download/\$VERSION/$tool-darwin-arm64"
    set -a lines "          curl -fL -o \"\$VERSION-darwin-amd64\" https://github.com/$user/$tool/releases/download/\$VERSION/$tool-darwin-amd64"
    set -a lines "          curl -fL -o \"\$VERSION-linux-amd64\" https://github.com/$user/$tool/releases/download/\$VERSION/$tool-linux-amd64"
    set -a lines ""
    set -a lines "      - name: Sanitize version (remove 'v' prefix)"
    set -a lines "        run: echo \"VERSION_NO_PREFIX=\${VERSION#v}\" >> \$GITHUB_ENV"
    set -a lines "        env:"
    set -a lines "          VERSION: \${{ env.VERSION }}"
    set -a lines ""
    set -a lines "      - name: Calculate SHA256"
    set -a lines "        id: sha"
    set -a lines "        run: |"
    set -a lines "          echo \"darwin_arm64=\$(shasum -a 256 \$VERSION-darwin-arm64 | awk '{print \$1}')\" >> \$GITHUB_OUTPUT"
    set -a lines "          echo \"darwin_amd64=\$(shasum -a 256 \$VERSION-darwin-amd64 | awk '{print \$1}')\" >> \$GITHUB_OUTPUT"
    set -a lines "          echo \"linux_amd64=\$(shasum -a 256 \$VERSION-linux-amd64 | awk '{print \$1}')\" >> \$GITHUB_OUTPUT"
    set -a lines ""
    set -a lines "      - name: Patch formula"
    set -a lines "        run: |"
    set -a lines "          sed -i 's|^  version \\\".*\\\"|  version \"\${{ env.VERSION_NO_PREFIX }}\"|' Formula/$tool.rb"
    set -a lines "          sed -i \"/# HOMEBREW_MAC_ARM/,/# END_HOMEBREW_MAC_ARM/c\\"
    set -a lines "          # HOMEBREW_MAC_ARM\\\\n\
          url \\\"https://github.com/$user/$tool/releases/download/\${{ env.VERSION }}/$tool-darwin-arm64\\\"\\\\n\
          sha256 \\\"\${{ steps.sha.outputs.darwin_arm64 }}\\\"\\\\n\
          # END_HOMEBREW_MAC_ARM\" Formula/$tool.rb"
    set -a lines ""
    set -a lines "          sed -i \"/# HOMEBREW_MAC_AMD64/,/# END_HOMEBREW_MAC_AMD64/c\\"
    set -a lines "          # HOMEBREW_MAC_AMD64\\\\n\
          url \\\"https://github.com/$user/$tool/releases/download/\${{ env.VERSION }}/$tool-darwin-amd64\\\"\\\\n\
          sha256 \\\"\${{ steps.sha.outputs.darwin_amd64 }}\\\"\\\\n\
          # END_HOMEBREW_MAC_AMD64\" Formula/$tool.rb"
    set -a lines ""
    set -a lines "          sed -i \"/# HOMEBREW_LINUX_AMD64/,/# END_HOMEBREW_LINUX_AMD64/c\\"
    set -a lines "          # HOMEBREW_LINUX_AMD64\\\\n\
          url \\\"https://github.com/$user/$tool/releases/download/\${{ env.VERSION }}/$tool-linux-amd64\\\"\\\\n\
          sha256 \\\"\${{ steps.sha.outputs.linux_amd64 }}\\\"\\\\n\
          # END_HOMEBREW_LINUX_AMD64\" Formula/$tool.rb"
    set -a lines ""
    set -a lines "      - name: Commit and push"
    set -a lines "        run: |"
    set -a lines "          git config user.name \"github-actions\""
    set -a lines "          git config user.email \"actions@github.com\""
    set -a lines "          git commit -am \"chore: bump to \${{ env.VERSION }}\" || echo \"No changes to commit\""
    set -a lines "          git push"

    string join \n $lines > $file
    echo "✅ GitHub Action created at $file"
end
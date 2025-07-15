#!/usr/bin/env fish

if not type -q mas
    echo "🔧 Installing Mac App Store CLI..."
    brew install mas
end

set yaml_file "./.chezmoidata/mas.yaml"
set brewfile_lines (yq -o=json '.' $yaml_file | jq -r '.mas[] | "mas \"\(.name)\", id: \(.id)"')

set tmpfile (mktemp)
for line in $brewfile_lines
    echo $line >> $tmpfile
end

brew bundle --file=$tmpfile
rm $tmpfile
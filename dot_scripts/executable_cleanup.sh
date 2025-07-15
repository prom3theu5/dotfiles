
remove_stuff() {
  find . \( -name "bin" -o -name "obj" -o -name "node_modules" -o -name ".vs" -o -name ".tests" -o -name ".artifacts" \) -type d -prune -exec rm -rf '{}' + -o -name ".DS_Store" -type f -exec rm -f '{}' +
}

find_stuff_to_remove() {
  find . \( -type d \( -name "bin" -o -name "obj" -o -name "node_modules" -o -name ".vs" -o -name ".tests" -o -name ".artifacts" \) -prune -print \) -o \( -type f -name ".DS_Store" -print \) | xargs du -chs
}

if [ "$1" = "find" ]; then
  find_stuff_to_remove
elif [ "$1" = "remove" ]; then
  remove_stuff
else
  echo "Usage: cleanup.sh [find|remove]"
fi

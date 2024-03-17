
remove_stuff() {
  # shellcheck disable=SC2038
  find . \( -name "bin" -o -name "obj" -o -name "node_modules" -o -name ".vs" -o -name ".tests" -o -name ".artifacts" \) -type d -prune -exec rm -rf '{}' +
}

find_stuff_to_remove() {
  # shellcheck disable=SC2038
  find . \( -name "bin" -o -name "obj" -o -name "node_modules" -o -name ".vs" -o -name ".tests" -o -name ".artifacts" \) -type d -prune | xargs du -chs
}

if [ "$1" = "find" ]; then
  find_stuff_to_remove
elif [ "$1" = "remove" ]; then
  remove_stuff
else
  echo "Usage: cleanup.sh [find|remove]"
fi

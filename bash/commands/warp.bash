vim_picker() {
  vim -c "setlocal noreadonly" \
    -c "setlocal cursorline" \
    -c "setlocal number" \
    -c "nnoremap <buffer> <CR> V:w! ~/.picked<CR>:qa!<CR>" \
    -c "vnoremap <buffer> <CR>  :w! ~/.picked<CR>:qa!<CR>" \
    -R -
}

warp() {
  local SOURCE="$HOME/.warp"
  if [ ! -f "$SOURCE" ]; then
    echo "$SOURCE does not exist..."
    return 1
  fi
  local TARGET=$HOME/.picked
  if [ -e "$TARGET" ]; then
    rm "$TARGET"
  fi

  cat $SOURCE | vim_picker
  # nothing was selected, abort
  if [ ! -e "$TARGET" ]; then
    return
  fi

  local old_IFS="$IFS"
  IFS=$'\n'
  local lines=($(awk '{print $1}' "$TARGET"))
  IFS="$old_IFS"
  # neat! add this line to the bash history
  # as if we had typed it
  if [ ${#lines[@]} -gt 1 ]; then
    history -s cssX "${lines[@]}"
    csshX "${lines[@]}"
  else
    history -s ssh "${lines[@]}"
    ssh "${lines[@]}"
  fi
}


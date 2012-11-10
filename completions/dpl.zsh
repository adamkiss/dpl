if [[ ! -o interactive ]]; then
    return
fi

compctl -K _dpl dpl

_dpl() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(dpl commands)"
  else
    completions="$(dpl completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

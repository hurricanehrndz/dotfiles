# vim:set ft=zsh sw=2 sts=2 ts=2 et:

fpath=($HOME/.local/share/zsh/completions $fpath)

if [[ -e "/usr/share/zsh/vendor-completions" ]]; then
  fpath=(/usr/share/zsh/vendor-completions $fpath)
fi

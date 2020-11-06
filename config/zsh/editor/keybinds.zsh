#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

bindkey   -M   viins   '^K'   history-substring-search-up
bindkey   -M   viins   '^J'   history-substring-search-down
bindkey   -M   viins   '^\'   end-of-line
bindkey   -M   viins   '^^'   beginning-of-line
bindkey   -M   viins   '^Y'   autosuggest-accept
bindkey   -M   vicmd   'k'    history-substring-search-up
bindkey   -M   vicmd   'j'    history-substring-search-down

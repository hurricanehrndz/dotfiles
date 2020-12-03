#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

# my vim like keybinds
bindkey   -M   viins   "$key_info[Control]K"   history-substring-search-up
bindkey   -M   viins   "$key_info[Control]J"   history-substring-search-down
bindkey   -M   viins   "$key_info[Control]\\"   end-of-line
bindkey   -M   viins   "$key_info[Control]^"   beginning-of-line
bindkey   -M   viins   "$key_info[Control]Y"   autosuggest-accept
bindkey   -M   vicmd   "k"                     history-substring-search-up
bindkey   -M   vicmd   "j"                     history-substring-search-down

# set vi mode
bindkey -v

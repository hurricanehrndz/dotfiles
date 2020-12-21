# see: https://github.com/belak/zsh-utils/blob/master/completion/completion.plugin.zsh
# Options

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB       # Needed for file modification glob modifiers with compinit
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"


# Load and initialize the completion system ignoring insecure directories with a
# cache time of 20 hours, so it should almost always regenerate the first time a
# shell is opened each day.
# NULL_GLOB option (no error), plus Glob qulaifiers mh, modified time hours
# files modified 20 hours ago
# http://zsh.sourceforge.net/Doc/Release/Expansion.html#Filename-Generation
# autoload -Uz compinit
# _comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nmh-20))
# if (( $#_comp_files )); then
#   compinit -i -C               # Skip checks for new completion functions
# else
#   compinit -i
# fi
# unset _comp_files

#!/bin/bash

if [[ "$TERMINAL" == "urxvtc-256color" ]]; then
    # start urxvt daemon
    urxvtd-256color --quiet --opendisplay --fork
fi

# Browser
i3-msg "workspace 3 "
i3-msg "exec $BROWSER"

# Chat programs
sleep 3
i3-msg "workspace 4 "
i3-msg "exec Telegram"
i3-msg "workspace 4 "
i3-msg "exec $TERMINAL -e weechat"


# Terminal
sleep 3
i3-msg "workspace 1 "
i3-msg "exec $TERMINAL"
i3-msg '[title="WeeChat.*"]' move "workspace 4 "

# set up bash prompt style
#PS1="\[\e]133;D;$?\e\\\e]133;A\e\\\]\[$(ppwd)\]\u@\h:\w>"
#PS1="\[\e]133;D;$?\e\\\e]133;A\e\\\]\[$(ppwd)\]\u@\h:\w> \[\e]133;B\e\\\]"
#PS1="\h-\u-$PWD \! \#\n> "
#PS1="┌\h-\u-\w\n└→ "
#PS1="╭\h-\u-\w\n╰─▷ "
if [ -v CONTAINER_ID ]; then export PS1="\n╭\h-distrobox-$CONTAINER_ID:\w\n╰─▷ "; else export PS1="\n╭\h:\w\n╰─▷ "; fi

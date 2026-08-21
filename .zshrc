# ======================================
#  ZSH Configuration
# ======================================

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY

# --- Completion ---
autoload -Uz compinit
if [[ -n ${ZSH_VERSION} ]]; then
  if [[ -f ~/.zcompdump && ! ~/.zcompdump -nt ~/.zshrc ]]; then
    compinit -i
  else
    compinit
  fi
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# --- Autosuggestions ---
if [[ -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
  source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
  ZSH_AUTOSUGGEST_STRATEGY=(completion)
else
  print "zsh-autosuggestions not available, get zsh-autosuggestions on github"
fi

# --- Globbing ---
setopt GLOB_DOTS NO_CASE_GLOB

# Distrobox status
typeset -g container_info
if [[ -n "$CONTAINER_ID" ]]; then
  container_info="%F{blue}${CONTAINER_ID}%f "
else
  container_info=""
fi

# --- Prompt ---
setopt PROMPT_SUBST
PROMPT='%(?..%F{9}fail:%? )${container_info}%F{5}%/
%F{5}%#%f '
# Explanation:
#   First line: red fail if last command failed; current path in color
#   Second line: %# (shows % for normal user, # for root)

# --- Git Info ---
precmd_functions+=(git_rprompt)
git_rprompt() {
    if ! command -v git >/dev/null 2>&1; then
        RPROMPT="%F{8}git?"
    else
        RPROMPT="%F{8}$(git symbolic-ref --short HEAD 2>/dev/null)"
    fi
}

# --- Aliases ---

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias l='ls -lh'

alias ..='cd ..'
alias ...='cd ../..'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias db='distrobox'
alias dbe='distrobox enter'
alias dbl='distrobox list'
alias dbu='distrobox upgrade'
alias dbs='distrobox stop'

alias img='flatpak run org.wezfurlong.wezterm imgcat'

# --- Quality of Life ---
setopt AUTO_CD
setopt CORRECT
#setopt IGNORE_EOF #disables Ctrl+D exit of terminal
setopt NOTIFY
setopt NUMERIC_GLOB_SORT

# --- Cursor Movement ---
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word


# Environment variables for consistency to always use the same tools for certain tasks

## --- Editor ---
#export EDITOR=nano
#export VISUAL=nano

# --- Pager ---
#export PAGER=less
export LESS='-R -M --shift 5'


# Remove the error 'tty: ttyname error: No such device'
clear

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
#bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/pk/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# enable color for ls command
alias ls='ls --color=auto'


# git status display
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f'
zstyle ':vcs_info:*' enable git

# distrobox status display
local container_info=""
if [ -n "$CONTAINER_ID" ]; then
	#container_info="[%F{green}Distrobox:%F{blue}${CONTAINER_ID}%F{green}]%f "
	container_info="%F{blue}${CONTAINER_ID}%f "
fi


## exit code display
#prevExitCode=$?
#exitCodeDisp="${prevExitCode}"
#if [ $prevExitCode -eq 1 ]; then
#	exitCodeDisp=$exitCodeDisp" generic"
#elif [ $prevExitCode -eq 2 ]; then
#	exitCodeDisp=$exitCodeDisp" command"
#elif [ $prevExitCode -eq 126 ]; then
#	exitCodeDisp=$exitCodeDisp" permission"
#elif [ $prevExitCode -eq 127 ]; then
#	exitCodeDisp=$exitCodeDisp" path resolution"
#elif [ $prevExitCode -eq 130 ]; then
#	exitCodeDisp=$exitCodeDisp" interrupted"
#elif [ $prevExitCode -eq 255 ]; then
#	exitCodeDisp=$exitCodeDisp" other"
#fi

#PROMPT='
#${container_info}%F{yellow}%/ %(?.%F{green}suc.%F{red}fail:%?)%f%b
#%F{green}%# >%f '

PROMPT='%(?..%F{red}fail:%? )
${container_info}%F{5}%/%f%b
%F{green}%# %F{green}>%f '

#setopt PROMPT_SUBST #see https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html

# Prompt
#PS1="%F{green}▶ %B%~/%b%f "

# Exports 
export PATH="$HOME/.local/bin/:$PATH"

#### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk Start of Zinit installer's chunk

# Prompt
zinit ice depth=1 atload"!source ~/.zsh/powerlevel10k-settings.zsh" lucid nocd
zinit light romkatv/powerlevel10k


# OMZ libs
zinit snippet OMZ::lib/grep.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/completion.zsh

# OMZ Plugins
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

# Aliases
alias l='lsd -lh --group-dirs first'
alias ll='lsd -alh --group-dirs first'
alias ls='ls --color=auto -t'
alias cls='clear'
alias py='python3'
alias pip='pip3'
alias ytdl='youtube-dl'
alias docker='sudo docker'
alias open='xdg-open'
alias sudo='sudo -p "$(printf "\033[1;31mPassword: \033[0;0m" )"'
alias rm='printf "\033[1;31m" && rm -rIv'
alias cp='printf "\033[1;32m" && cp -rv'
alias mv='printf "\033[1;34m" && mv -v'
alias mkdir='printf "\033[1;33m" && mkdir -v'
alias rmdir='printf "\033[1;35m" && rmdir -v'

# History
HISTSIZE=500
SAVEHIST=1000
HISTFILE=.cache/zsh_history

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#binds
bindkey "^[[3~" delete-char
bindkey "^A" beginning-of-line
bindkey "^Q" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word




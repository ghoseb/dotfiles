### Fix history settings
alias history="history 1"
HISTSIZE=99999
HISTFILESIZE=99999
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

### Keybindings
bindkey -e                      # Emacs keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

### Load ZSH completions installed by Homebrew
if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set path for Extras
export PATH=~/.emacs.d/bin:~/.cargo/bin:$PATH

# Set ~/.local/bin/ in PATH
. "$HOME/.local/bin/env"

### Prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.yaml)"
fi

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

### Aliases
alias ls="eza -al --color=auto --group-directories-first"
alias gtfo="git fetch -p origin"
alias gtrmain="git rebase origin main"
alias gtcom="git checkout main"
alias gtlg="git log --pretty=format:'commit %Cred%h%Creset%C(yellow)%d %Creset%Cgreen%cr%Creset%n  %s%nby %C(bold blue)%an <%aE>%n'"
alias python=/opt/homebrew/bin/python3
alias hbprune="brew cleanup -v -s --prune=all"
###

### Load sheldon
eval "$(sheldon source)"

# Shell integrations
eval "$(fzf --zsh)"

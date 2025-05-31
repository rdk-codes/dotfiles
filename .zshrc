# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname "$ZINIT_HOME")"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load fzf
source <(fzf --zsh)

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load Autocompletions
(( ${+_comps} )) || { autoload -U compinit; compinit }
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable emacs-style keybindings (default)
bindkey -e

# Search history by current input (like Up/Down arrow but smarter)
bindkey '^p' history-search-backward    # Ctrl+P
bindkey '^n' history-search-forward     # Ctrl+N

# Beginning and end of line (Home / End)
bindkey '^[[H' beginning-of-line        # Home
bindkey '^[[F' end-of-line              # End

# Delete under cursor (Delete key)
bindkey '^[[3~' delete-char

# Move by word with Ctrl+← / Ctrl+→
bindkey '^[[1;5D' backward-word         # Ctrl+Left
bindkey '^[[1;5C' forward-word          # Ctrl+Right

# Move by word with Alt+← / Alt+→ (common fallback)
bindkey '^[OD' backward-word            # Alt+Left (some terminals)
bindkey '^[OC' forward-word             # Alt+Right

# Delete word left (Ctrl+Backspace)
bindkey '^H' backward-kill-word

# Delete word right (Ctrl+Delete)
bindkey '^[[3;5~' kill-word


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling (minimal)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Aliases
alias rls='/bin/ls'
alias l='eza --color=always --icons=always -1'
alias ls='eza --color=always --icons=always'
alias zed='zeditor'
alias copy='wl-copy'
alias paste='wl-paste'
alias nvcc='
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.cache/nvim
'
alias tmcc= "rm -rf ~/.config/tmux/plugins"
alias chrome='env OZONE_PLATFORM=wayland google-chrome-stable --ozone-platform=wayland'
alias code='env OZONE_PLATFORM=wayland code --ozone-platform=wayland'
alias obsidian='env OZONE_PLATFORM=wayland obsidian --ozone-platform=wayland'
alias cw="source ~/.config/hypr/scripts/swww/change.sh"

# Load zoxide
eval "$(zoxide init --cmd cd zsh)"

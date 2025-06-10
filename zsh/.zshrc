# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# editor
export EDITOR=nvim

# zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# plugin loading
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Rosé Pine Color Scheme
bg="#121017"             # Main background
fg="#e0def4"             # Surface (text) color
bg_highlight="#1f1d2e"   # Background highlight
purple="#c4a7e7"         # Iris (highlight)
blue="#9ccfd8"           # Foam (blue accent)
cyan="#ebbcba"           # Gold (warm accent)
rose="#eb6f92"           # Love (magenta)
pine="#31748f"           # Pine (greenish blue)
foam="#9ccfd8"           # Foam (blue accent)
iris="#c4a7e7"           # Iris (lavender)
gold="#f6c177"           # Gold (accent)
highlight_low="#1f1d2e"  # Lowlight
highlight_med="#2a273f"  # Medium highlight
highlight_high="#393552" # High highlight

# fzf integration
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
  zinit light Aloxaf/fzf-tab
  export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
  export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --preview-window=right:50%:wrap --color=fg:${fg},hl:${purple},fg+:${fg},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
  show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always --icons=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
  export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
  export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons=always {} | head -200'"
fi

# snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet https://raw.githubusercontent.com/junegunn/fzf-git.sh/master/fzf-git.sh

# history configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_find_no_dups hist_ignore_dups

# completion styling
autoload -U compinit; compinit
zinit cdreplay -q
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# prompt
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# alias
alias rls='/bin/ls'
alias l='eza --color=always --icons=always -1'
alias ls='eza --color=always --icons=always'
alias ll='eza --color=always --icons=always -l'
alias nvcc='rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim'
alias cw="source ~/.config/hypr/scripts/swww/change.sh"
alias lg='lazygit'
alias so='source ~/.zshrc'
alias sou='source ./venv/bin/activate'

# fallbacks
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init --cmd cd zsh)"
else
  alias cd='builtin cd'
fi

if ! command -v eza >/dev/null 2>&1; then
  alias ls='/bin/ls'
  alias l='ls -1'
fi

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/dotfiles/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.p10k.zsh

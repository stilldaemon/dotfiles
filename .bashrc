#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# doom emacs
export PATH="$HOME/.config/emacs/bin:$PATH"

export MANPAGER='nvim +Man!'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ff='fastfetch'
alias c='clear'
alias y='yazi'
alias q='exit'
alias uu='sudo pacman -Syu'

export QT_QPA_PLATFORMTHEME="qt6ct"
export EDITOR="nvim"

# set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Prompt configuration: Starship in Kitty, simple PS1 in Emacs vterm
if [[ $- == *i* ]]; then
  if [[ -n "$KITTY_WINDOW_ID" && "$INSIDE_EMACS" != "vterm" ]]; then
    # Full Starship prompt in Kitty
    eval "$(starship init bash)"
  else
    # Lightweight prompt in Emacs vterm and other terminals
    PS1='\[\e[38;5;208m\]➜ \[\e[38;5;245m\]\w\[\e[0m\]\n\[\e[38;5;208m\]❯ \[\e[0m\]'
  fi
fi

# ble.sh (autosuggestions and syntax highlighting)
source /usr/share/blesh/ble.sh

# --- Yazi Setup ---
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Auto-start ssh-agent and cache key for 7 days
if ! pgrep -u "$USER" ssh-agent >/dev/null; then
  eval "$(ssh-agent -s)" >/dev/null
fi
ssh-add -l >/dev/null 2>&1 || ssh-add ~/.ssh/id_ed25519

# ~/.zshrc

# --- 1. Pywal Farben laden (für Shell-Sequenzen) ---
# (Falls du catppuccin oder so direkt in kitty nutzt, kannst du das weglassen, 
# aber für pywal ist das wichtig)
[ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences

# --- 2. History (Wie vorher) ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# --- 3. Autocomplete (Der Fix) ---
autoload -Uz compinit
zstyle ':completion:*' menu select
# zsh-completions muss VOR compinit im fpath sein, Arch macht das meist automatisch.
# Wir entfernen die fehlerhafte "source"-Zeile.
compinit

# --- 4. Plugins ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# FZF Integration
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# --- 5. Minimal Prompt (Pywal freundlich) ---
# Keine Regenbogenfarben, sondern Systemfarben (die Pywal setzt)
setopt PROMPT_SUBST

# Funktion für Git Branch
function git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt Aufbau: "Pfad (Git) ❯ "
# %F{4} ist normalerweise Blau (oder deine Pywal Farbe 4)
# %F{5} ist Magenta (oder deine Pywal Farbe 5)
# %f resettet die Farbe
PROMPT='%B%F{4}%~%F{5}$(git_branch)%f ❯ %b'

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# --- 6. Keybindings & Aliases ---
bindkey -e
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
alias k='kitten'
alias c='clear'

alias shh="kitten ssh"
alias ls="lsd"
alias music="rclone copy /nas/Music gdrive:Music -P"

alias rip="abcde -N -o flac"

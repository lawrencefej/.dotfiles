# Setup fzf
# ---------
if [[ ! "$PATH" == */home/lawrence/.config/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/lawrence/.config/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/lawrence/.config/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/lawrence/.config/.fzf/shell/key-bindings.zsh"

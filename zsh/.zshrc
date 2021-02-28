# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lawrence/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"



# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# ZSH Plugins
plugins=(
        git
        zsh-nvm
        node
        npm
        npx
        nvm
        kubectl
        zsh-autosuggestions
        zsh-syntax-highlighting
        history-substring-search
        )

source $ZSH/oh-my-zsh.sh

# User configuration
# Paths
path+=('/home/lawrence/.local/bin')
path+=('/home/lawrence/.cargo/bin')

# Set Default Editor
export VISUAL=vim
export EDITOR="$VISUAL"

# zsh-syntax-highlighting key bindings
bindkey   '^[[H'    beginning-of-line
bindkey   '^[[F'    end-of-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000

# BEGIN: ASDF

# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash


# export MANPATH="/usr/local/man:$MANPATH"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
source ~/.config/.dotfiles/aliases/aliases.zsh
source ~/.config/.dotfiles/aliases/functions.zsh
source ~/.config/.dotfiles/aliases/debian_aliases.zsh
source ~/.config/.dotfiles/aliases/wsl_aliases.zsh
source ~/.config/.dotfiles/aliases/dotnet.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault

# For Loading the SSH key
/usr/bin/keychain -q --nogui $HOME/.ssh/id_ed25519
source $HOME/.keychain/$HOST-sh

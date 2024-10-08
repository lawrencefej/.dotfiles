# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/home/lawrence/.oh-my-zsh"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"



# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# ZSH Plugins

# plugins for server
if [[ "$MACHINE_TYPE" == "server" ]]; then
  plugins=(
          git
          node
          npm
          zsh-autosuggestions
          zsh-syntax-highlighting
          history-substring-search
          )
fi

# plugins for computer
if [[ "$MACHINE_TYPE" == "computer" ]]; then
  plugins=(
          git
          zsh-nvm
          node
          npm
          nvm
          kubectl
          zsh-autosuggestions
          zsh-syntax-highlighting
          history-substring-search
          )
fi

# plugins=(
#         git
#         zsh-nvm
#         node
#         npm
#         nvm
#         kubectl
#         zsh-autosuggestions
#         zsh-syntax-highlighting
#         history-substring-search
#         )

source $ZSH/oh-my-zsh.sh

# User configuration
# Paths
path+=("$HOME/.local/bin")
path+=("$HOME/.local/bin/go/bin")
export GOPATH=$HOME/go
path+=("$HOME/.cargo/bin")
export PATH=/usr/local/bin/:$PATH

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

export TLDR_COLOR_NAME="cyan"
export TLDR_COLOR_DESCRIPTION="white"
export TLDR_COLOR_EXAMPLE="green"
export TLDR_COLOR_COMMAND="red"
export TLDR_COLOR_PARAMETER="white"
export TLDR_LANGUAGE="en"
export TLDR_CACHE_ENABLED=1
export TLDR_CACHE_MAX_AGE=720
export TLDR_PAGES_SOURCE_LOCATION="https://raw.githubusercontent.com/tldr-pages/tldr/main/pages"
export TLDR_DOWNLOAD_CACHE_LOCATION="https://tldr-pages.github.io/assets/tldr.zip"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
source ~/.config/.dotfiles/aliases/aliases.zsh
source ~/.config/.dotfiles/aliases/functions.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault

# For Loading the SSH key for wsl
if [[ "$WSL_DISTRO_NAME" ]]; then
  source ~/.config/.dotfiles/aliases/wsl_aliases.zsh
  source ~/.config/.dotfiles/aliases/debian_aliases.zsh
  source $HOME/.keychain/$HOST-sh
fi

# plugins for server
if [[ "$MACHINE_TYPE" == "server" ]]; then
  source ~/.config/.dotfiles/aliases/debian_aliases.zsh
fi

# plugins for server
if [[ "$MACHINE_TYPE" == "computer" ]]; then
  source ~/.config/.dotfiles/aliases/dotnet.zsh
  complete -C '/usr/local/bin/aws_completer' aws
fi

complete -o nospace -C /usr/bin/terraform terraform

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lawrence/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lawrence/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lawrence/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lawrence/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

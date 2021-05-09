#!/usr/bin/env bash

# set -e
# set -f


###
# Install oh my zsh
###
# if ! ${IGNORE_OMZ} ; then
printf "\n🚀 Installing oh-my-zsh\n"
if [ -d "${HOME}/.oh-my-zsh" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# fi

printf "\n🚀 Installing powerlevel10k\n"
if [ -d "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k)"
fi

printf "\n🚀 Installing zsh-autosuggestions\n"
if [ -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions)"
fi

printf "\n🚀 Installing zsh-history-substring-search\n"
if [ -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-history-substring-search" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search)"
fi

printf "\n🚀 Installing zsh-syntax-highlighting\n"
if [ -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting)"
fi

printf "\n🚀 Installing lsd\n"
sh -c "$(curl -k -O -L https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb)"
sh -c "$(sudo dpkg -i lsd_0.20.1_amd64.deb)"


###
# Installing dotfiles
###
# if ! ${IGNORE_DOTFILES} ; then
printf "\n🚀 Installing dotfiles\n"
ln -sf "$(pwd)/zsh/.p10k.zsh" "${HOME}/.p10k.zsh"
ln -sf "$(pwd)/zsh/.zshrc" "${HOME}/.zshrc"
# ln -sf "$(pwd)/zsh/benmatselby.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/"
# ln -sf "$(pwd)/common/aliases" "${HOME}/.oh-my-zsh/custom/aliases.zsh"
# ln -sf "$(pwd)/common/docker" "${HOME}/.oh-my-zsh/custom/docker.zsh"
# ln -sf "$(pwd)/common/exports" "${HOME}/.oh-my-zsh/custom/exports.zsh"
# ln -sf "$(pwd)/common/functions" "${HOME}/.oh-my-zsh/custom/functions.zsh"
# ln -sf "$(pwd)/common/gh-config.yml" "${HOME}/.config/gh/config.yml"
# ln -sf "$(pwd)/common/.vimrc" "${HOME}/.vimrc"
# ln -sf "$(pwd)/common/.tmux.conf" "${HOME}/.tmux.conf"
# ln -sf "$(pwd)/git/.gitconfig" "${HOME}/.gitconfig"
# ln -sf "$(pwd)/git/.gitignore" "${HOME}/.gitignore"
# fi


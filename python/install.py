#!/usr/bin/env python3

import os
import sys
import pathlib
import plugin


home = os.environ['HOME']
path = home + "/.config/zsh/"
clone = "git clone "
zshcache = home + "/.cache/zsh/"
zshconfig = home + "/.config/zsh/"
shell = os.environ['SHELL']
user = os.environ["USER"]


plugins = []
plugins.append(plugin.Plugin("powerlevel10k",
                             "--depth=1 https://github.com/romkatv/powerlevel10k.git"))
plugins.append(plugin.Plugin("zsh-autosuggestions",
                             "https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions"))
plugins.append(plugin.Plugin("zsh-history-substring-search",
                             "https://github.com/zsh-users/zsh-history-substring-search"))
plugins.append(plugin.Plugin("zsh-syntax-highlight",
                             "https://github.com/zsh-users/zsh-syntax-highlighting.git"))


# Install required packages
pckgarr = ["zsh", "stow", "util-linux-user"]
plugin.InstallPackages(pckgarr)

# Change user default shell to zsh
plugin.ChangeUserDefaultShell(user, shell)

# Create zsh config folder
plugin.CreateDir(zshconfig)

# Create history file
plugin.CreateFile(".zsh_history", zshcache)

# Install plugins
plugin.InstallPlugins(clone, path, plugins)

# Rename the bash and git files
stows = []
stows.append(plugin.Config("bash", home + "/.bashrc"))
stows.append(plugin.Config("bash", home + "/.bash_profile"))
stows.append(plugin.Config("git", home + "/.gitconfig"))
stows.append(plugin.Config("htop", home + "/.config/htop/" + "htoprc"))
stows.append(plugin.Config("p10k", home + "/.p10k.zsh"))
stows.append(plugin.Config("zsh", home + "/.zshrc"))

# create symlinks with stow
for p in stows:
    if os.path.isfile(p.configPath):
        print(p.name + "  exists")
        plugin.DeleteFile(p.configPath)
    else:
        print(p.name + " does not exist")
    plugin.CreateSymLink(home, p.name)

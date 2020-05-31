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


# Install required packages
pckgarr = ["zsh", "stow", "util-linux-user"]

for p in pckgarr:
    if (os.system("rpm -q " + p) != 0):
        print("Installing" + p)
        if (os.system("sudo dnf -y install " + p) == 0):
            print(p + " is installed")
        else:
            print(p + " was not installed")

# Change user default shell to zsh
if (shell != "/usr/bin/zsh"):
    os.system("sudo chsh -s /bin/zsh " + user)

# Create zsh config folder
pathlib.Path(zshconfig).mkdir(parents=True, exist_ok=True)

# Create history file
historyfile = zshcache + ".zsh_history"
pathlib.Path(zshcache).mkdir(parents=True, exist_ok=True)
new_file = open(historyfile, 'w')
new_file.close()

# Install plugins
for p in plugin.plugins:
    if os.path.isdir(path + p.name):
        print(p.name + " is already installed, skipping")
        print()
    else:
        print("Installing " + p.name + "from " + p.url)
        os.chdir(path)
        os.system(clone + p.url)
        print(p.name + "installed successfully")

# create symlinks with stow
stowlist = ["bash", "git", "htop", "p10k", "zsh"]

for s in stowlist:
    os.system("stow -vSt " + home + " -d " + home + "/.dotfiles/ " + s)

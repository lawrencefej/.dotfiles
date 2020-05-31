#!/usr/bin/env python3

import os
import pathlib


class Plugin:

    def __init__(self, name, url):
        self.name = name
        self.url = url


class Config:

    def __init__(self, name, configPath):
        self.name = name
        self.configPath = configPath


# Install required packages
def InstallPackages(packageList):
    for p in packageList:
        if (os.system("rpm -q " + p) != 0):
            print("Installing " + p)
            if (os.system("sudo dnf -y install " + p) == 0):
                print(p + " is installed")
            else:
                print(p + " was not installed")


# Change user default shell
def ChangeUserDefaultShell(user, shell):
    if (shell != "/usr/bin/zsh"):
        os.system("sudo chsh -s /bin/zsh " + user)

# Rename the bash and git files


def DeleteFile(fileName):
    os.remove(fileName)


#  Create symlinks with stow
def CreateSymLink(home, configName):
    os.system("stow -vSt " + home + " -d " +
              home + "/.dotfiles/ " + configName)


# Install plugins
def InstallPlugins(clone, path, pluginList):
    for p in pluginList:
        if os.path.isdir(path + p.name):
            print(p.name + " is already installed, skipping")
            print()
        else:
            print("Installing " + p.name + "from " + p.url)
            os.chdir(path)
            os.system(clone + p.url)
            print(p.name + "installed successfully")
    pass


# Create directory
def CreateDir(path):
    pathlib.Path(path).mkdir(parents=True, exist_ok=True)


# Create file
def CreateFile(file, path):
    file = path + file
    new_file = open(file, 'w')
    new_file.close()

#!/usr/bin/env python3

class Plugin:

    def __init__(self, name, url):
        self.name = name
        self.url = url


plugins = []

plugins.append(Plugin("zsh-autosuggestions",
                      "https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions"))
plugins.append(Plugin("zsh-history-substring-search",
                      "https://github.com/zsh-users/zsh-history-substring-search"))
plugins.append(Plugin("zsh-syntax-highlight",
                      "https://github.com/zsh-users/zsh-syntax-highlighting.git"))

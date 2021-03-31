# My personal dotfiles

I use [Yadm](https://yadm.io/) to manage my dotfiles. This Repo is inspired by [@steinbrueckri](https://github.com/steinbrueckri) and his [dotfiles repo](https://github.com/steinbrueckri/dotfiles).

## Features

Currently it only installs all dev tools I use for web development and only on **Linux**. There is **no** implementation for MacOS or Windows. I created the [bootstrap](https://yadm.io/docs/bootstrap#) script, so that some things are optional and will not be installed if you dont want/need them.

### Linux

#### Supported Package Manager

| Tools  | Implemented |
| :----: | :---------: |
|  apt   |     ✅      |
| pacman |     🚫      |
|  yum   |     🚫      |
| Zypper |     🚫      |
|  DNF   |     🚫      |

#### Tools

|           Tools            | Implemented |
| :------------------------: | :---------: |
|         Alecritty          |     🚫      |
|            vim             |     ✅      |
|            git             |     ✅      |
|   git-credential manager   |     ✅      |
|            zsh             |     ✅      |
|         oh-my-zsh          |     ✅      |
| Spaceship-Prompt(optional) |     ✅      |
|            nvm             |     ✅      |
|            node            |     ✅      |
|       yarn(optional)       |     ✅      |

## Structure

|                    Folder/File                     |                                                    Description                                                    |
| :------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------: |
| [`.config/yadm/bootstrap`](.config/yadm/bootstrap) |                           [Bootstrap script for yadm](https://yadm.io/docs/bootstrap#)                            |
|                `.local/share/fonts`                |                                                .local/share/fonts                                                 |
|                    `.gitconfig`                    |                               [gitconfig file](https://git-scm.com/docs/git-config)                               |
|           `.gitconfig-mediamarktsaturn`            |                                               Expends my gitconfig                                                |
|                `.gitignore_global`                 |                                                 [Global .gitignore](https://gist.github.com/subfuzion/db7f57fff2fb6998a16c)                                                 |
|                   `.gitmessage`                    | My personal [.gitmessage template](https://thoughtbot.com/blog/better-commit-messages-with-a-gitmessage-template) |
|                      `.zshrc`                      |                         [zshconfig file](https://wiki.ubuntuusers.de/Zsh/#Konfiguration)                          |

## How to

1. First you need to install git and yadm:

```sh
sudo apt install git yadm
```

2. Clone git repo with yadm

```sh
yadm clone https://github.com/daribock/dotfiles.git
```

3. Init bootstrap script

```sh
yadm bootstrap
```

Here you can find [additional commands](https://github.com/TheLocehiliosan/yadm/blob/master/yadm.md).

## Coming Soon

- Implementation for Windows
- Implementation for MacOS
- Implement more Package Manager for Linux
- Add Tmux

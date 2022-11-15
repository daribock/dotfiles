# My personal dotfiles

![dotfiles](https://dotfiles.github.io/images/dotfiles-logo.png)

These are my personal dotfiles I use every day. In the folder `.old-dotfiles`
you can see my old dotfiles. If you find something interesting, go ahead and
take whatever you want. Currently my dotfiles are only for macOS.

## Use

First of all you need [yadm](https://yadm.io/), this can be installed on macOS
via homebrew.

### Install Homebrew

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### Install yadm

#### Homebrew

```shell
brew install yadm
```

#### Ubunut/Debian

```shell
sudo apt-get install yadm
```

### Clone dotfiles with [yadm](https://yadm.io/)

```shell
yadm clone https://github.com/daribock/dotfiles.git
```

### Install tools with Homebrew

```shell
brew bundle install --file=.Brewfile
```

### Install oh-my-zsh

#### Submodule

Submodules are tracked in [.gitmodules](./../.gitmodules).

Init submodules:

```shell
yadm submodule init
```

Update submodules:

```shell
yadm submodule update
```

#### Curl

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

> ⚠️ If this doesn't work go to the official
> [oh-my-zsh](https://ohmyz.sh/#install) and look up the newest install command.

### [Decrypt](https://yadm.io/docs/encryption#) all gpg and ssh keys

- [How to manage gpg keys](https://github.com/TheLocehiliosan/yadm/issues/201)
- [How to manage ssh keys](https://blog.danielaguilar.org/handling-dotfiles-with-yadm/)

```shell
yadm decrypt
```

After decrypting all the files you will need to import the keys/ownertrust.

```shell
gpg --import "$HOME/.gnupg/.exported-keyring"/*.asc
gpg --import-ownertrust "$HOME/.gnupg/.exported-keyring"/ownertrust.txt
```

# My personal dotfiles

![dotfiles](https://dotfiles.github.io/images/dotfiles-logo.png)

These are my personal dotfiles I use every day. In the folder `.old-dotfiles` you can see my old dotfiles. If you find something interesting, go ahead and take whatever you want. Currently my dotfiles are only for macOS.

## Use

First of all you need yadm, this can be installed on macOS via homebrew.

### Install Homebrew

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### Install tools with Homebrew

```shell
brew bundle install --file=.Brewfile
```

### Install oh-my-zsh

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

## Clone dotfiles with [yadm](https://yadm.io/)

```shell
yadm clone https://github.com/daribock/dotfiles.git
```

## [Decrypt](https://yadm.io/docs/encryption#) all gpg and ssh keys

- [How to manage gpg keys](https://github.com/TheLocehiliosan/yadm/issues/201)
- [How to manage ssh keys](https://blog.danielaguilar.org/handling-dotfiles-with-yadm/)

```shell
yadm decrypt
```

> ⚠️ Don't forget to change permissions to `chmod 600` again

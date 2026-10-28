# My personal dotfiles

![dotfiles](https://dotfiles.github.io/images/dotfiles-logo.png)

These are my personal dotfiles I use every day on macOS, Ubuntu and WSL
(Ubuntu). They are managed with [yadm](https://yadm.io/).

## Install

A fresh machine has no SSH key yet, so clone over HTTPS first.

### macOS

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install yadm
yadm clone https://github.com/daribock/dotfiles.git --bootstrap
```

### Ubuntu / WSL

```shell
sudo apt-get update && sudo apt-get install -y yadm
yadm clone https://github.com/daribock/dotfiles.git --bootstrap
```

`yadm bootstrap` can be re-run at any time. It:

1. creates the `~/dev` folders
2. installs packages
   - macOS: [`.Brewfile`](../.Brewfile)
   - Ubuntu: [`apt.txt`](../.config/yadm/packages/apt.txt) first, then
     [`Brewfile.linux`](../.config/yadm/packages/Brewfile.linux) for what apt
     lacks, nvm via its official installer
   - Ubuntu desktop only (skipped on WSL): Chrome and VS Code from their apt
     repositories, [`apt-desktop.txt`](../.config/yadm/packages/apt-desktop.txt)
     and [`snap.txt`](../.config/yadm/packages/snap.txt)
3. installs or updates oh-my-zsh
4. makes zsh the default shell
5. generates an SSH key if there is none (see below)
6. asks whether to decrypt and import the GPG signing key
7. applies macOS settings (macOS only)

VS Code extensions and settings come from VS Code Settings Sync.

## SSH key

Every machine gets its own SSH key; no SSH key is stored in this repository.
Bootstrap runs the script automatically, or run it yourself:

```shell
~/.config/.scripts/generate-ssh-key.sh
```

It creates `~/.ssh/id_ed25519` named `darikletter@<hostname>-<date>`, asks for
a passphrase, adds the key to the agent (and to the Keychain on macOS) and
prints the public key. It never overwrites an existing key.

1. Add the printed key at <https://github.com/settings/ssh/new> using the name
   as title (or let the script do it with `gh ssh-key add` if `gh` is logged
   in).
2. Test it: `ssh -T git@github.com`
3. Switch the dotfiles remote to SSH:

   ```shell
   yadm remote set-url origin git@github.com:daribock/dotfiles.git
   ```

When a machine is retired, delete its key on
<https://github.com/settings/keys>. The key name tells you which machine it
belongs to.

## GPG signing key

Commits are signed with GPG. The key is stored in the
[yadm encrypted archive](https://yadm.io/docs/encryption). Bootstrap asks
whether to import it, so work machines can skip it. If you skip it, bootstrap
turns commit signing off for that machine in `~/.gitconfig.local`. To import
it manually:

```shell
yadm decrypt
gpg --import "$HOME/.gnupg/.exported-keyring"/*.asc
gpg --import-ownertrust "$HOME/.gnupg/.exported-keyring"/ownertrust.txt
```

After changing the key, export it with
`~/.config/.scripts/export_gpg_keyring.sh` and re-encrypt with `yadm encrypt`.

## Machine-specific settings

Anything that should only exist on one machine goes into `~/.zshrc.local` or
`~/.gitconfig.local`. They are loaded last and never tracked.

#!/usr/bin/env bash
# Generate a fresh SSH key for this machine and print it for GitHub.
# Every setup gets its own key; delete the old one on GitHub when a machine is retired.
set -euo pipefail

KEY="$HOME/.ssh/id_ed25519"
SSH_CONFIG="$HOME/.ssh/config"
COMMENT="darikletter@$(hostname -s)-$(date +%F)"

if [ -e "$KEY" ]; then
  echo "SSH key already exists at $KEY - not overwriting."
  echo "Delete it yourself (and remove it from GitHub) if you really want a new one."
  exit 1
fi

mkdir -p -m 0700 "$HOME/.ssh"

echo "Generating $KEY ($COMMENT). Pick a passphrase when asked."
ssh-keygen -t ed25519 -C "$COMMENT" -f "$KEY"

# Let the agent remember the key after first use (and Keychain on macOS)
if ! grep -qs 'AddKeysToAgent' "$SSH_CONFIG"; then
  {
    echo ""
    echo "Host *"
    echo "  AddKeysToAgent yes"
    [ "$(uname -s)" = "Darwin" ] && echo "  UseKeychain yes"
    echo "  IdentityFile ~/.ssh/id_ed25519"
  } >>"$SSH_CONFIG"
  chmod 0600 "$SSH_CONFIG"
fi

if [ "$(uname -s)" = "Darwin" ]; then
  ssh-add --apple-use-keychain "$KEY"
elif ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]; then
  ssh-add "$KEY"
fi

echo ""
echo "Public key:"
echo ""
cat "$KEY.pub"
echo ""
echo "Add it at https://github.com/settings/ssh/new (title: $COMMENT)"

if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  answer=""
  read -r -p "gh is logged in - upload the key with 'gh ssh-key add' now? [y/N] " answer || true
  if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    gh ssh-key add "$KEY.pub" --title "$COMMENT"
  fi
fi

echo ""
echo "Then test it with: ssh -T git@github.com"

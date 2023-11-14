#!/bin/sh
#
# Setup a work space called `proco-frontend` with two windows
# C-m acts like enter key in tmux
#
session="proco-frontend"

# Create new tmux sesseion called proco-frontend
tmux new-session -d -s $session -n run

# Change directory
tmux send-keys 'cd ~/dev/mediamarktsaturn/proco-frontend/ui; pnpm install; pnpm start' C-m

# Split window vertically and reduce the height of the tabto 35 percent
tmux split-window -v -p 35

# Change directory
tmux send-keys 'cd ~/dev/mediamarktsaturn/proco-local-env; make run' C-m

# Create new window to work in
tmux new-window -t $session:1 -n work

# Fetch changes from git and open vscode
tmux send-keys 'cd ~/dev/mediamarktsaturn/proco-frontend; git fetch;  code .' C-m

# Finally attach to temux session
tmux attach-session -t $session

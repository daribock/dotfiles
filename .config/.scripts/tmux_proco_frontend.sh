#!/bin/sh

# Setup a workspace called `proco-frontend` with specific windows
session="proco-frontend"

# Check if the tmux session already exists
if tmux has-session -t $session 2>/dev/null; then
    echo "Session $session already exists. Attaching..."
else
    echo "Creating session $session..."

    # Create new tmux session
    tmux new-session -d -s $session -n run

    # Setup the first window (run)
    tmux send-keys -t $session:0 'cd ~/dev/mediamarktsaturn/proco-frontend/ui; pnpm install; pnpm start' C-m

    # Split the first window vertically
    tmux split-window -t $session:0

    # Setup the split window commands
    tmux send-keys -t $session:0.1 'cd ~/dev/mediamarktsaturn/proco-local-env; podman container prune -f; podman image prune -a -f; podman volume prune -f; make run' C-m

    # Create a second window (work)
    tmux new-window -t $session:1 -n work

    # Setup the second window commands
    tmux send-keys -t $session:1 'cd ~/dev/mediamarktsaturn/proco-frontend; git fetch; code .' C-m
fi

# Attach to the tmux session
tmux attach-session -t $session


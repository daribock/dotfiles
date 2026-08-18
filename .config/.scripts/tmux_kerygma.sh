#!/bin/sh

session="kerygma"
kerygma_dir="$HOME/dev/darikletter/kerygma-live-translation"
dashboard_dir="$HOME/dev/darikletter/livekit-dashboard"

# Check if the tmux session already exists
if tmux has-session -t "$session" 2>/dev/null; then
    echo "Session $session already exists. Attaching..."
else
    echo "Creating session $session..."

    # Install dependencies before starting concurrent Node processes.
    cd "$kerygma_dir" || exit 1
    npm install || exit 1

    # Run Supabase setup and LiveKit in the first pane.
    tmux new-session -d -s "$session" -n run -c "$kerygma_dir"
    livekit_pane=$(tmux display-message -p -t "$session:run.0" '#{pane_id}')
    tmux send-keys -t "$livekit_pane" 'supabase start && npm run livekit' C-m

    # Run the Next.js development server in a second pane.
    dev_pane=$(tmux split-window -h -P -F '#{pane_id}' -t "$livekit_pane" -c "$kerygma_dir")
    tmux send-keys -t "$dev_pane" 'npm run dev' C-m

    # Run the LiveKit dashboard in a third pane.
    dashboard_pane=$(tmux split-window -v -P -F '#{pane_id}' -t "$dev_pane" -c "$dashboard_dir")
    tmux send-keys -t "$dashboard_pane" 'docker compose up' C-m
    tmux select-layout -t "$session:run" tiled >/dev/null

    # Open a second window for interactive work in Kerygma.
    tmux new-window -t "$session" -n work -c "$kerygma_dir"
fi

# Attach to the tmux session
exec tmux attach-session -t "$session"


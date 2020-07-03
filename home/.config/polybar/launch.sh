#!/bin/sh

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
#while pkill  >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar main &

echo "Polybar launched..."

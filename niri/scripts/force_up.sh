#!/bin/bash

# 1. Get details about the currently focused workspace
WORKSPACES=$(niri msg -j workspaces)
FOCUSED_WS=$(echo "$WORKSPACES" | jq '.[] | select(.is_focused == true)')

CURRENT_IDX=$(echo "$FOCUSED_WS" | jq '.idx')
CURRENT_OUTPUT=$(echo "$FOCUSED_WS" | jq -r '.output')

# 2. If we are NOT at the top (Index 1), just use standard Niri action
if [ "$CURRENT_IDX" -gt 1 ]; then
    niri msg action move-column-to-workspace-up
    exit 0
fi

# 3. If we ARE at Index 1, we need to "Insert Before"
# Find the highest index on the CURRENT monitor
MAX_IDX=$(echo "$WORKSPACES" | jq --arg out "$CURRENT_OUTPUT" '[.[] | select(.output == $out) | .idx] | max')
NEW_IDX=$((MAX_IDX + 1))

# Step A: Move the column to the NEW bottom workspace.
# Niri automatically focuses the new workspace.
niri msg action move-column-to-workspace $NEW_IDX

# Step B: Move this new workspace (which is currently at the bottom) to Index 1.
# This shifts all other workspaces down by one.
niri msg action move-workspace-to-index 1

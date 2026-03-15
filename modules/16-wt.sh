#!/usr/bin/env bash

# wt CLI - Git Worktree Directory Switching
# https://github.com/yourusername/worktree-cli

# Check if wt binary exists
if command -v wt >/dev/null 2>&1; then

    # Find the actual wt binary path
    WT_BIN=$(command -v wt)

    # 🚀 wt function for true directory switching
    # This function overrides the wt binary to support real directory switching
    wt() {
        case "$1" in
            switch|co)
                # Handle switch/co commands for true directory switching
                shift
                local wt_cli="$WT_BIN"  # Use the actual binary path

                # Get the path from wt switch command
                local path
                path=$($wt_cli switch "$@" 2>/dev/null)

                # Check if we got a valid path (absolute path starts with /)
                if [[ "$path" = /* ]] && [[ -d "$path" ]]; then
                    cd "$path" || return 1
                    echo "✅ Switched to: $path"
                else
                    # Let the original command handle errors and display
                    $wt_cli switch "$@"
                fi
                ;;
            *)
                # Pass all other commands to wt binary (use full path to avoid recursion)
                "$WT_BIN" "$@"
                ;;
        esac
    }

    # Convenience alias
    alias wtco='wt co'  # Quick switch to worktree
    alias wtl='wt switch --list'  # List all worktrees

else
    # wt binary not found - show installation message once
    if [[ -z "$WT_SHOWN_MISSING" ]]; then
        echo "⚠️  wt CLI not found in PATH"
        echo "Install: go build -o wt main.go && sudo mv wt /usr/local/bin/wt"
        export WT_SHOWN_MISSING=1
    fi
fi

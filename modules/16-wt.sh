#!/usr/bin/env bash

# wt CLI - Git Worktree Directory Switching
# Shell function for true directory switching with wt binary

# Check if wt binary exists
if command -v wt >/dev/null 2>&1; then

    # Store the actual wt binary path to avoid recursion
    WT_BIN=$(command -v wt)

    # wt function for directory switching
    wt() {
        case "$1" in
            switch|co)
                shift
                local path
                path=$($WT_BIN switch "$@" 2>/dev/null)

                # Check if we got a valid path
                if [[ "$path" = /* ]] && [[ -d "$path" ]]; then
                    cd "$path" || return 1
                    echo "✅ Switched to: $path"
                else
                    # Show errors from the binary
                    $WT_BIN switch "$@"
                fi
                ;;
            *)
                # Pass all other commands to wt binary
                "$WT_BIN" "$@"
                ;;
        esac
    }

else
    # wt binary not found - show installation message once
    if [[ -z "$WT_SHOWN_MISSING" ]]; then
        echo "⚠️  wt CLI not found in PATH"
        echo "Install: go build -o wt main.go && sudo mv wt /usr/local/bin/wt"
        export WT_SHOWN_MISSING=1
    fi
fi

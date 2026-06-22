#!/usr/bin/env bash
# Emit workmux agent counts (working/waiting/done) for the tmux status bar.
# Colours are left to the surrounding tmux style (inherits active-tab fg/bg).

json=$(workmux status --json 2>/dev/null) || exit 0
[ -z "$json" ] && exit 0

read -r working waiting done < <(
    printf '%s' "$json" | jq -r '
        reduce .[].status as $s ({working:0, waiting:0, done:0};
            if .[$s] != null then .[$s] += 1 else . end)
        | "\(.working) \(.waiting) \(.done)"'
) 2>/dev/null
[ -z "$working" ] && exit 0

printf '🤖 %s 💬 %s ✅ %s' "$working" "$waiting" "$done"

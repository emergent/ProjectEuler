#!/bin/bash
RUNTIME=${1:-"bun run"} # or ts-node or bun
for f in problem*.ts; do
    echo "$f" "$($RUNTIME "$f")"
done

#!/bin/bash

PROJECT_DIR=$(realpath $(dirname $0))

cd "$PROJECT_DIR"
uv build

if [[ -n "$1" && -d "$1" ]]; then
    WORKDIR="$1"
    echo "Using provided directory: $WORKDIR"
else
    # 2. Create a temporary directory if $1 is missing or invalid
    WORKDIR=$(mktemp -d)
    echo "No valid directory provided. Created temp dir: $WORKDIR"
fi

cd $WORKDIR;
uv init && uv add ty
uv pip install "${PROJECT_DIR}/dist/"*".whl"
cat <<EOF > script.py
from ty_generated_typestubs import add as tadd

tadd("2", 2)
EOF

uv run ty check

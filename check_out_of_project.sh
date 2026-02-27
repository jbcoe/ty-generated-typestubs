#!/bin/bash

PROJECT_DIR=$(realpath $(dirname $0))

cd "$PROJECT_DIR"
uv build

if [[ -n "$1" && -d "$1" ]]; then
    WORKDIR="$1"
    echo "Using provided directory: ${WORKDIR}"
else
    # 2. Create a temporary directory if $1 is missing or invalid
    WORKDIR=$(mktemp -d)
    echo "No valid directory provided. Created temp dir: ${WORKDIR}"
fi

cp "${PROJECT_DIR}/script.py" "${WORKDIR}/script.py"

cd ${WORKDIR};
uv init && uv add ty pip
uv run pip install "${PROJECT_DIR}/dist/"*".whl"

echo ================================================================================

echo Running type checks with ty ...
uv run ty check

echo ================================================================================

#!/bin/bash
set -euo pipefail

# Only run in remote Claude Code on the web sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install htmlhint for HTML linting (uses npm global cache across sessions)
if ! command -v htmlhint &>/dev/null; then
  npm install -g htmlhint --prefer-offline 2>&1 || npm install -g htmlhint 2>&1
fi

echo "Session start hook complete. htmlhint $(htmlhint --version 2>/dev/null || echo 'ready')."

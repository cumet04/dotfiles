#!/bin/bash

rsync -av \
  "$HOME/.claude/projects/" \
  "$HOME/.local/claude-sessions/"

# Cluade Desktopのセッションログ参照の復元
rsync -av "$HOME/.claude/projects/" "/opt/winhome/.claude/projects/"

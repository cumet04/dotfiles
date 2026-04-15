#!/bin/bash

rsync -av \
  "$HOME/.claude/projects/" \
  "$HOME/.local/claude-sessions/"

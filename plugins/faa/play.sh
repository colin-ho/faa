#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AUDIO_FILE="$SCRIPT_DIR/faa.mp3"

case "$(uname -s)" in
  Darwin)
    # macOS
    afplay "$AUDIO_FILE" &
    ;;
  Linux)
    # Linux - try common players
    if command -v mpv &> /dev/null; then
      mpv --no-video "$AUDIO_FILE" &> /dev/null &
    elif command -v paplay &> /dev/null; then
      paplay "$AUDIO_FILE" &> /dev/null &
    elif command -v aplay &> /dev/null; then
      aplay "$AUDIO_FILE" &> /dev/null &
    elif command -v ffplay &> /dev/null; then
      ffplay -nodisp -autoexit "$AUDIO_FILE" &> /dev/null &
    fi
    ;;
  MINGW*|MSYS*|CYGWIN*)
    # Windows (Git Bash / WSL)
    powershell.exe -c "(New-Object Media.SoundPlayer '$AUDIO_FILE').PlaySync()" &
    ;;
esac

exit 0

# faa

A Claude Code plugin that plays a "faa" sound effect whenever a tool call fails.

## Installation

Add the marketplace and install the plugin via the Claude Code CLI:

```bash
claude plugin marketplace add colin-ho/faa
claude plugin install faa
```

### Audio player requirements

- **macOS**: No extra dependencies (`afplay` is built-in).
- **Linux**: Requires one of `mpv`, `paplay`, `aplay`, or `ffplay`.
- **Windows** (Git Bash / WSL): Uses PowerShell's `Media.SoundPlayer`.

## How it works

faa registers a `PostToolUseFailure` hook that matches all tools (`*`). When any tool call fails, it runs `play.sh`, which detects your OS and plays `faa.mp3` using an available audio player.

# HyperWhisper Claude Code Plugin

Voice integration between HyperWhisper and Claude Code.

When Claude Code finishes, asks a question, or requests permission, HyperWhisper can pop up with the current context. Dictate or type a response and the hook sends it back to Claude Code.

## Installation

```bash
curl -fsSL https://hyperwhisper.com/install-claude-code.sh | bash
```

Manual install:

```bash
claude plugin marketplace add hyperwhisper-app/hyperwhisper-claude-code
claude plugin install hyperwhisper@hyperwhisper
```

Restart Claude Code after installation.

## How It Works

The plugin registers Claude Code hooks that call:

```bash
/Applications/HyperWhisper.app/Contents/Resources/claude-hook
```

The hook writes update JSON to:

```bash
~/Library/Application Support/hyperwhisper/agent/inbox
```

and exchanges long-form context and responses through:

```bash
/tmp/hyperwhisper-agent
```

HyperWhisper watches the inbox, opens the response panel, records/transcribes your voice reply, writes the response file, and the hook returns the response to Claude Code.


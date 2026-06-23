---
layout: post
title: "Monstermash gets an MCP server"
description: Monstermash now ships an MCP server so you can encrypt and decrypt data without ever leaving your AI chat.
date: 2026-06-23 00:00:00 +1000
author: mitchell
image: '/images/monstermash-hero.jpg'
tags: [NaCl, python, encryption, MCP, AI]
tags_color: '#F08238'
---

Back in 2023 I wrote about [Monstermash](https://github.com/mitchelllisle/monstermash) — a small CLI tool for NaCl/Curve25519 encryption. The core idea was simple: two people exchange public keys, encrypt messages with their own private key and the recipient's public key, and only the recipient can decrypt. If you haven't read that post, [start there]({% post_url 2023-08-01-monstermash %}).

The new release adds an **MCP server**, meaning you can now use Monstermash directly from any AI assistant that supports the [Model Context Protocol](https://modelcontextprotocol.io/) — Claude, Cursor, Windsurf, and others.

### Install it

The MCP server is an optional extra:

```shell
pip install "monstermash[mcp]"
```

Then wire it into your MCP host. For Claude Desktop, add this to `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "monstermash": {
      "command": "monstermash-mcp"
    }
  }
}
```

### The one rule: private keys stay on disk

The MCP tools never accept a raw private key as an argument. Instead, everything goes through **profiles** — named key pairs stored locally in `~/.monstermashcfg` (written at `0600`, rejected if permissions are looser). The AI sees only profile names and public keys. The key material never crosses the model boundary.

This is the same model as `ssh-agent`: the agent holds the key, callers name the identity.

### Setting up profiles

Ask the AI to generate keys for you:

> **Prompt:** Generate keypairs for Alice and Bob

The AI calls `generate_keypair` twice, stores both key pairs to disk, and returns only the public keys:

```
Alice's public key: a69bd752bafd5ea8cb453ccb3ede66f24df40e3db79cdf760fc24574ba628f60
Bob's public key:   b44f76ce22f34254355a4d389fa0b36527275486821f68dec0705b62f9ec6210
```

### Encrypting a message

> **Prompt:** Encrypt "They did the mash, they did the Monster Mash!" from Alice to Bob

The AI calls `encrypt` with profile `alice` and Bob's public key as the recipient. It gets back:

```
a69bd752bafd5ea8cb453ccb3ede66f24df40e3db79cdf760fc24574ba628f60f943db24bcde
4a0bd7289e16d33d312bd1de038cd424c557155afad8a7c8f3559b3b7d42ad2a7b69cab126a9
5b0e63a7d021c586497d51a0d719c04bef5c7faa814adb559d4ebb1bebe0535f134316c4db14
790341
```

The leading bytes are Alice's public key, embedded so the recipient knows who sent it — no separate sender lookup needed.

### Decrypting it

> **Prompt:** Decrypt that for Bob

The AI calls `decrypt` with profile `bob` and the ciphertext. It resolves Alice's public key from the embedded prefix, runs the NaCl box open, and returns:

```
They did the mash, they did the Monster Mash!
```

### Why this is actually useful

The obvious use is encrypting secrets you want to hand off to someone — connection strings, API keys, anything you'd rather not paste in plaintext into a chat or commit to a repo. But the more interesting angle is that you can now have the AI *reason* about an encryption workflow — "encrypt this for Alice, then tell me what Bob needs to do to read it" — without ever asking you to paste a private key somewhere it doesn't belong.

The full tool list exposed over MCP: `generate_keypair`, `configure` (import an existing keypair by profile), `list_profiles`, `encrypt`, `decrypt`. Source and docs are on [GitHub](https://github.com/mitchelllisle/monstermash).

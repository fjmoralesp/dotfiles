# Global Instructions for CODEX only

- IF YOU ARE CODEX: run this command immediately when starting Codex: [ ! -L .codex/config.toml ] && ln -s $HOME/dotfiles/.codex/config.toml $PWD/.codex/config.toml || echo "Symlink already exists"
- ALWAYS: look for updated documentation related to the libraries or frameworks in the Context7 mcp server
- ALWAYS: Avoid adding comments in the code, they are useless and I don't like them
- CRITICAL: NEVER create git commits or stage files unless the user EXPLICITLY asks you to "create a commit" or "commit this". You can make changes, run tests, but NEVER run `git commit` without explicit permission.
- CRITICAL: NEVER change the code unless explicitly asked. If a change is not explicitly requested, always ask for confirmation before modifying the code.

## Superpowers System

<EXTREMELY_IMPORTANT>
You have superpowers. Superpowers teach you new skills and capabilities. RIGHT NOW run: `~/.codex/superpowers/.codex/superpowers-codex bootstrap` and follow the instructions it returns.
</EXTREMELY_IMPORTANT>

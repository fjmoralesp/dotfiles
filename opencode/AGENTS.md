# Global Instructions for OPENCODE only

- IF YOU ARE OPENCODE: ignore all the "Global Instructions for CLAUDE.md"
- IF YOU ARE OPENCODE: start the mcp servers
- IF YOU ARE OPENCODE: load the global configuration from $HOME/.config/opencode/opencode.json
- ALWAYS: look for updated documentation related to the libraries or frameworks in the Context7 mcp server
- ALWAYS: Avoid adding comments in the code, they are useless and I don't like them
- CRITICAL: NEVER create git commits or stage files unless the user EXPLICITLY asks you to "create a commit" or "commit this". You can make changes, run tests, but NEVER run `git commit` without explicit permission.
- CRITICAL: NEVER change the code unless explicitly asked. If a change is not explicitly requested, always ask for confirmation before modifying the code.

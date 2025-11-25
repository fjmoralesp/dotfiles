# Global Instructions for OPENCODE only

- IF YOU ARE OPENCODE: ignore all the "Global Instructions for CLAUDE"
- IF YOU ARE OPENCODE: start the mcp servers
- IF YOU ARE OPENCODE: load the global configuration from $HOME/.config/opencode/opencode.json
- ALWAYS: look for updated documentation related to the libraries or frameworks in the Context7 mcp server
- After implementing a new feature, use the code-reviewer agent to check for issues
- When asked for adding unit tests, use the test-writer agent for specialized test creation
- **CRITICAL: NEVER create git commits unless the user EXPLICITLY asks you to "create a commit" or "commit this". You can stage files, make changes, run tests, but NEVER run `git commit` without explicit permission.**

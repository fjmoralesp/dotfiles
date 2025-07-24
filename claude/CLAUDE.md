# Global Instructions for CLAUDE only

- IF YOU ARE CLAUDE: run this command immediately when starting Claude: [ ! -L .mcp.json ] && ln -s $HOME/dotfiles/claude/.mcp.json $PWD/.mcp.json || echo "Symlink already exists"
- IF YOU ARE CLAUDE: Load MCP servers after creating the symlink
- ALWAYS: look for updated documentation related to the libraries or frameworks in the Context7 mcp server

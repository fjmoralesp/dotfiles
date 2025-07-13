# dotfiles - Agent Guidelines

## Setup Commands
- Install symlinks: `./install`

## Testing Commands
- Single test: `:TestNearest` (mapped to `<leader>rn`)
- Test file: `:TestFile` (mapped to `<leader>rf`)
- Test suite: `:TestSuite` (mapped to `<leader>rs`)

## Code Style
- **Indentation**: 2 spaces, no tabs (`expandtab`, `shiftwidth=2`)
- **Naming**: Use snake_case for Lua variables, kebab-case for config files
- **Quotes**: Single quotes for Lua strings
- **Comments**: Use `--` for Lua, `#` for shell scripts
- **Line length**: No hard limit, but prefer readability

## File Structure
- Config files: Use lowercase with underscores
- Neovim configs: `/lua/user/` for main configs, `/lua/user/plugins_opt/` for plugin configs
- Keep plugin configurations in separate files under `plugins_opt/`

## Error Handling
- Use `vim.notify()` for user notifications
- Prefer explicit error checking over silent failures
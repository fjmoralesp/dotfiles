local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use 

-- Packer can manage itself.
use('wbthomason/packer.nvim')

-- Git integration
use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb'
})

use({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({ current_line_blame = true })
    vim.keymap.set('n', 'm', ':Gitsigns next_hunk<CR>')
    vim.keymap.set('n', 'M', ':Gitsigns prev_hunk<CR>')
    vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
  end,
})

-- Material theme and other visual plugins
use({
  'marko-cerovac/material.nvim',
  config = function()
    require('material').setup({
      plugins = {
        'nvim-tree',
        'nvim-web-devicons',
        'rainbow-delimiters',
        'telescope',
      },
    })
    vim.g.material_style = 'deep ocean'
    vim.cmd('colorscheme material')
  end,
})

use({
  'itchyny/lightline.vim',
  config = function()
    vim.g.lightline = {
      colorscheme = 'material',
      active = {
        left = {
          {'mode', 'paste'},
          {'gitbranch', 'readonly', 'filename', 'modified'}
        }
      },
      component_function = {
        gitbranch = 'FugitiveHead'
      }
    }
  end,
})

-- Fonts
use('nvim-tree/nvim-web-devicons')

-- File navigation
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
  },
  config = function()
    require('user/plugins_opt/telescope')
  end,
})

-- File tree sidebar
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user/plugins_opt/nvimtree')
  end,
})

-- Last location when opening a file.
use('farmergreg/vim-lastplace')

-- Commenting support.
use('tpope/vim-commentary')

-- Ident autodetection with editorconfig support.
use('tpope/vim-sleuth')

-- Add more languages.
use('sheerun/vim-polyglot')

-- Enable * searching with visually selected text.
use('nelstrom/vim-visual-star-search')

-- Automatically add closing brackets, quotes, etc.
use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

-- Split arrays and methods onto multiple lines, or join them back up.
use({
  'AndrewRadev/splitjoin.vim',
  config = function()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    vim.g.splitjoin_trailing_comma = 1
  end,
})

-- Automatically fix identation when pasting code.
use({
  'sickill/vim-pasta',
  config = function()
    vim.g.pasta_disabled_filetypes = { 'fugitive' }
  end,
})

-- Floating terminal.
use({
  'voldikss/vim-floaterm',
  config = function()
    vim.g.floaterm_wintype = 'split'
    vim.g.floaterm_height = 0.4
    vim.keymap.set('n', '<A-1>', ':FloatermToggle<CR>')
    vim.keymap.set('t', '<A-1>', '<C-\\><C-n>:FloatermToggle<CR>')
  end,
})

-- Improved syntax highlighting
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'HiPhish/rainbow-delimiters.nvim',
  },
  config = function()
    require('user/plugins_opt/treesitter')
  end,
})

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

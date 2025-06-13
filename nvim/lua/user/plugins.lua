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
    vim.keymap.set('n', 'gR', ':Gitsigns reset_hunk<CR>')
  end,
})

use({
  'NeogitOrg/neogit',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('neogit').setup({
      integrations = {
        telescope = true,
      }
    })
    vim.keymap.set('n', '<A-2>', ':Neogit<CR>')
  end,
})

use({
  'almo7aya/openingh.nvim',
  config = function()
    require('openingh').setup()

    -- for repository page
    vim.keymap.set('n', '<leader>gr', ':OpenInGHRepo<CR>')

    -- for current file page
    vim.keymap.set('n', '<leader>gf', ':OpenInGHFile<CR>')
    vim.keymap.set('v', '<leader>gf', ':OpenInGHFileLines<CR>')
  end,
})

-- Theme and other visual plugins.
use({
  'sainnhe/gruvbox-material',
  requires = {
    'sheerun/vim-polyglot',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    vim.cmd('set background=light')
    -- vim.cmd('set background=dark')
    -- Set contrast.
    -- This configuration option should be placed before `colorscheme gruvbox-material`.
    -- Available values: 'hard', 'medium'(default), 'soft'
    vim.g.gruvbox_material_background = 'hard'
    vim.cmd.colorscheme('gruvbox-material')
  end,
})

use({
  'nvim-lualine/lualine.nvim',
  requires = {
    'nvim-tree/nvim-web-devicons',
    opt = true,
  },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'gruvbox-material',
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
            shorting_target = 40,
          },
        },
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
        },
      },
    })
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
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    'OliverChao/telescope-picker-list.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'piersolenski/telescope-import.nvim',
  },
  config = function()
    require('user/plugins_opt/telescope')
  end,
})

-- qfix list
use({'kevinhwang91/nvim-bqf'})

use({
  'AckslD/nvim-neoclip.lua',
  requires = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('neoclip').setup()
    vim.keymap.set('n', '<leader>tp', ':Telescope neoclip<CR>')
  end,
})

-- File tree navigation
use({
  'stevearc/oil.nvim',
  config = function()
    require('user/plugins_opt/oil')
  end,
})

use({
  'refractalize/oil-git-status.nvim',
  after = {
    'oil.nvim',
  },
  config = function()
    require('oil-git-status').setup()
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

-- Improve search.
use('nelstrom/vim-visual-star-search') -- Enable * searching with visually selected text.
use('mg979/vim-visual-multi') -- Multiline cursor.
use({
  'folke/flash.nvim',
  config = function()
    require('flash').setup()
    require('flash').toggle(true)
    -- Key mappings
    vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash' })
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
    vim.keymap.set('o', 'r', function() require('flash').remote() end, { desc = 'Remote Flash' })
    vim.keymap.set({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter Search' })
  end,
})

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
    -- gS: split
    -- gJ: join
  end,
})

use({
  'nicwest/vim-camelsnek',
  config = function()
    vim.keymap.set('v', 'gss', ':Snek<CR>')
    vim.keymap.set('v', 'gsC', ':Camel<CR>')
    vim.keymap.set('v', 'gsc', ':CamelB<CR>')
    vim.keymap.set('v', 'gsk', ':Kebab<CR>')
    vim.keymap.set('v', 'gsS', ':Screm<CR>')
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
  branch = 'master',
  run = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
  requires = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'HiPhish/rainbow-delimiters.nvim',
  },
  config = function()
    require('user/plugins_opt/treesitter')
  end,
})

-- Language Server Protocol.
use({
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('user/plugins_opt/lspconfig')
  end,
})

-- Testing helper
use({
  'vim-test/vim-test',
  config = function()
    require('user/plugins_opt/vimtest')
  end,
})

-- Copilot
use({
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,
})

use({
  'zbirenbaum/copilot-cmp',
  after = { 'copilot.lua' },
  config = function()
    require('copilot_cmp').setup()
  end,
})

use({
  'CopilotC-Nvim/CopilotChat.nvim',
  requires = {
    'zbirenbaum/copilot.lua',
    'nvim-lua/plenary.nvim',
  },
  config = function ()
    require('CopilotChat').setup({
      model = 'claude-3.7-sonnet', -- claude-sonnet-4
      context = 'buffers',
    })
    vim.keymap.set('n', '<leader>cc', ':CopilotChatToggle<CR>')
    vim.keymap.set('n', '<leader>cm', ':CopilotChatModels<CR>')
  end
})

-- IA
use({
  'olimorris/codecompanion.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/codecompanion-history.nvim',
  },
  config = function()
    require('user/plugins_opt/codecompanion')
  end
})

use({
  'MeanderingProgrammer/render-markdown.nvim',
  after = { 'nvim-treesitter' },
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require('render-markdown').setup({
      file_types= { 'markdown', 'codecompanion', 'copilot-chat' },
    })
  end,
})

-- Completition
use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('user/plugins_opt/cmp')
  end
})

-- DAP
use({
  'rcarriga/nvim-dap-ui',
  requires = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    require('user/plugins_opt/dap')
  end
})

-- Tmux
use('christoomey/vim-tmux-navigator')

-- Java
use({
  'mfussenegger/nvim-jdtls',
  requires = {
    'nvim-dap',
  }
})

-- DB manager
use({
  'kristijanhusak/vim-dadbod-ui',
  requires = {
    'tpope/vim-dadbod',
    'kristijanhusak/vim-dadbod-completion',
  },
  config = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.keymap.set('n', '<A-3>', ':DBUIToggle<CR>')
  end,
})

-- Hints
use({
 'folke/which-key.nvim',
  config = function()
    require('which-key').setup({
      preset = 'helix'
    })
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

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.wrap = false
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.showmatch = true     -- Highlight matching parenthesis
vim.opt.autowrite = true     -- Automatically save before :next, :make etc.
vim.opt.autochdir = true     -- Change CWD when I open a file
vim.opt.mouse = 'a'                -- Enable mouse support
vim.opt.clipboard = 'unnamedplus'  -- Copy/paste to system clipboard
vim.opt.swapfile = false           -- Don't use swapfile
vim.opt.ignorecase = true          -- Search case insensitive...
vim.opt.smartcase = true           -- ... but not it begins with upper case 

-- Indent Settings
vim.opt.expandtab = true  -- expand tabs into spaces
vim.opt.shiftwidth = 2    -- number of spaces to use for each step of indent.
vim.opt.tabstop = 2       -- number of spaces a TAB counts for
vim.opt.autoindent = true -- copy indent from current line when starting a new line
vim.opt.wrap = true
vim.opt.autochdir = true     -- Change CWD when I open a file

-- Fast saving
vim.keymap.set('n', '<Leader>w', ':write!<CR>')
vim.keymap.set('n', '<C-s>', ':write!<CR>')
vim.keymap.set('n', '<Leader>q', ':q<CR>', { silent = true })
vim.keymap.set('n', '<Leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>')

-- Better split switching
vim.keymap.set('', '<C-j>', '<C-W>j')
vim.keymap.set('', '<C-k>', '<C-W>k')
vim.keymap.set('', '<C-h>', '<C-W>h')
vim.keymap.set('', '<C-l>', '<C-W>l')

vim.keymap.set('i', '<C-c>', '<ESC>')

-- Remove search highlight
vim.keymap.set('n', '<Leader><space>', ':nohlsearch<CR>')

-- Go uses gofmt, which uses tabs for indentation and spaces for aligment.
-- Hence override our indentation rules.
vim.api.nvim_create_autocmd('Filetype', {
  group = vim.api.nvim_create_augroup('setIndent', { clear = true }),
  pattern = { 'go' },
  command = 'setlocal noexpandtab tabstop=4 shiftwidth=4'
})

-- automatically resize all vim buffers if I resize the terminal window
vim.api.nvim_command('autocmd VimResized * wincmd =')


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "fatih/vim-go", lazy = false },
    { "ctrlpvim/ctrlp.vim", lazy = false },
    { "vim-airline/vim-airline", lazy = false },
    { "vim-airline/vim-airline-themes", lazy = false },
    { "jeetsukumaran/vim-buffergator", lazy = false },
    { "tpope/vim-fugitive", lazy = false },
    { "easymotion/vim-easymotion", lazy = false },
    { "scrooloose/nerdcommenter", lazy = false },
    { "elzr/vim-json", lazy = false },
    { "avakhov/vim-yaml", lazy = false },
    --{ "scrooloose/nerdtree", lazy = false },
    { "mhartington/oceanic-next", lazy = false },
    {
      'dinhhuy258/git.nvim',
      config = function ()
        require("git").setup()
      end,
    },

    -- Telescope for fuzzy finding
    {
      'nvim-telescope/telescope.nvim', branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }

  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fgb', builtin.git_branches, { desc = 'Telescope git branches' })
vim.keymap.set('n', '<leader>fgs', builtin.git_status, { desc = 'Telescope git status' })

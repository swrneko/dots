local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    			}
		},
	{'nvim-treesitter/nvim-treesitter'},
	{'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/nvim-cmp'},
    {"williamboman/mason.nvim", build = ":MasonUpdate"},
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
                                  branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
    {'jose-elias-alvarez/null-ls.nvim'},
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}
    },
     {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
        }
    },
    {'folke/which-key.nvim'},
    {'terrortylor/nvim-comment'},
    {'MaximilianLloyd/ascii.nvim', 
    dependencies = {'MunifTanjim/nui.nvim'}
    },
    {
    'MeanderingProgrammer/dashboard.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        { 'MaximilianLloyd/ascii.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },
    },
    config = function()
        require('dashboard').setup({
            header = require('ascii').art.text.neovim.default2,
            date_format = '%Y-%m-%d %H:%M:%S',
            directories = {
                '~/',
                '~/.config',
                '~/Projects',
                },
            highlight_groups = {
                header = 'Repeat',
                icon = 'Type',
                directory = 'Delimiter',
                hotkey = 'Statement',
                },
            })
        end,
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
})

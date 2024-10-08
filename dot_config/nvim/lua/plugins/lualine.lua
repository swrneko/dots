-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.
-- stylua: ignore
 local colors = {
  blue   = '#714be3',
  cyan   = '#a42ff7',
  black  = '#000000000',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#7910c4',
  grey   = '#151720',
}

local bubbles_theme = {
    normal = {
        a = {fg = colors.black, bg = colors.violet},
        b = {fg = colors.white, bg = colors.grey},
        c = {fg = colors.black, bg = colors.black}
    },

    insert = {a = {fg = colors.black, bg = colors.blue}},
    visual = {a = {fg = colors.black, bg = colors.cyan}},
    replace = {a = {fg = colors.black, bg = colors.red}},

    inactive = {
        a = {fg = colors.white, bg = colors.black},
        b = {fg = colors.white, bg = colors.black},
        c = {fg = colors.black, bg = colors.black}
    }
}

require('lualine').setup {
    options = {
        theme = bubbles_theme, 
        component_separators = '|',
        section_separators = {left = '', right = ''}
    },
    sections = {
        lualine_a = {{'mode', separator = {left = ''}, right_padding = 2}},
        lualine_b = {
            'filename', 'branch'
            -- require("lsp-progress").progress  
        },
        lualine_c = {'fileformat'},
        lualine_x = {},
        lualine_y = {'filetype', 'progress'},
        lualine_z = {
            {'location', separator = {right = ''}, left_padding = 2}
        }
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'location'}
    },
    tabline = {},
    extensions = {}
}

vim.cmd([[
augroup lualine_augroup
    autocmd!
    autocmd User LspProgressStatusUpdated lua require("lualine").refresh()
augroup END
]])

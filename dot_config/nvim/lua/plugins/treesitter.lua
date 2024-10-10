require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "rust", "python", "c_sharp", "haskell", "json", "php", "java", "javascript", "html", "css" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
	},
}

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.config',
  opts = {
    ensure_installed = { 'c', 'cpp', 'python', 'rust', 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline' },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
}

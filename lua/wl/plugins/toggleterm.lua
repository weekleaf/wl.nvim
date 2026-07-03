return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      {
        "<leader>tt",
        "<cmd>ToggleTerm direction=float<cr>",
        mode = { "n" },
        desc = "Toggle float terminal",
      },
    },
    opts = {
      direction = "float",
      close_on_exit = false,
      float_opts = {
        border = "curved",
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
      },
    },
  },
}

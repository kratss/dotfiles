return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = {
          "css",
          "html",
        },
      },
      ensure_installed = {
        "cpp",
        "css",
        "fish",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        "latex",
        "make",
        "passwd",
        "scss",
        "sway",
        "todotxt",
        "vimdoc",
      },
    },
  },
}

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
        },
        window = {
          mappings = {
            ["."] = "toggle_hidden",
            ["l"] = "open",
            ["L"] = "open_nofocus",
            ["P"] = "focus_preview",
          },
        },
      },
      window = {
        mappings = {
          ["."] = "toggle_hidden", -- For testing This dont belong here
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
    --
    -- Is this really needed? I think it is not but https://github.com/folke/lazy.nvim#%EF%B8%8F-lazy-key-mappings
    config = function(_, opts)
      require("neo-tree").setup(opts)
    end,
  },
}

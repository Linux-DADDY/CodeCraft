local M = {}

M.config = function()
  local tree_icons = require("user.kind").nvim_tree_icons
  require("neo-tree").setup {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_diagnostics = false,
    source_selector = {
      winbar = true,
      separator_active = " ",
      statusline = false,
      sources = {
        {
          source = "filesystem",
          display_name = "              󰉓 Files    ",
        },
        -- {
        --   source = "buffers",
        --   display_name = " 󰈙 Buffers ",
        -- },
        -- {
        --   source = "git_status",
        --   display_name = " 󰊢 Git ",
        -- },
      },
    },
    enable_git_status = false,
    git_status_async = true,
    nesting_rules = {
      ["dart"] = { "freezed.dart", "g.dart" },
    },
    default_component_configs = {
      indent = {
        padding = 0,
        with_expanders = false,
      },
      icon = {
        folder_closed = tree_icons.folder.default,
        folder_open = tree_icons.folder.open,
        folder_empty = tree_icons.folder.empty_open,
      },
      modified = {
        symbol = " ",
      },
      git_status = {
        symbols = tree_icons.git,
      },
    },
    window = {
      position = "right",
      width = 35,
    },
    filesystem = {
      group_empty_dirs = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = false,
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "node_modules",
          "__pycache__",
        },
        never_show = {
          ".DS_Store",
        },
      },
      window = {
        width = 35,
        mappings = {
          ["h"] = "navigate_up",
          ["l"] = "open",
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        },
      },
      follow_current_file = {
        enabled = true,          -- Whether to follow by default
        auto_open = false,       -- Whether to automatically open the file
        trigger_on_write = true, -- Whether to follow on file write
      },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
    },
    git_status = {
      window = {
        position = "float",
      },
    },
    event_handlers = {
      {
        event = "vim_buffer_enter",
        handler = function(_)
          if vim.bo.filetype == "neo-tree" then
            vim.wo.signcolumn = "auto"
          end
        end,
      },
    },
  }
end

return M

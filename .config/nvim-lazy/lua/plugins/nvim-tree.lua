return {

  {
    "nvim-tree/nvim-tree.lua",
    -- commit = "914a6868cb7e5318ed0380f6fe2a44d11c01e45d",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        opts = { override = {}, default = true },
      },
    },
    cmd = "NvimTreeToggle",
    opts = {
      filters = { dotfiles = false },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      view = {
        adaptive_size = true,
        side = "left",
        width = 25,
      },
      git = {
        enable = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "name",
        root_folder_label = false,

        indent_markers = {
          enable = true,
        },

        icons = {
          symlink_arrow = "  ",
          show = {
            file = true,
            folder = false,
            folder_arrow = true,
            git = false,
          },

          glyphs = {
            folder = {
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    },
  },
}

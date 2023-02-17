return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup({
                    override = {},
                    default = true,
                })
            end,
        },
    },
    cmd = "NvimTreeToggle",
    config = function()
        --
        require("nvim-tree").setup({
            filters = {
                dotfiles = false,
            },
            disable_netrw = true,
            hijack_netrw = true,
            open_on_setup = false,
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
                hide_root_folder = true,
                mappings = {
                    list = {
                        { key = "<C-v>", action = "" },
                        { key = "<C-x>", action = "" },
                        { key = "<A-v>", action = "vsplit" },
                        { key = "<A-h>", action = "split" },
                    },
                },
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
        })
    end,
}

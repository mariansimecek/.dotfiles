return { "nvim-lualine/lualine.nvim",
  config = function()
    local mode = require "lualine.utils.mode"
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = {
          normal = {
            a = 'StatusNormal',
            b = 'NormalNC',
            c = 'NormalNC',
            x = 'NormalNC',
            y = 'NormalNC',
            z = 'NormalNC',
          },
          insert = { a = 'StatusInsert' },
          visual = { a = 'StatusVisual' },
          replace = { a = 'StatusReplace' },
          terminal = { a = 'StatusTerminal' },
          inactive = {
            a = 'CodeBlock',
            b = 'CodeBlock',
            c = 'CodeBlock',
          },
        },
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {}
      },
      sections = {
        lualine_a = { {
          function()
            local m = mode.get_mode()
            if m == "NORMAL" then return "RW"
            elseif m == "VISUAL" then return "VIS"
            elseif m == "SELECT" then return "SEL"
            elseif m == "INSERT" then return "INS"
            elseif m == "REPLACE" then return "REP"
            elseif m == "COMMAND" then return "CMD"
            elseif m == "EX" then return "EX"
            elseif m == "TERMINAL" then return "TER"
            else return m
            end
          end,
        }, },
        lualine_b = { {
          'filename',
          file_status = true, -- displays file status (readonly status, modified status)
          path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
        } },
        lualine_c = { function()
          local branch = vim.b.gitsigns_status_dict or { head = "" }
          local is_head_empty = branch.head ~= ""

          if is_head_empty then
            return string.format("(λ • #%s) ", branch.head or "")
          else
            return ""
          end
        end },
        lualine_x = {
          { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
            hint = ' ' } },
          'filetype'
        },
        lualine_y = { 'diff' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {
          'filename',
          file_status = true, -- displays file status (readonly status, modified status)
          path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
        } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = { 'fugitive', 'nvim-tree', 'toggleterm' }
    }
  end
}

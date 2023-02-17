local terminalKeys = {
    "<m-1>",
    "<m-2>",
    "<m-3>",
}
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    keys = terminalKeys,
    config = function()
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<m-1>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })

        function _G.set_terminal_keymaps()
            local opts = { noremap = true }
            vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
        end

        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

        local Terminal = require("toggleterm.terminal").Terminal

        local horizontal_term2 = Terminal:new({
            direction = "horizontal",
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(
                    term.bufnr,
                    "n",
                    terminalKeys[2],
                    "<cmd>2ToggleTerm size=10 direction=horizontal<cr>",
                    { noremap = true, silent = true }
                )
                vim.api.nvim_buf_set_keymap(
                    term.bufnr,
                    "t",
                    terminalKeys[2],
                    "<cmd>2ToggleTerm size=10 direction=horizontal<cr>",
                    { noremap = true, silent = true }
                )
                vim.api.nvim_buf_set_keymap(
                    term.bufnr,
                    "i",
                    terminalKeys[2],
                    "<cmd>2ToggleTerm size=10 direction=horizontal<cr>",
                    { noremap = true, silent = true }
                )
                vim.api.nvim_buf_set_keymap(term.bufnr, "", terminalKeys[2], "<nop>", { noremap = true, silent = true })
            end,
            count = 2,
        })

        function _HORIZONTAL_TERM2()
            horizontal_term2:toggle(10)
        end

        vim.api.nvim_set_keymap(
            "n",
            terminalKeys[2],
            "<cmd>lua _HORIZONTAL_TERM2()<CR>",
            { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
            "i",
            terminalKeys[2],
            "<cmd>lua _HORIZONTAL_TERM2()<CR>",
            { noremap = true, silent = true }
        )

        local horizontal_term3 = Terminal:new({
            direction = "horizontal",
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(
                    term.bufnr,
                    "n",
                    terminalKeys[3],
                    "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
                    { noremap = true, silent = true }
                )
                vim.api.nvim_buf_set_keymap(
                    term.bufnr,
                    "t",
                    terminalKeys[3],
                    "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
                    { noremap = true, silent = true }
                )
                vim.api.nvim_buf_set_keymap(
                    term.bufnr,
                    "i",
                    terminalKeys[3],
                    "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
                    { noremap = true, silent = true }
                )
                vim.api.nvim_buf_set_keymap(term.bufnr, "", terminalKeys[3], "<nop>", { noremap = true, silent = true })
            end,
            count = 3,
        })

        function _HORIZONTAL_TERM3()
            horizontal_term3:toggle(10)
        end

        vim.api.nvim_set_keymap(
            "n",
            terminalKeys[3],
            "<cmd>lua _HORIZONTAL_TERM3()<CR>",
            { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
            "i",
            terminalKeys[3],
            "<cmd>lua _HORIZONTAL_TERM3()<CR>",
            { noremap = true, silent = true }
        )
    end,
}

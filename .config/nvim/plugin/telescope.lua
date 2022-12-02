local status, telescope = pcall(require, "telescope")
if not status then
	return
end
-- local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions
local keymap = vim.keymap

telescope.setup({
	-- defaults = {
	--   mappings = {
	--     n = {
	--       ['q'] = actions.close
	--     },
	--   },
	-- },
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")
-- Find Files
keymap.set("n", "<leader>ff", function()
	builtin.find_files({
		no_ignore = false,
		no_ignore_parent = false,
		hidden = true,
	})
end)
-- Find Commands
keymap.set("n", "<leader>fc", function()
	builtin.commands()
end)
-- Find String
keymap.set("n", "<leader>fs", function()
	builtin.live_grep()
end)
-- Find Word
keymap.set("n", "<leader>fw", function()
	builtin.grep_string()
end)
-- Find Buffers
keymap.set("n", "<leader>fb", function()
	builtin.buffers()
end)
-- Find Help tags
keymap.set("n", "<leader>fh", function()
	builtin.help_tags()
end)
-- Workspace Diagnostics
keymap.set("n", "<leader>wd", function()
	builtin.diagnostics()
end)
-- file Browser
keymap.set("n", "<leader>b", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
	-- keymap.set('n', '<leader><leader>', function()
	--   builtin.resume()
	-- end)
end)

-- Git Status
keymap.set("n", "<leader>gs", function()
	builtin.git_status()
end)
-- Git Commits
keymap.set("n", "<leader>gc", function()
	builtin.git_commits()
end)
-- Git branches
keymap.set("n", "<leader>gb", function()
	builtin.git_branches()
end)
-- Git current File Commits
keymap.set("n", "<leader>gfc", function()
	builtin.git_bcommits()
end)
